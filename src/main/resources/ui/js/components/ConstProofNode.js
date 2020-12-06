"use strict";

function ConstProofNode ({node, varColors}) {

    return RE.span({style:{fontFamily:'courier', fontSize:'15px'}},
        applyColors({expr:node.expr,varColors})
    )
}
