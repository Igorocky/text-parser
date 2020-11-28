"use strict";

const MetamathIndexTable = React.memo(({idsToShowStr, idsToShow, allElems}) => {

    const tableStyle = {borderCollapse: 'collapse', border: '0px solid black', fontSize: '15px', padding: '10px'}

    console.log("rerender MetamathIndexTable")

    function createUrlOfAssertion(label) {
        return 'data/' + getRelPath({label}).join('/') + '/' + replaceDots(label) + '.html'
    }

    return RE.table({style: {borderCollapse: 'collapse', tableLayout: 'fixed', width: '100%'}},
        RE.tbody({style: {borderCollapse: 'collapse'}},
            RE.tr({style: {}},
                RE.th({key: 'idx', style: {width: '5%'}},),
                RE.th({key: 'type', style: {width: '10%'}}, "Type"),
                RE.th({key: 'lable', style: {width: '10%'}}, "Label"),
                RE.th({key: 'expr', style: {width: '65%'}}, "Expression"),
            ),
            allElems.filter((e, i) => idsToShow.includes(i)).map(indexElem => RE.tr(
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
                RE.td({style: {...tableStyle, overflow: 'auto'}}, indexElem.expression.join(' ')),
            ))
        )
    )
}, (o, n) => o.idsToShowStr === n.idsToShowStr)
