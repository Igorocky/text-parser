"use strict";

const SCALE = 10
const pxSize = 1.5
const fontFamily = 'courier'
const fontSize = (SCALE*2)
const fontSizePx = fontSize+'px'
const charLength = fontSize*0.6
const charHeight = charLength*0.85
const subsAvailableColors = ['green', 'orange', 'cyan', 'pink', 'brown', 'lawngreen', 'olive', 'blue', 'red', 'magenta']
const typeColors = {wff:'blue',term:'black',setvar:'red',['class']:'magenta'}

function createVarColors({varTypes}) {
    return Object.getOwnPropertyNames(varTypes)
        .map(varName => [varName,typeColors[varTypes[varName]]??'gold'])
        .reduce((acc,[varName,color]) => ({...acc, [varName]:color}), {})
}

function applyColors({expr,varColors}) {
    return RE.Fragment({},
        expr
            .map(str => varColors[str]?RE.span({style:{color:varColors[str], fontWeight:'bold'}}, str):str)
            .flatMap(e => [e, ' '])
    )
}

function renderColoredExpr({key,ex,expr,colors}) {
    const svgElems = []
    let numOfChars = 0
    let curEx = ex;
    for (let i = 0; i < expr.length; i++) {
        const text = expr[i];
        svgElems.push(SVG.text({
                key:`${key}-${i}`,
                x:curEx.start.x,
                y:curEx.start.y,
                fill:colors[text]??'black',
                fontSize:fontSizePx,
                fontFamily,
                fontWeight:colors[text]?'900':'none'
            },
            text
        ))
        numOfChars += text.length+1
        curEx = curEx.translate(null,charLength*(text.length+1))
    }
    if (expr.length) {
        numOfChars -= 1
    }
    const bottomLine = ex.scale(numOfChars*charLength)
    return {svgElems, boundaries: SvgBoundaries.fromPoints(bottomLine.start, bottomLine.end.withY(y => y - charHeight))}
}