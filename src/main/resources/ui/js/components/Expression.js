"use strict";

function Expression({expr,varColors,highlightIndexes}) {

    const {isParenthesis,onMouseEnter,onMouseLeave,getBackgroundColor,isPinned,pin,unpin} = useParenthesesHighlighting({expr})

    const [anchorEl, setAnchorEl] = useState(null)
    const [anchoredIdx, setAnchoredIdx] = useState(null)

    function renderPopupContent() {
        if (isParenthesis(expr[anchoredIdx])) {
            return ['lightcoral', 'gold', 'yellow', 'lightgreen', 'olivedrab', 'lightskyblue', 'mediumslateblue'].map(color => RE.span(
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
        } else {
            return RE.span(
                {
                    style:{cursor: 'pointer'},
                    onClick: () => {
                        saveToLocalStorage(
                            METAMATH_INDEX_VIEW_LOC_STORAGE_SYMBOLS_FILTER_KEY,
                            expr[anchoredIdx]
                        )
                        setAnchorEl(null)
                        setAnchoredIdx(null)
                        window.open(relPathToRoot + '/index.html')
                    }
                },
                `Search: `,
                RE.span(
                    {style: {fontFamily: 'courier', fontSize: '15px', fontWeight:'bold'}},
                    expr[anchoredIdx]
                )
            )
        }
    }

    function renderPopUp() {
        if (anchorEl) {
            return RE.ClickAwayListener({onClickAway: () => setAnchorEl(null)},
                RE.Popper({open: true, anchorEl, placement: 'top-start'},
                    RE.Paper({style:{padding:'10px'}},
                        renderPopupContent()
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
                const isConstant = !hasValue(varColors[str])
                let backgroundColor = getBackgroundColor(idx)??(highlightIndexes?.includes(idx)?'yellow':null)
                return RE.span(
                    {
                        style: {
                            color,
                            fontWeight: varColors[str]?'bold':'normal',
                            backgroundColor,
                        },
                        onMouseEnter: () => onMouseEnter(idx),
                        onMouseLeave: () => onMouseLeave(idx),
                        onClick: event => {
                            if (isParenthesis(str)) {
                                if (isPinned(idx)) {
                                    unpin(idx)
                                    setAnchorEl(null)
                                    setAnchoredIdx(null)
                                    onMouseLeave(idx)
                                } else if (anchorEl) {
                                    setAnchorEl(null)
                                } else {
                                    setAnchorEl(event.nativeEvent.target)
                                    setAnchoredIdx(idx)
                                }
                            } else if (isConstant) {
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
