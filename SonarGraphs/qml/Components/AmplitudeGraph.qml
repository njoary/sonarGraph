import QtQuick
import QtQuick.Controls
import QtCharts

import SonarGraphs

Item {
    anchors.fill: parent

    QtObject {
        id: _privatePropertiesId
        property date initialTime: new Date()
        property real timeWindow: 10 // seconds

    }

    function append(newData) {
        _lineSeriesId.clear()
        newData.forEach((item, index) => {
            _lineSeriesId.append(item.x, item.y)
        });
    }

    function appendWaterfall(newDataWaterfall) {
        horizontalBarSeries.barWidth = 0.98

        newDataWaterfall.forEach((item, index) => {
             // Get all values of each row
             var value = [item[0],item[1],item[2],item[3],item[4],item[5]]

             // Add all input into barset (36 barsets)
             if(index === 1)
                 barset1.values = value
             if(index === 2)
                 barset2.values = value
             if(index === 3)
                 barset3.values = value
             if(index === 4)
                 barset4.values = value
             if(index === 5)
                 barset5.values = value
             if(index === 6)
                 barset6.values = value
             if(index === 7)
                 barset7.values = value
             if(index === 8)
                 barset8.values = value
             if(index === 9)
                 barset9.values = value
             if(index === 10)
                 barset10.values = value
             if(index === 11)
                 barset11.values = value
             if(index === 12)
                 barset12.values = value
             if(index === 13)
                 barset13.values = value
             if(index === 14)
                 barset14.values = value
             if(index === 15)
                 barset15.values = value
             if(index === 16)
                 barset16.values = value
             if(index === 17)
                 barset17.values = value
             if(index === 18)
                 barset18.values = value
             if(index === 19)
                 barset19.values = value
             if(index === 20)
                 barset20.values = value
             if(index === 21)
                 barset21.values = value
             if(index === 22)
                 barset22.values = value
             if(index === 23)
                 barset23.values = value
             if(index === 24)
                 barset24.values = value
             if(index === 25)
                 barset25.values = value
             if(index === 26)
                 barset26.values = value
             if(index === 27)
                 barset27.values = value
             if(index === 28)
                 barset28.values = value
             if(index === 29)
                 barset29.values = value
             if(index === 30)
                 barset30.values = value
             if(index === 31)
                 barset31.values = value
             if(index === 32)
                 barset32.values = value
             if(index === 33)
                 barset33.values = value
             if(index === 34)
                 barset34.values = value
             if(index === 35)
                 barset35.values = value
             if(index === 36)
                 barset36.values = value
        });
    }

    ChartView {
        id: amplitudeChart
        width: parent.width
        height: parent.height/2
        antialiasing: true
        legend.visible: false // ; legend.alignment:  Qt.AlignBottom ; legend.font: Theme.fonts.graph.legend
        title: "Intensity of Sonar Wave"
        titleFont: Theme.fonts.graph.title
        backgroundColor: "black"

        LineSeries {
            id: _lineSeriesId
            color: Theme.primaryColor

            axisX: ValueAxis {
                id: _axisX
                min: -180
                max: 180
                titleText: "Degrees"
                labelFormat: "%d"
                labelsFont: Theme.fonts.graph.axis
                titleFont: Theme.fonts.graph.axisTitle
                gridVisible: false
            }

            axisY: ValueAxis {
                id: _axisY
                min: 0
                max: 20
                labelFormat: "%d"
                titleText: "Amplitude"
                labelsFont: Theme.fonts.graph.axis
                titleFont: Theme.fonts.graph.axisTitle
                gridVisible: false
            }
        }
    }

    ChartView {
        id: cascadeChart
        anchors.top: amplitudeChart.bottom
        width: parent.width
        height: parent.height/2
        antialiasing: true
        legend.visible: false // ; legend.alignment:  Qt.AlignBottom ; legend.font: Theme.fonts.graph.legend
        backgroundColor: "black"

        HorizontalStackedBarSeries {
            id: horizontalBarSeries

            axisX: ValueAxis {
                titleText: "Degrees"
                labelsFont: Theme.fonts.graph.axis
                titleFont: Theme.fonts.graph.axisTitle
                labelFormat: "%d"
                gridVisible: false
                min: 0
                max: 360
            }

           axisY: BarCategoryAxis {
               titleText: "Secondes"
               labelsFont: Theme.fonts.graph.axis
               titleFont: Theme.fonts.graph.axisTitle
               gridVisible: false
               categories: ["1","2","3","4","5","6"]
           }

           // All barsets with their shade of green colors (36 bars)
           BarSet{ id: barset1; color: "#ddFFdd"; borderColor: "#d8FFd8" }
           BarSet{ id: barset2; color: "#ccFFcc"; borderColor: "#ccFFcc" }
           BarSet{ id: barset3; color: "#bbFFbb"; borderColor: "#bbFFbb" }
           BarSet{ id: barset4; color: "#aaFFaa"; borderColor: "#aaFFaa" }
           BarSet{ id: barset5; color: "#90FF90"; borderColor: "#90FF90" }
           BarSet{ id: barset6; color: "#75FF75"; borderColor: "#75FF75" }
           BarSet{ id: barset7; color: "#60FF60"; borderColor: "#60FF60" }
           BarSet{ id: barset8; color: "#45FF45"; borderColor: "#45FF45" }
           BarSet{ id: barset9; color: "#30FF30"; borderColor: "#30FF30" }
           BarSet{ id: barset10; color: "#15FF15"; borderColor: "#15FF15" }
           BarSet{ id: barset11; color: "#00FF00"; borderColor: "#00FF00" }
           BarSet{ id: barset12; color: "#19FC4E"; borderColor: "#19FC4E" }
           BarSet{ id: barset13; color: "#1FF250"; borderColor: "#1FF250" }
           BarSet{ id: barset14; color: "#19E448"; borderColor: "#19E448" }
           BarSet{ id: barset15; color: "#1AD746"; borderColor: "#1AD746" }
           BarSet{ id: barset16; color: "#19CD43"; borderColor: "#19CD43" }
           BarSet{ id: barset17; color: "#1BC142"; borderColor: "#1BC142" }
           BarSet{ id: barset18; color: "#1EB541"; borderColor: "#1EB541" }
           BarSet{ id: barset19; color: "#21A941"; borderColor: "#21A941" }
           BarSet{ id: barset20; color: "#25A443"; borderColor: "#25A443" }
           BarSet{ id: barset21; color: "#289A43"; borderColor: "#289A43" }
           BarSet{ id: barset22; color: "#299041"; borderColor: "#299041" }
           BarSet{ id: barset23; color: "#2C8741"; borderColor: "#2C8741" }
           BarSet{ id: barset24; color: "#2A7D3E"; borderColor: "#2A7D3E" }
           BarSet{ id: barset25; color: "#2D773E"; borderColor: "#2D773E" }
           BarSet{ id: barset26; color: "#2E6F3D"; borderColor: "#2E6F3D" }
           BarSet{ id: barset27; color: "#2C6238"; borderColor: "#2C6238" }
           BarSet{ id: barset28; color: "#275532"; borderColor: "#275532" }
           BarSet{ id: barset29; color: "#23492C"; borderColor: "#23492C" }
           BarSet{ id: barset30; color: "#1D3A23"; borderColor: "#1D3A23" }
           BarSet{ id: barset31; color: "#1B301F"; borderColor: "#1B301F" }
           BarSet{ id: barset32; color: "#162519"; borderColor: "#162519" }
           BarSet{ id: barset33; color: "#0F1811"; borderColor: "#0F1811" }
           BarSet{ id: barset34; color: "#0B100C"; borderColor: "#0B100C" }
           BarSet{ id: barset35; color: "#080A09"; borderColor: "#080A09" }
           BarSet{ id: barset36; color: "#080908"; borderColor: "#080908" }
       }
    }

}
