"use strict";

const MetamathProof = () => {

    const s = {
        PROOF_DTO: 'PROOF_DTO',
        PROOF_NODES_MAP: 'PROOF_NODES_MAP',
    }

    const [state, setState] = useState(() => createNewState({}))

    function createNewState({prevState, params}) {
        let proofDto = [{"id":0,"args":[29,26,24,1],"label":"mp","params":[["wff","P"],["wff","Q"],["|-","P"],["|-","(","P","->","Q",")"]],"retVal":["|-","Q"],"substitution":{"P":["(","t","+","0",")","=","t"],"Q":["t","=","t"]},"expr":["|-","t","=","t"]},{"id":1,"args":[19,10,8,2],"label":"mp","params":[["wff","P"],["wff","Q"],["|-","P"],["|-","(","P","->","Q",")"]],"retVal":["|-","Q"],"substitution":{"P":["(","t","+","0",")","=","t"],"Q":["(","(","t","+","0",")","=","t","->","t","=","t",")"]},"expr":["|-","(","(","t","+","0",")","=","t","->","t","=","t",")"]},{"id":2,"args":[5,4,3],"label":"a1","params":[["term","t"],["term","r"],["term","s"]],"retVal":["|-","(","t","=","r","->","(","t","=","s","->","r","=","s",")",")"],"substitution":{"r":["t"],"s":["t"],"t":["(","t","+","0",")"]},"expr":["|-","(","(","t","+","0",")","=","t","->","(","(","t","+","0",")","=","t","->","t","=","t",")",")"]},{"id":3,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":4,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":5,"args":[7,6],"label":"tpl","params":[["term","t"],["term","r"]],"retVal":["term","(","t","+","r",")"],"substitution":{"r":["0"],"t":["t"]},"expr":["term","(","t","+","0",")"]},{"id":6,"args":[],"label":"tze","params":[],"retVal":["term","0"],"substitution":{},"expr":["term","0"]},{"id":7,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":8,"args":[9],"label":"a2","params":[["term","t"]],"retVal":["|-","(","t","+","0",")","=","t"],"substitution":{"t":["t"]},"expr":["|-","(","t","+","0",")","=","t"]},{"id":9,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":10,"args":[14,11],"label":"wim","params":[["wff","P"],["wff","Q"]],"retVal":["wff","(","P","->","Q",")"],"substitution":{"P":["(","t","+","0",")","=","t"],"Q":["t","=","t"]},"expr":["wff","(","(","t","+","0",")","=","t","->","t","=","t",")"]},{"id":11,"args":[13,12],"label":"weq","params":[["term","t"],["term","r"]],"retVal":["wff","t","=","r"],"substitution":{"r":["t"],"t":["t"]},"expr":["wff","t","=","t"]},{"id":12,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":13,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":14,"args":[16,15],"label":"weq","params":[["term","t"],["term","r"]],"retVal":["wff","t","=","r"],"substitution":{"r":["t"],"t":["(","t","+","0",")"]},"expr":["wff","(","t","+","0",")","=","t"]},{"id":15,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":16,"args":[18,17],"label":"tpl","params":[["term","t"],["term","r"]],"retVal":["term","(","t","+","r",")"],"substitution":{"r":["0"],"t":["t"]},"expr":["term","(","t","+","0",")"]},{"id":17,"args":[],"label":"tze","params":[],"retVal":["term","0"],"substitution":{},"expr":["term","0"]},{"id":18,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":19,"args":[21,20],"label":"weq","params":[["term","t"],["term","r"]],"retVal":["wff","t","=","r"],"substitution":{"r":["t"],"t":["(","t","+","0",")"]},"expr":["wff","(","t","+","0",")","=","t"]},{"id":20,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":21,"args":[23,22],"label":"tpl","params":[["term","t"],["term","r"]],"retVal":["term","(","t","+","r",")"],"substitution":{"r":["0"],"t":["t"]},"expr":["term","(","t","+","0",")"]},{"id":22,"args":[],"label":"tze","params":[],"retVal":["term","0"],"substitution":{},"expr":["term","0"]},{"id":23,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":24,"args":[25],"label":"a2","params":[["term","t"]],"retVal":["|-","(","t","+","0",")","=","t"],"substitution":{"t":["t"]},"expr":["|-","(","t","+","0",")","=","t"]},{"id":25,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":26,"args":[28,27],"label":"weq","params":[["term","t"],["term","r"]],"retVal":["wff","t","=","r"],"substitution":{"r":["t"],"t":["t"]},"expr":["wff","t","=","t"]},{"id":27,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":28,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":29,"args":[31,30],"label":"weq","params":[["term","t"],["term","r"]],"retVal":["wff","t","=","r"],"substitution":{"r":["t"],"t":["(","t","+","0",")"]},"expr":["wff","(","t","+","0",")","=","t"]},{"id":30,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]},{"id":31,"args":[33,32],"label":"tpl","params":[["term","t"],["term","r"]],"retVal":["term","(","t","+","r",")"],"substitution":{"r":["0"],"t":["t"]},"expr":["term","(","t","+","0",")"]},{"id":32,"args":[],"label":"tze","params":[],"retVal":["term","0"],"substitution":{},"expr":["term","0"]},{"id":33,"args":null,"label":"tt","params":null,"retVal":null,"substitution":null,"expr":["term","t"]}];
        return createObj({
            [s.PROOF_DTO]: proofDto,
            [s.PROOF_NODES_MAP]: proofDto.reduce((acc,node) => ({...acc,[node.id]:node}),{}),
        })
    }

    const tableStyle = {borderCollapse: 'collapse', border: '1px solid lightgray', fontSize: '15px'};
    return RE.table({style:{borderCollapse: 'collapse'}},
        RE.tbody({style:{borderCollapse: 'collapse'}},
            RE.tr({style: {}},
                RE.th({key:'node-id'}),
                RE.th({key:'explanation'}),
            ),
            state[s.PROOF_DTO].map(node => RE.tr({key: `node-${node.id}`, style: {}},
                RE.td({style: {...tableStyle}}, node.id),
                RE.td({style: {...tableStyle}},
                    hasValue(node.args)
                        ? re(RuleProofNode,{node, allNodes:state[s.PROOF_NODES_MAP]})
                        : re(ConstProofNode,{node})
                ),
            ))
        )
    )
}
