"use strict";

const MetamathIndexTable = React.memo(({idsToShowStr, idsToShow, allElems}) => {

    const tableStyle = {borderCollapse: 'collapse', border: '0px solid black', fontSize: '15px', padding: '10px'}

    console.log("rerender MetamathIndexTable")

    function createUrlOfAssertion(label) {
        return 'data/' + getRelPath({label}).map(replaceDots).join('/') + '/' + replaceDots(label) + '.html'
    }

    return RE.table({style: {borderCollapse: 'collapse', tableLayout: 'fixed', width: '100%'}},
        RE.tbody({style: {borderCollapse: 'collapse'}},
            RE.tr({style: {}},
                RE.td({key: 'idx', style: {...tableStyle, width: '5%', fontWeight:'bold'}},),
                RE.td({key: 'type', style: {...tableStyle, width: '10%', fontWeight:'bold'}}, "Type"),
                RE.td({key: 'lable', style: {...tableStyle, width: '10%', fontWeight:'bold'}}, "Label"),
                RE.td({key: 'expr', style: {...tableStyle, width: '65%', fontWeight:'bold'}}, "Expression"),
            ),
            allElems.filter(e => idsToShow.includes(e.id)).map(indexElem => RE.tr(
                {
                    key: `row-${indexElem.id}`,
                    className: "index-row"
                },
                RE.td(
                    {
                        style: {...tableStyle, cursor: 'pointer'},
                        ...link({urlGetter: () => createUrlOfAssertion(indexElem.label)})
                    },
                    indexElem.id + 1
                ),
                RE.td(
                    {
                        style: {...tableStyle, cursor: 'pointer'},
                        ...link({urlGetter: () => createUrlOfAssertion(indexElem.label)})
                        },
                    indexElem.type
                ),
                RE.td(
                    {
                        style: {...tableStyle, cursor: 'pointer'},
                        ...link({urlGetter: () => createUrlOfAssertion(indexElem.label)})
                        },
                    indexElem.label
                ),
                RE.td(
                    {
                        style: {...tableStyle, overflow: 'auto', fontFamily: 'courier', fontSize: '15px'}
                    },
                    indexElem.expression.join(' ')
                ),
            ))
        )
    )
}, (o, n) => o.idsToShowStr === n.idsToShowStr)
