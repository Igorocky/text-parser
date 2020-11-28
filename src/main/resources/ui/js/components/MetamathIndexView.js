"use strict";

const MetamathIndexView = ({elems}) => {

    const s = {
        PAGE_NUMBER: 'PAGE_NUMBER',
        TYPE_FILTER: 'TYPE_FILTER',
        LABEL_FILTER: 'LABEL_FILTER',
    }
    const itemsPerPage = 50

    const [state, setState] = useState(() => createNewState({}))
    const [labelFilter, setLabelFilter] = useState('')

    function createNewState({prevState, params}) {

        function getParamValue(paramName, defaulValue) {
            return params?.[paramName]??prevState?.[paramName]??defaulValue
        }

        const typeFilter = getParamValue(s.TYPE_FILTER,'')
        const labelFilter = getParamValue(s.LABEL_FILTER,'')
        return createObj({
            [s.PAGE_NUMBER]: 0,
            [s.TYPE_FILTER]: typeFilter,
            [s.LABEL_FILTER]: labelFilter,
        })
    }

    function renderTable() {
        const labelFilter = state[s.LABEL_FILTER].trim().toLowerCase()
        const typeFilter = state[s.TYPE_FILTER]
        const filteredElems = elems.filter(elem =>
            (!labelFilter || elem.label.toLowerCase().indexOf(labelFilter) >= 0)
            && (typeFilter == '' || elem.type == typeFilter)
        )
        const pageNumber = state[s.PAGE_NUMBER];
        const minIdx = itemsPerPage*pageNumber
        const maxIdx = itemsPerPage*(pageNumber+1)-1
        const idsToShow = filteredElems.filter((e,i) => minIdx <= i && i <= maxIdx).map(e => e.id)
        return re(MetamathIndexTable, {idsToShow,idsToShowStr:idsToShow.join(','),allElems:filteredElems})
    }
    return RE.Container.col.top.left({},{style: {marginBottom:'10px'}},
        RE.Container.row.left.center({},{style: {marginRight:'10px'}},
            RE.FormControl({variant:'outlined',size: 'small'},
                RE.InputLabel({}, 'Type'),
                RE.Select(
                    {
                        value: state[s.TYPE_FILTER],
                        label:'Type',
                        onChange: event => {
                            const newTypeFilter = event.target.value
                            if (state[s.TYPE_FILTER] !== newTypeFilter) {
                                setState(prevState => createNewState({prevState, params:{[s.TYPE_FILTER]:newTypeFilter}}))
                            }
                        },
                        style: {width: 200}
                    },
                    ['', ...new Set(elems.map(e => e.type))].map(t =>
                        RE.MenuItem({key: 'assertionType'+t, value: t}, t!==''?t:'All')
                    )
                )
            ),
            RE.TextField(
                {
                    variant: 'outlined', label: 'Label',
                    style: {width: 300},
                    size: 'small',
                    onKeyDown: event => event.nativeEvent.keyCode == 13
                        ? setState(prevState => createNewState({prevState, params:{[s.LABEL_FILTER]:labelFilter}}))
                        : null,
                    onChange: event => setLabelFilter(event.target.value),
                    value: labelFilter
                }
            )
        ),
        renderTable()
    )
}
