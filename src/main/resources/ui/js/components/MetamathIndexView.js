"use strict";

const MetamathIndexView = ({elems}) => {

    const s = {
        PAGE_NUMBER: 'PAGE_NUMBER',
        TYPE_FILTER: 'TYPE_FILTER',
        LABEL_FILTER: 'LABEL_FILTER',
    }
    const itemsPerPage = 50

    const [state, setState] = useState(() => createNewState({}))

    function createNewState({prevState, params}) {

        function getParamValue(paramName, defaulValue) {
            return params?.[paramName]??prevState?.[paramName]??defaulValue
        }

        const pageNumber = getParamValue(s.PAGE_NUMBER,0)
        const typeFilter = getParamValue(s.TYPE_FILTER,null)
        const labelFilter = getParamValue(s.LABEL_FILTER,null)
        return createObj({
            [s.PAGE_NUMBER]: pageNumber,
            [s.TYPE_FILTER]: typeFilter,
            [s.LABEL_FILTER]: labelFilter,
        })
    }

    function renderTable() {
        const pageNumber = state[s.PAGE_NUMBER];
        const minIdx = itemsPerPage*pageNumber
        const maxIdx = itemsPerPage*(pageNumber+1)-1
        const idsToShow = ints(minIdx,maxIdx)
        return re(MetamathIndexTable, {idsToShow,idsToShowStr:idsToShow.join(','),allElems:elems})
    }

    return renderTable()
}
