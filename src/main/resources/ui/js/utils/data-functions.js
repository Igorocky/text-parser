'use strict';

function hasValue(variable) {
    return variable !== undefined && variable !== null
}

function hasNoValue(variable) {
    return !hasValue(variable)
}

function nvl(...args) {
    for (let i = 0; i < arg.length; i++) {
        const arg = args[i];
        if (hasValue(arg)) {
            return arg
        }
    }
    return undefined
}

function isObject(obj) {
    return typeof obj === 'object' && !Array.isArray(obj)
}

function randomInt(min, max) {
    return min + Math.floor(Math.random()*((max-min)+1))
}

function ints(start, end) {
    let i = start
    const res = [];
    while (i <= end) {
        res.push(i)
        i++
    }
    return res
}

function prod(...arrays) {
    if (arrays.length) {
        const childProdResult = prod(...arrays.rest());
        return arrays.first().flatMap(e => childProdResult.map(row => [e,...row]))
    } else {
        return [[]]
    }
}

Array.prototype.min = function () {
    return this.reduce((a,b) => hasValue(a)?(hasValue(b)?(Math.min(a,b)):a):b)
}

Array.prototype.max = function () {
    return this.reduce((a,b) => hasValue(a)?(hasValue(b)?(Math.max(a,b)):a):b)
}

Array.prototype.sum = function () {
    return this.reduce((a,b) => a+b, 0)
}

Array.prototype.attr = function(...attrs) {
    if (attrs.length > 1) {
        return this.map(e => attrs.reduce((o,a)=>({...o,[a]:e[a]}), {}))
    } else {
        return this.map(e => e[attrs[0]])
    }
}

Array.prototype.first = function() {
    return this[0]
}

Array.prototype.last = function() {
    return this[this.length-1]
}

Array.prototype.rest = function() {
    return this.filter((e,idx) => 0 < idx)
}

function inc(arr, idx) {
    return modifyAtIdx(arr, idx, i => i+1)
}

function modifyAtIdx(arr, idx, modifier) {
    return arr.map((e,i) => i==idx?modifier(e):e)
}

function removeAtIdx(arr, idx) {
    return arr.filter((e,i) => i!=idx)
}

function nextRandomElem({allElems,counts}) {
    const elemsWithCnt = allElems.map(elem => ({...elem, cnt:counts[elem.idx]}))
    const minCnt = elemsWithCnt.attr('cnt').min()
    const elemsWithMinCnt = elemsWithCnt.filter(elem => elem.cnt == minCnt)
    return elemsWithMinCnt[randomInt(0,elemsWithMinCnt.length-1)]
}

function createObj(obj) {
    const self = {
        ...obj,
        set: (attr, value) => {
            // console.log(`Setting in object: attr = ${attr}, value = ${value}`)
            return createObj({...obj, [attr]: value})
        },
        attr: (...attrs) => attrs.reduce((o,a)=>({...o,[a]:obj[a]}), {}),
        map: mapper => {
            const newObj = mapper(self)
            if (isObject(newObj)) {
                return createObj(newObj)
            } else {
                return newObj
            }
        }
    }
    return self
}

function objectHolder(obj) {
    return {
        get: (attr) => attr?obj[attr]:obj,
        set: (attr, value) => {
            // console.log(`Setting in holder: attr = ${attr}, value = ${value}`)
            obj = obj.set(attr, value)
        },
        setObj: (newObj) => {
            obj = newObj
        },
        attr: (...attrs) => obj.attr(...attrs),
        map: mapper => obj = obj.map(mapper),
    }
}

function saveToLocalStorage(localStorageKey, value) {
    window.localStorage.setItem(localStorageKey, JSON.stringify(value))
}

function readFromLocalStorage(localStorageKey, defaultValue) {
    const item = window.localStorage.getItem(localStorageKey)
    return hasValue(item) ? JSON.parse(item) : defaultValue
}

function disableScrollOnMouseDown(event) {
    if(event.button==1){
        event.preventDefault()
    }
}

function replaceDots(str) {
    return str.replaceAll('.','-dot-')
}

function getRelPath({label}) {
    if (label.length >= 6) {
        return [label.substring(0,2), label.substring(2,4), label.substring(4,6)]
    } else if (label.length >= 4) {
        return [label.substring(0,2), label.substring(2,4)]
    } else if (label.length >= 2) {
        return [label.substring(0,2)]
    } else {
        return [label]
    }
}

function getRelPathToAssertion({thisLabel, otherLabel}) {
    const thisRelPath = getRelPath({label:thisLabel}).map(replaceDots)
    const otherRelPath = [...getRelPath({label:otherLabel}).map(replaceDots), replaceDots(otherLabel) + '.html']
    return ints(1,thisRelPath.length).map(i => "..").join('/') + '/' + otherRelPath.join('/')
}

function createUrlOfAssertion(label) {
    return 'data/' + getRelPath({label}).map(replaceDots).join('/') + '/' + replaceDots(label) + '.html'
}

function decompressAssertionDto(cDto) {
    return {
        type: cDto.t,
        name: cDto.n,
        description: cDto.d,
        varTypes: decompressVarTypes(cDto.v,cDto.s),
        assertion: decompressStackNodeDto(cDto.a, cDto.s),
        proof: cDto.p?.map(n => decompressStackNodeDto(n, cDto.s))
    }
}

function decompressStackNodeDto(cDto, strings) {
    return {
        id: cDto.i,
        args: cDto.a,
        type: strings[cDto.t],
        label: strings[cDto.l],
        params: cDto.p?.map(param => decompressListOfStrings(param, strings)),
        numOfTypes: cDto.n,
        retVal: decompressListOfStrings(cDto.r, strings),
        substitution: hasNoValue(cDto.s)
            ?undefined
            :Object.entries(cDto.s).reduce((acc,[k,v]) => ({...acc,[strings[k]]:decompressListOfStrings(v,strings)}), {}),
        expr: decompressListOfStrings(cDto.e, strings)
    }
}

function decompressIndexDto(cDto) {
    return {
        elems: cDto.elems.map(e => decompressIndexElemDto(e, cDto.strings))
    }
}

function decompressIndexElemDto(cDto, strings) {
    return {
        id: cDto.i,
        type: strings[cDto.t],
        label: cDto.l,
        hypotheses: cDto.h?.map(hyp => decompressListOfStrings(hyp, strings)),
        expression: decompressListOfStrings(cDto.e, strings),
        varTypes: decompressVarTypes(cDto.v,strings),
    }
}

function decompressAssertionType(assertionType) {
    return assertionType==='T'?'Theorem':assertionType==='A'?'Axiom':assertionType
}

function decompressListOfStrings(listOfInts, strings) {
    return hasNoValue(listOfInts) ? listOfInts : listOfInts.map(i => strings[i])
}

function decompressVarTypes(compressedVarTypes, strings) {
    return Object.entries(compressedVarTypes).reduce((acc,[k,v]) => ({...acc,[strings[k]]:strings[v]}), {})
}