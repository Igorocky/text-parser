'use strict';

function includeStyle({pathPrefix, path, onLoad}) {
    const link=document.createElement('link')
    link.onload=onLoad
    link.href=`${pathPrefix}${path}`
    link.rel='stylesheet'
    document.getElementsByTagName('head')[0].appendChild(link)
}

function includeScript({pathPrefix, path, onLoad}) {
    const script=document.createElement('script')
    script.onload= () => {
        onLoad?.()
    }
    script.src=`${pathPrefix}${path}`
    document.getElementsByTagName('head')[0].appendChild(script)
}

function includeScripts({pathPrefix, scripts, onLoad}) {
    scripts.reduceRight((acc,path) => () => includeScript({pathPrefix, path, onLoad:acc}), () => onLoad?.())()
}

includeStyle({
    pathPrefix,
    path: 'css/styles.css',
    onLoad: () => includeScripts({
        pathPrefix,
        scripts: [
            'js/lib/react.production-16.8.6.min.js',
            'js/lib/react-dom.production-16.8.6.min.js',
            'js/lib/material-ui.production-4.11.0.min.js',
            'js/utils/react-imports.js',
            'js/utils/data-functions.js',
            'js/utils/svg-functions.js',
            'js/utils/rendering-functions.js',
            'js/components/Pagination.js',
            'js/components/Assertion.js',
            'js/components/ConstProofNode.js',
            'js/components/RuleProofNode.js',
            'js/components/MetamathAssertionView.js',
            'js/components/MetamathIndexTable.js',
            'js/components/MetamathIndexView.js',
        ],
        onLoad: () => {
            const decompressedViewProps = window[decompressionFunction](viewProps)
            window['decompressedViewProps'] = decompressedViewProps
            ReactDOM.render(
                re(window[viewComponent], decompressedViewProps),
                document.getElementById('react-container')
            )
        }
    })
})