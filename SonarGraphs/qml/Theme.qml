pragma Singleton

import QtQml
import QtQuick.Controls.Material

QtObject {
    property color primaryColor: Material.color(Material.Blue)
    property int graphFontSize: 1

    readonly property real fontRatio: 1.0 + (graphFontSize -1)/5

    readonly property QtObject fonts: QtObject{
        property font h1: Qt.font({ pointSize: 32 })
        property font h2: Qt.font({ pointSize: 26 })
        property font h3: Qt.font({ pointSize: 22 })
        property font h4: Qt.font({ pointSize: 20 })
        property font defaultFont: Qt.font({ pointSize: 12 })

        property QtObject graph: QtObject{
            property font title: Qt.font({ pointSize: 12*fontRatio })
            property font legend: Qt.font({ pointSize: 10*fontRatio })
            property font axis: Qt.font({ pointSize: 9*fontRatio })
            property font axisTitle: Qt.font({ pointSize: 10*fontRatio })
        }
    }
}
