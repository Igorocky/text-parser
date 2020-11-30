"use strict";

const MetamathAssertionView = ({type, name, description, varTypes, assertion, proof}) => {

    const s = {
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
            return nodes?.reduce((acc, node) => ({...acc,[node.id]:node}),{})
        }

        let nodesToShow
        if (proof && hideTypes) {
            const requiredNodeIds = [
                proof.length,
                ...proof.flatMap(node =>
                    hasNoValue(node.args)?[]:node.args.filter((id,idx) => idx >= node.numOfTypes)
                )
            ]
            nodesToShow = proof.filter(({id}) => requiredNodeIds.includes(id))
        } else {
            nodesToShow = proof
        }
        return createObj({
            [s.NODES_TO_SHOW]: nodesToShow,
            [s.NODES_TO_SHOW_MAP]: createNodesMap(nodesToShow),
            [s.HIDE_TYPES]: hideTypes,
        })
    }

    const varColors = createVarColors({varTypes})

    function renderProof() {
        if (proof) {
            const tableStyle = {borderCollapse: 'collapse', border: '1px solid black', fontSize: '15px', padding:'10px'}
            return RE.Fragment({},
                RE.Container.row.left.center({},{},
                    RE.Button(
                        {
                            onClick: () => setState(prevState => createNewState({prevState,params:{[s.HIDE_TYPES]:!prevState[s.HIDE_TYPES]}}))
                        },
                        state[s.HIDE_TYPES] ? "Show types" : "Hide types"
                    )
                ),
                RE.table({style:{borderCollapse: 'collapse', tableLayout: 'fixed', width:'100%'}},
                    RE.tbody({style:{borderCollapse: 'collapse'}},
                        RE.tr({style: {}},
                            RE.th({key:'node-id', style:{width:'2%'}}),
                            RE.th({key:'explanation', style:{width:'98%'}}),
                        ),
                        state[s.NODES_TO_SHOW].map(node => RE.tr({key: `node-${node.id}`, id:node.id, style: {}},
                            RE.td({style: {...tableStyle}}, node.id),
                            RE.td({style: {...tableStyle, overflow:'auto'}},
                                hasValue(node.args)
                                    ? re(RuleProofNode,{parentLabel:name, node, allNodes:state[s.NODES_TO_SHOW_MAP], varColors, hideTypes:state[s.HIDE_TYPES]})
                                    : re(ConstProofNode,{node, varColors})
                            ),
                        ))
                    )
                )
            )
        }
    }

    return RE.Container.col.top.left({},{style:{marginBottom:'20px'}},
        RE.Container.row.center.center({},{style:{fontSize:'18px', fontWeight:'700', marginRight:'10px'}},
            RE.span({},type),
            RE.a({href:`http://us.metamath.org/mpeuni/${name}.html`, style:{color:'rgb(0, 102, 51)', textDecoration:'none'}},name),
        ),
        RE.div({}, description),
        RE.div({}, re(Assertion,{...assertion,varColors})),
        renderProof()
    )
}
