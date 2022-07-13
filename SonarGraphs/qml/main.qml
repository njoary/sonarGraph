import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import SonarGraphs

Item {
    id: window
    width: 800
    height: 600

    Page {
        anchors.fill: parent
        header: ToolBar {
            Material.background: Theme.primaryColor

            RowLayout {
                spacing: 20
                anchors.fill: parent

                ToolButton { enabled: false } // Used to centralize title

                Label {
                    id: titleLabelId
                    text: "Sonar Monitor"
                    font.pixelSize: 20
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }

                ToolButton {
                    text: "\uF0C9"
                    font.family: "fontello"
                    onClicked: optionsMenuId.open()
                }
            }
        }

        Menu {
            id: optionsMenuId
            width: Math.min(window.width, window.height) / 3 * 2
            height: window.height
        }

        AmplitudeGraph {
            id: amplitudeGraphId
            anchors.fill: parent

            DataReceiver {
                onNewDataChanged:  {
                    amplitudeGraphId.append(newData)
                }
            }

            DataReceiverWaterfall {
                onNewDataWaterfallChanged:  {
                    amplitudeGraphId.appendWaterfall(newDataWaterfall)
                }
            }
        }
    }
}
