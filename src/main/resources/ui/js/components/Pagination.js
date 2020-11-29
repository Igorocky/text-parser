"use strict";

const Pagination = ({numOfPages,curPage,onChange}) => {

    return RE.ButtonGroup({variant:'contained', size:'small'},
        RE.Button({onClick: () => onChange(1), disabled: curPage == 1},
            '<<'
        ),
        RE.Button({onClick: () => onChange(curPage-1), disabled: curPage == 1},
            '<'
        ),
        RE.Button({onClick: () => onChange(curPage+1), disabled: curPage == numOfPages},
            '>'
        ),
        RE.Button({onClick: () => onChange(numOfPages), disabled: curPage == numOfPages},
            '>>'
        ),
        ints(Math.max(1,curPage-3),Math.min(numOfPages,curPage+3)).map(p => RE.Button(
            {
                onClick: () => p==curPage?null:onChange(p)
            },
            p==curPage?(`[${p}]`):p
        )),
        (curPage+3 < numOfPages)?[
            RE.Button({disabled: true},
                '...'
            ),
            RE.Button({onClick: () => onChange(numOfPages)},
                numOfPages
            )
        ]:null,
    )
}
