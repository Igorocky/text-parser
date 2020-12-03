"use strict";

const MetamathIndexTable = React.memo(({idsToShowStr, idsToShow, allElems}) => {

    const tableStyle = {borderCollapse: 'collapse', border: '0px solid black', fontSize: '15px', padding: '10px'}

    function createUrlOfAssertion(label) {
        return 'data/' + getRelPath({label}).map(replaceDots).join('/') + '/' + replaceDots(label) + '.html'
    }

    return RE.table({style: {borderCollapse: 'collapse', tableLayout: 'fixed', width: '100%'}},
        RE.tbody({style: {borderCollapse: 'collapse'}},
            RE.tr({style: {}},
                RE.td({key: 'idx', style: {...tableStyle, width: '5%', fontWeight:'bold'}},),
                RE.td({key: 'type', style: {...tableStyle, width: '10%', fontWeight:'bold'}}, "Type"),
                RE.td({key: 'label', style: {...tableStyle, width: '10%', fontWeight:'bold'}}, "Label"),
                RE.td({key: 'expr', style: {...tableStyle, width: '65%', fontWeight:'bold'}}, "Expression"),
            ),
            allElems.filter(e => idsToShow.includes(e.id)).map(indexElem => {
                const varColors = createVarColors({varTypes:indexElem.varTypes})
                return RE.tr(
                    {key: `row-${indexElem.id}`, className: "index-row"},
                    RE.td(
                        {style: {...tableStyle}},
                        indexElem.id + 1
                    ),
                    RE.td(
                        {style: {...tableStyle}},
                        decompressAssertionType(indexElem.type)
                    ),
                    RE.td(
                        {style: {...tableStyle}},
                        RE.a({href:createUrlOfAssertion(indexElem.label)},indexElem.label),
                    ),
                    RE.td(
                        {
                            style: {...tableStyle, overflow: 'auto', fontFamily: 'courier', fontSize: '15px'}
                        },
                        indexElem.hypotheses.length?RE.ul({},
                            indexElem.hypotheses.map((hyp,idx) => RE.li({key:idx},
                                applyColors({expr:hyp,varColors})
                            ))
                        ):null,
                        applyColors({expr:indexElem.expression,varColors})
                    ),
                )
            })
        )
    )
}, (o, n) => o.idsToShowStr === n.idsToShowStr)
