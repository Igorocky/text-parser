"use strict";

const ConstProofNode = ({node}) => {

    return RE.Fragment({},
        RE.span({}, `${node.type} ${node.label??''}: `),
        RE.span({style:{fontFamily:'courier', fontSize:'15px'}}, node.expr.join(' ')),
    )
}
