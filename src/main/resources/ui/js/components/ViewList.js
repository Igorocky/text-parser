'use strict';

const AVAILABLE_VIEWS = [
    {name:"MetamathProof", component: MetamathProof},
]

const ViewList = ({}) => {
    const [selectedView, setSelectedView] = useState({component: MetamathProof})
    // const [selectedView, setSelectedView] = useState(null)

    if (!selectedView) {
        return RE.List({component:"nav"},
            AVAILABLE_VIEWS.map(ex => RE.ListItem({key:ex.name, button:true,
                    onClick: () => setSelectedView(ex)},
                RE.ListItemText({}, ex.name)
            ))
        )
    } else {
        return re(selectedView.component)
    }
}