import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
    id: puzzleArea

   property string displayText: ""

    // width: 100
   // height: 100


    radius: 10

    color: "skyblue"
    border.color: "black"
    border.width: 2



    Text {
        id: _firstText
        x: puzzleArea.width / 2 - width / 2
        y: puzzleArea.height / 2 - height / 2
        text: puzzleArea.displayText
        font {
            pointSize: Math.min(puzzleArea.width, puzzleArea.height) / 3
            bold: true
       }
    }
}

