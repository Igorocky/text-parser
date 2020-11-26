"use strict";

const RuleProofNode = ({node,allNodes}) => {

    const SCALE = 10
    const fontFamily = 'courier'
    const fontSize = (SCALE*2)
    const fontSizePx = fontSize+'px'
    const charLength = fontSize*0.6
    const charHeight = charLength*0.85

    function renderArgAndParam({key,ex,arg,param,subs}) {
        const argStr = arg.join(' ')
        const paramStr = param.join(' ')

        const argBottomLine = ex.scale(argStr.length*charLength)
        const argLeftLine = ex.rotate(90).scale(charHeight)

        const paramBottomLineEx = ex.translate(ex.rotate(-90),6*charHeight)
        const paramBottomLine = paramBottomLineEx.scale(paramStr.length*charLength)
        const paramLeftLine = paramBottomLineEx.rotate(90).scale(charHeight)

        const argBoundaries = SvgBoundaries.fromPoints([argLeftLine.end,argBottomLine.end]).addAbsoluteMargin(SCALE*0.5);
        const paramBoundaries = SvgBoundaries.fromPoints([paramLeftLine.end,paramBottomLine.end]).addAbsoluteMargin(SCALE*0.5);
        return {
            svgElems: [
                SVG.text({key:`${key}-arg-text`, x:ex.start.x, y:ex.start.y, fill:'black', fontSize:fontSizePx, fontFamily},
                    argStr
                ),
                svgPolygon({
                    key: `${key}-arg-border`,
                    boundaries: argBoundaries,
                    props: {fill:'none', stroke:'green', strokeWidth: SCALE*0.1}
                }),
                SVG.text({key:`${key}-param-text`,
                        x:paramBottomLineEx.start.x, y:paramBottomLineEx.start.y, fill:'black', fontSize:fontSizePx, fontFamily},
                    paramStr
                ),
                svgPolygon({
                    key: `${key}-param-border`,
                    boundaries: paramBoundaries,
                    props: {fill:'none', stroke:'green', strokeWidth: SCALE*0.1}
                })
            ],
            boundaries: mergeSvgBoundaries([argBoundaries,paramBoundaries])
        }
    }

    const argAndParam = renderArgAndParam({
        key: 'argAndParam',
        ex: SVG_EX,
        arg: ["wff", "(", "t", "+", "0", ")", "=", "t"],
        param: ["wff", "P"],
        subs: {
            "P": ["(", "t", "+", "0", ")", "=", "t"],
            "Q": ["t", "=", "t"]
        }
    })

    return RE.svg(
        {
            width: 800,
            height: 200,
            boundaries: argAndParam.boundaries.addAbsoluteMargin(SCALE*5),
        },
        argAndParam.svgElems,
    )
}
