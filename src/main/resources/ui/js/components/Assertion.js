"use strict";

const Assertion = ({params,retVal,varColors}) => {

    function renderAssertion({ex}) {
        const resultSvgElems = []
        let resultBoundaries = null

        let lastEx = ex
        const eyDown = ex.rotate(-90);
        for (let i = 0; i < params.length; i++) {
            const {svgElems, boundaries} = renderColoredExpr({key:`param-${i}`, ex:lastEx, expr:params[i], colors:varColors})
            resultSvgElems.push(...svgElems)
            lastEx = lastEx.translate(eyDown, charHeight*3)
            resultBoundaries = mergeSvgBoundaries(resultBoundaries, boundaries)
        }
        const hypothesesBoundaries = resultBoundaries
        lastEx = lastEx.translate(eyDown, charHeight*2)
        const {svgElems:retValSvgElems, boundaries:retValBoundaries} = renderColoredExpr({key:`ret-val`, ex:lastEx, expr:retVal, colors:varColors})
        resultSvgElems.push(...retValSvgElems)
        resultBoundaries = mergeSvgBoundaries(resultBoundaries, retValBoundaries)

        const midLineProps = {fill:'none', stroke:'black', strokeWidth: SCALE*0.1}
        if (params.length) {
            const ruleMidY = (hypothesesBoundaries.maxY + retValBoundaries.minY) / 2
            const from = new Point(resultBoundaries.minX, ruleMidY);
            const to = new Point(resultBoundaries.maxX, ruleMidY);
            resultSvgElems.push(svgLine({key: `rule-line`, from, to, props:midLineProps}))
        } else {
            const ruleMidY = retValBoundaries.minY - charHeight
            const from = new Point(retValBoundaries.minX, ruleMidY);
            const to = new Point(retValBoundaries.maxX, ruleMidY);
            resultSvgElems.push(svgLine({key: `rule-line`, from, to, props:midLineProps}))
            resultBoundaries = resultBoundaries.addPoints(from)
        }

        return {svgElems: resultSvgElems, boundaries: resultBoundaries}
    }

    let {svgElems, boundaries} = renderAssertion({ex:SVG_EX})
    boundaries = boundaries.addAbsoluteMargin(charHeight)

    return RE.svg(
        {
            width: boundaries.width()/pxSize,
            height: boundaries.height()/pxSize,
            boundaries: boundaries,
        },
        // SVG.rect({key:'background', x:-100000, y:-100000, width:200000, height:200000, fill:'lightyellow'}),
        svgElems,
        // boundaries.toRect({key:`boundaries`,color:'red'})
    )
}
