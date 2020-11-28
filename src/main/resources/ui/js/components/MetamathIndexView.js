"use strict";

const MetamathIndexView = ({elems}) => {

    const s = {
        PAGE_NUMBER: 'PAGE_NUMBER',
        NUMBER_OF_PAGES: 'NUMBER_OF_PAGES',
        TYPE_FILTER: 'TYPE_FILTER',
        LABEL_FILTER: 'LABEL_FILTER',
        IDS_TO_SHOW: 'IDS_TO_SHOW',
        FILTERED_ELEMS: 'FILTERED_ELEMS',
    }
    const itemsPerPage = 20

    const [state, setState] = useState(() => createNewState({}))
    const [labelFilter, setLabelFilter] = useState('')

    function createNewState({prevState, params}) {

        function getParamValue(paramName, defaulValue) {
            return params?.[paramName]??prevState?.[paramName]??defaulValue
        }

        const typeFilter = getParamValue(s.TYPE_FILTER,'')
        const labelFilter = getParamValue(s.LABEL_FILTER,'').trim().toLowerCase()

        const filteredElems = elems.filter(elem =>
            (!labelFilter || elem.label.toLowerCase().indexOf(labelFilter) >= 0)
            && (typeFilter == '' || elem.type == typeFilter)
        )
        const numOfPages = Math.ceil(filteredElems.length/itemsPerPage)

        const pageNumber = Math.max(
            1,
            Math.min(
                numOfPages,
                (prevState?.[s.TYPE_FILTER]!=typeFilter || prevState?.[s.LABEL_FILTER]!=labelFilter)
                    ? 1
                    : getParamValue(s.PAGE_NUMBER,1)
            )
        )

        const minIdx = itemsPerPage*(pageNumber-1)
        const maxIdx = itemsPerPage*pageNumber-1
        const idsToShow = filteredElems.filter((e,i) => minIdx <= i && i <= maxIdx).map(e => e.id)

        return createObj({
            [s.PAGE_NUMBER]: pageNumber,
            [s.NUMBER_OF_PAGES]: numOfPages,
            [s.TYPE_FILTER]: typeFilter,
            [s.LABEL_FILTER]: labelFilter,
            [s.IDS_TO_SHOW]: idsToShow,
            [s.FILTERED_ELEMS]: filteredElems,
        })
    }

    function renderTable() {
        const idsToShow = state[s.IDS_TO_SHOW]
        return re(MetamathIndexTable, {
            idsToShow,
            idsToShowStr:idsToShow.join(','),
            allElems:state[s.FILTERED_ELEMS]
        })
    }

    function renderPagination() {
        return state[s.NUMBER_OF_PAGES]>1?re(Pagination,{
            numOfPages:state[s.NUMBER_OF_PAGES],
            curPage:state[s.PAGE_NUMBER],
            onChange: newPageNum => setState(prevState => createNewState({prevState, params:{[s.PAGE_NUMBER]:newPageNum}}))
        }):null
    }

    function renderControls() {
        return RE.Container.row.left.center({},{style: {marginRight:'10px'}},
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
                        style: {width: 150}
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
            ),
            renderPagination()
        )
    }

    return RE.Container.col.top.left({},{style: {marginBottom:'10px'}},
        renderControls(),
        renderTable(),
    )
}
