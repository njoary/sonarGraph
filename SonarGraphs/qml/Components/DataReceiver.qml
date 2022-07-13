import QtQuick 2.0

Item {
    id: dataReceiverId

    property var newData: ([])

    Timer {
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            let list = []
            for (let i = -180; i <= 180; i++) {
                let element = {}
                element.x = i
                element.y = Math.random()*20
                list.push(element)
            }
            newData = list
        }
    }
}
