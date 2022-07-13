import QtQuick 2.0

Item {
    id: dataReceiverWaterfallId

    property var newDataWaterfall: ([])
    property var list: ([])

    Timer {
        interval: 100
        repeat: true
        running: true
        onTriggered: {

            // Dynamic input generation (36 inputs)
            for (let i = 0; i < 36; i++) {
                if(list[i] === undefined)
                    list[i] = [13,13,13,13,13,13] // Just for initial
                list[i].unshift(Math.floor(Math.random()*20))
                list[i].pop()
            }
            newDataWaterfall = list
        }
    }
}
