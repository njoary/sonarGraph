import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.settings
import SonarGraphs

Drawer {
    id: drawer
    edge: Qt.RightEdge
    width: 400
    height: parent.height

    Settings {
        id: settingsId
        property color primaryColor: Theme.primaryColor
        onPrimaryColorChanged: {
            Theme.primaryColor = primaryColor
        }
        property int graphFontSize: Theme.graphFontSize
        onGraphFontSizeChanged: {
            Theme.graphFontSize = graphFontSize
        }
    }

    Item {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 50; height: 50;

        Label {
            anchors.centerIn: parent
            font.family: "fontello"
            font.pointSize: Theme.fonts.h4.pointSize
            text: "\uE800"
            horizontalAlignment: Qt.AlignRight
        }

        MouseArea {
            anchors.fill: parent
            onClicked: drawer.close()
        }
    }

    GridLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.margins: 10
        columns: 2

        Label {
            text: "Settings"
            Layout.fillWidth: true
            Layout.columnSpan: 2
            font: Theme.fonts.h3
        }

        Label {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            text: "Font size:"
            font: Theme.fonts.defaultFont
        }

        SpinBox {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            value: Theme.graphFontSize
            from: 1
            stepSize: 1
            to: 5
            onValueChanged: settingsId.graphFontSize = value

        }

        Label {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredHeight: 100

            font: Theme.fonts.defaultFont
            text: "Color:"

        }

        ListView {
            id: colorSelectorId
            Layout.preferredHeight: 100
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            anchors.margins: 10
            model: [
                Material.color(Material.Red),
                Material.color(Material.Green),
                Material.color(Material.Blue),
                Material.color(Material.Orange),
                Material.color(Material.Yellow),
            ]
            spacing: 10
            orientation: Qt.Horizontal
            interactive: false
            highlight: Rectangle {
                border.color: Material.color(Material.Blue)
                border.width: 3
                radius: 15
            }

            delegate: Item {
                property color value: modelData

                width: 30; height: width;
                anchors.margins: 10

                Rectangle {
                    anchors.centerIn: parent
                    width: 22; height: width
                    radius: width/2
                    color: modelData
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        colorSelectorId.currentIndex = index
                        settingsId.primaryColor = modelData
                    }
                }
            }
            Component.onCompleted: {
                while (currentItem.value !== settingsId.primaryColor) {
                    incrementCurrentIndex()
                }
            }
        }

        // Vertical spacer
        Item { Layout.fillHeight: true}
    }
}
