"use strict";

const ConstProofNode = ({node, varColors}) => {

    return RE.Fragment({},
        RE.span({}, `${node.type} ${node.label??''}: `),
        RE.span({style:{fontFamily:'courier', fontSize:'15px'}}, applyColors({expr:node.expr,varColors})),
    )
}
