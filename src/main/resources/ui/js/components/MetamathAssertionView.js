"use strict";

function MetamathAssertionView({type, name, description, varTypes, params, retVal, proof}) {

    useEffect(() => {
        document.title = `${name} - Metamath Proof Explorer`
    }, [])

    const {openLicenseDialog, renderLicenseDialog} = useLicenseDialog()

    const s = {
        NODES_TO_SHOW: 'NODES_TO_SHOW',
        NODES_TO_SHOW_MAP: 'NODES_TO_SHOW_MAP',
        HIDE_TYPES: 'HIDE_TYPES',
        EXPANDED_NODES: 'EXPANDED_NODES',
        STEP_NUMBERS: 'STEP_NUMBERS',
    }

    const [state, setState] = useState(() => createNewState({}))

    function createNewState({prevState, params}) {

        function getParamValue(paramName, defaulValue) {
            return params?.[paramName]??prevState?.[paramName]??defaulValue
        }

        proof?.forEach((n,i) => n.idx=i)

        const hideTypes = getParamValue(s.HIDE_TYPES, true)

        function createNodesMap(nodes) {
            return nodes?.reduce((acc, node) => ({...acc,[node.id]:node}),{})
        }

        let nodesToShow
        if (proof && hideTypes) {
            const requiredNodeIds = [
                proof[proof.length-1].id,
                ...proof.flatMap(node =>
                    hasNoValue(node.args)?[]:node.args.filter((id,idx) => idx >= node.numOfTypes)
                )
            ]
            nodesToShow = proof.filter(({id}) => requiredNodeIds.includes(id))
        } else {
            nodesToShow = proof
        }

        const expandedNodes = getParamValue(s.EXPANDED_NODES,null)

        const stepNumbers = nodesToShow?.reduce((acc, {id}, i) => ({...acc, [id]:i+1}), {})

        return createObj({
            [s.NODES_TO_SHOW]: nodesToShow,
            [s.NODES_TO_SHOW_MAP]: createNodesMap(nodesToShow),
            [s.HIDE_TYPES]: hideTypes,
            [s.EXPANDED_NODES]: hasValue(expandedNodes)?expandedNodes:proof?.map(() => false),
            [s.STEP_NUMBERS]: stepNumbers,
        })
    }

    const varColors = createVarColors({varTypes})

    function createExpandHandler(node) {
        return () => setState(
            prevState => createNewState({
                prevState,
                params: {[s.EXPANDED_NODES]:modifyAtIdx(prevState[s.EXPANDED_NODES],node.idx,e=>!e)}
            })
        )
    }

    function renderNodeExpression({node, varColors, hideTypes}) {
        const expandButtonStyle = {
            color: 'lightgrey',
            border: '1px solid',
            marginRight: '3px',
            paddingTop: '1px',
            paddingRight: '3px',
            paddingBottom: '0px',
            paddingLeft: '2px',
            fontFamily:'courier',
            fontSize:'10px'
        }
        if (hasNoValue(node.args)) {
            return RE.Fragment({},
                RE.a({style:{...expandButtonStyle, opacity:0}},'+'),
                re(ConstProofNode, {node, varColors})
            )
        } else {
            if (state[s.EXPANDED_NODES][node.idx]) {
                return RE.Fragment({},
                    RE.a(
                        {
                            style:{...expandButtonStyle, cursor:'pointer'},
                            onClick: createExpandHandler(node)
                            },
                        '-'
                    ),
                    re(RuleProofNode, {
                        node,
                        allNodes: state[s.NODES_TO_SHOW_MAP],
                        varColors,
                        hideTypes,
                        stepNumbers: state[s.STEP_NUMBERS]
                    })
                )
            } else {
                return RE.Fragment({},
                    RE.a(
                        {
                            style:{...expandButtonStyle, cursor:'pointer'},
                            onClick: createExpandHandler(node)
                            },
                        '+'
                    ),
                    re(ConstProofNode, {node, varColors})
                )
            }
        }
    }

    function renderProof() {
        if (proof) {
            const tableStyle = {borderCollapse: 'collapse', border: '1px solid black', fontSize: '15px', padding:'5px'}
            const hideTypes = state[s.HIDE_TYPES]
            const stepNumbers = state[s.STEP_NUMBERS]
            return RE.Fragment({},
                RE.Container.row.left.center({},{},
                    RE.Button(
                        {
                            onClick: () => setState(prevState => createNewState({prevState,params:{[s.HIDE_TYPES]:!prevState[s.HIDE_TYPES]}}))
                        },
                        state[s.HIDE_TYPES] ? "Show types" : "Hide types"
                    )
                ),
                RE.table({style:{borderCollapse: 'collapse'/*, tableLayout: 'fixed', width:'100%'*/}},
                    RE.tbody({style:{borderCollapse: 'collapse'}},
                        RE.tr({style: {}},
                            RE.th({key:'node-id', style:{...tableStyle,/*width:'2%'*/}}, 'Step'),
                            RE.th({key:'explanation', style:{...tableStyle,/*width:'98%'*/}}, 'Hyp'),
                            RE.th({key:'explanation', style:{...tableStyle,/*width:'98%'*/}}, 'Ref'),
                            RE.th({key:'explanation', style:{...tableStyle,/*width:'98%'*/}}, 'Expression'),
                        ),
                        state[s.NODES_TO_SHOW].map(node => {
                            const hyp = hideTypes ? node.args?.filter((a,i) => node.numOfTypes <= i) : node.args
                            const maxHypIdx = hyp?.length - 1
                            return RE.tr({key: `node-${node.id}`, id: node.id, style: {}, className: 'proof-row'},
                                RE.td({style: {...tableStyle}}, stepNumbers[node.id]),
                                RE.td({style: {...tableStyle}},
                                    hyp?.map((h,i) => RE.Fragment({},
                                        RE.a({href:`#${h}`},stepNumbers[h]),
                                        i < maxHypIdx ? ', ' : ''
                                    ))
                                ),
                                RE.td({style: {...tableStyle}},
                                    (node.type === 'P' || node.type === 'A')
                                        ? RE.a({href:createUrlOfAssertion(node.label)},node.label)
                                        : ((node.type === 'E' ? 'E ' : '') + node.label)
                                ),
                                RE.td({style: {...tableStyle/*, overflow:'auto'*/}},
                                    renderNodeExpression({node, varColors, hideTypes})
                                ),
                            )
                        })
                    )
                )
            )
        }
    }

    return RE.Fragment({},
        RE.div({style:{textAlign:'left', fontSize:'18px', fontWeight:'700', marginRight:'10px', marginBottom:'20px'}},
            RE.span({style:{marginRight:'10px'}},type),
            RE.a({href:`http://us.metamath.org/mpeuni/${name}.html`, style:{color:'rgb(0, 102, 51)', textDecoration:'none'}},name),
            RE.span({style:{float:'right',  fontWeight:'normal', fontSize:'12px'}},
                RE.a({href:`http://us.metamath.org/mpeuni/${name}.html`, style:{marginRight:'10px'}},"Unicode version"),
                RE.a({href:`../index.html`, style:{}},"Index")
            ),
        ),
        RE.div({style:{marginBottom:'20px'}}, description),
        RE.div({style:{marginBottom:'20px'}}, re(Assertion,{params,retVal,varColors})),
        renderProof(),
        RE.div({style:{marginTop:'20px', fontSize:'11px', face:"sans-serif"}},
            "Copyright terms: ",
            RE.a({onClick:openLicenseDialog, href:'#'},"Public domain")
        ),
        renderLicenseDialog()
    )
}
