"use strict";

const POSSIBLE_PARENTHESES_PAIRS = [
    ['(',')'],
    ['[',']'],
    ['{','}'],
]

function useParenthesesHighlighting({expr}) {
    const matchingParenIndexes = useMemo(() => {
        let result = {}
        const parenStack = []
        for (let i = 0; i < expr.length; i++) {
            const sym = expr[i]
            const opening = isOpeningParen(sym)
            if (hasValue(opening)) {
                parenStack.push({idx:i,paren:sym})
            } else {
                const closing = isClosingParen(sym)
                if (hasValue(closing)) {
                    if (parenStack.length == 0) {
                        console.log('parenStack.length == 0')
                    } else if (!isMatching(parenStack[parenStack.length-1].paren, closing)) {
                        console.log('!isMatching(parenStack[parenStack.length-1].paren, closing)')
                    } else {
                        const opening = parenStack.pop()
                        result = {...result, [opening.idx]:i, [i]:opening.idx}
                    }
                }
            }
        }
        return result
    })

    const [pinnedIndexes, setPinnedIndexes] = useState({})
    const [hoveredOverIndexes, setHoveredOverIndexes] = useState({})

    function isOpeningParen(paren) {
        return POSSIBLE_PARENTHESES_PAIRS.find(([o,c]) => o === paren)?.[0]
    }

    function isClosingParen(paren) {
        return POSSIBLE_PARENTHESES_PAIRS.find(([o,c]) => c === paren)?.[1]
    }

    function isMatching(opening,closing) {
        return POSSIBLE_PARENTHESES_PAIRS.find(([o,c]) => o === opening)?.[1] === closing
    }

    function isParenthesis(sym) {
        return POSSIBLE_PARENTHESES_PAIRS.indexOf(([o,c]) => o === sym || c === sym) >= 0
    }

    return {
        onMouseEnter: idx => {
            const matchingParenIdx = matchingParenIndexes[idx]
            if (hasValue(matchingParenIdx)) {
                setHoveredOverIndexes({[idx]:'orange',[matchingParenIdx]:'orange'})
            }
        },
        onMouseLeave: () => setHoveredOverIndexes({}),
        getBackgroundColor: idx => hoveredOverIndexes[idx]??pinnedIndexes[idx],
        isParenthesis,
        isPinned: idx => hasValue(pinnedIndexes[idx]),
        pin: ({idx,color}) => {
            const matchingParenIdx = matchingParenIndexes[idx]
            if (hasValue(matchingParenIdx)) {
                setPinnedIndexes(prev => ({...prev, [idx]:color, [matchingParenIdx]:color}))
            }
        },
        unpin: idx => {
            const matchingParenIdx = matchingParenIndexes[idx]
            if (hasValue(matchingParenIdx)) {
                setPinnedIndexes(prev => ({...prev, [idx]:undefined, [matchingParenIdx]:undefined}))
            }
        }
    }
}

function Expression({expr,varColors,highlightIndexes}) {

    const {onMouseEnter,onMouseLeave,getBackgroundColor,isPinned,pin,unpin} = useParenthesesHighlighting({expr})

    const [anchorEl, setAnchorEl] = useState(null)
    const [anchoredIdx, setAnchoredIdx] = useState(null)

    function renderPopUp() {
        if (anchorEl) {
            return RE.ClickAwayListener({onClickAway: () => setAnchorEl(null)},
                RE.Popper({open: true, anchorEl, placement: 'top-start'},
                    RE.Paper({style:{padding:'10px'}},
                        ['lightcoral', 'gold', 'yellow', 'lightgreen', 'olivedrab', 'lightskyblue', 'mediumslateblue'].map(color => RE.span(
                            {
                                style: {
                                    width: '20px',
                                    height: '20px',
                                    backgroundColor: color,
                                    color,
                                    margin: '3px',
                                    cursor: 'pointer',
                                    fontFamily: 'courier',
                                    padding: '5px'
                                },
                                className: 'color-selector-elem',
                                onClick: () => {
                                    pin({idx: anchoredIdx, color})
                                    setAnchorEl(null)
                                    setAnchoredIdx(null)
                                }
                            },
                            '.'
                        ))
                    )
                )
            )
        }
    }

    function renderExpresionText() {
        const maxIdx = expr.length-1
        return expr
            .map((str,idx) => {
                const color = varColors[str]??'black'
                let backgroundColor = getBackgroundColor(idx)??(highlightIndexes?.includes(idx)?'yellow':null)
                return RE.span(
                    {
                        style: {
                            color,
                            fontWeight: (varColors[str] || highlightIndexes?.includes(idx))?'bold':'normal',
                            backgroundColor,
                        },
                        onMouseEnter: () => onMouseEnter(idx),
                        onMouseLeave: () => onMouseLeave(idx),
                        onClick: event => {
                            if (isPinned(idx)) {
                                unpin(idx)
                            }
                            if (anchorEl) {
                                setAnchorEl(null)
                            } else {
                                setAnchorEl(event.nativeEvent.target)
                                setAnchoredIdx(idx)
                            }
                        }
                    },
                    str
                )
            })
            .flatMap((e,i) => i==maxIdx?[e]:[e, ' '])
    }

    return RE.Fragment({},
        renderExpresionText(),
        renderPopUp()
    )
}
