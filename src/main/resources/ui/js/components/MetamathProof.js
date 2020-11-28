"use strict";

const MetamathProof = ({proofDto}) => {

    const s = {
        PROOF_DTO: 'PROOF_DTO',
        NODES_TO_SHOW: 'NODES_TO_SHOW',
        NODES_TO_SHOW_MAP: 'NODES_TO_SHOW_MAP',
        HIDE_TYPES: 'HIDE_TYPES',
    }

    const [state, setState] = useState(() => createNewState({}))

    function createNewState({prevState, params}) {

        function getParamValue(paramName, defaulValue) {
            return params?.[paramName]??prevState?.[paramName]??defaulValue
        }

        const hideTypes = getParamValue(s.HIDE_TYPES, true)

        function createNodesMap(nodes) {
            return nodes.reduce((acc, node) => ({...acc,[node.id]:node}),{})
        }

        let nodesToShow
        if (hideTypes) {
            const requiredNodeIds = [
                1,
                ...proofDto.nodes.flatMap(node =>
                    hasNoValue(node.args)?[]:node.args.filter((id,idx) => idx >= node.numOfTypes)
                )
            ]
            nodesToShow = proofDto.nodes.filter(({id}) => requiredNodeIds.includes(id))
        } else {
            nodesToShow = proofDto.nodes
        }
        return createObj({
            [s.PROOF_DTO]: proofDto,
            [s.NODES_TO_SHOW]: nodesToShow,
            [s.NODES_TO_SHOW_MAP]: createNodesMap(nodesToShow),
            [s.HIDE_TYPES]: hideTypes,
        })
    }

    const typeColors = {wff:'blue',term:'black',setvar:'red',['class']:'magenta'}
    const varTypes = state[s.PROOF_DTO].varTypes
    const varColors = Object.getOwnPropertyNames(varTypes)
        .map(varName => [varName,typeColors[varTypes[varName]]??'gold'])
        .reduce((acc,[varName,color]) => ({...acc, [varName]:color}), {})

    const tableStyle = {borderCollapse: 'collapse', border: '1px solid black', fontSize: '15px', padding:'10px'};

    function renderProof() {
        return RE.table({style:{borderCollapse: 'collapse', tableLayout: 'fixed', width:'100%'}},
            RE.tbody({style:{borderCollapse: 'collapse'}},
                RE.tr({style: {}},
                    RE.th({key:'node-id', style:{width:'2%'}}),
                    RE.th({key:'explanation', style:{width:'98%'}}),
                ),
                state[s.NODES_TO_SHOW].map(node => RE.tr({key: `node-${node.id}`, id:node.id, style: {}},
                    RE.td({style: {...tableStyle}}, node.id),
                    RE.td({style: {...tableStyle, overflow:'auto'}},
                        hasValue(node.args)
                            ? re(RuleProofNode,{node, allNodes:state[s.NODES_TO_SHOW_MAP], varColors, hideTypes:state[s.HIDE_TYPES]})
                            : re(ConstProofNode,{node})
                    ),
                ))
            )
        )
    }

    return RE.Container.col.top.left({},{},
        RE.Container.row.left.center({},{},
            RE.Button(
                {
                    onClick: () => setState(prevState => createNewState({prevState,params:{[s.HIDE_TYPES]:!prevState[s.HIDE_TYPES]}}))
                },
                state[s.HIDE_TYPES] ? "Show types" : "Hide types"
            )
        ),
        renderProof()
    )
}
