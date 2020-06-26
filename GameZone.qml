import QtQuick 2.0
import Game 1.0;
GridView {
    id: puzzleArea

    model: GameZoneModel {
    }


    cellHeight: height / puzzleArea.model.dimension
    cellWidth: width / puzzleArea.model.dimension

    interactive: false

    delegate: Item {
        id: _backgroundDelegate
        width: puzzleArea.cellWidth
        height: puzzleArea.cellHeight

        visible: puzzleArea.model.hiddenElementValue !== display
        Brick {
        anchors.fill:_backgroundDelegate
        anchors.margins: 1

       // internalText.text: display.toString()

        displayText: display
        MouseArea {
            anchors.fill: parent
            onClicked: {
                puzzleArea.model.move(index) }
        }
        }
    }
}


