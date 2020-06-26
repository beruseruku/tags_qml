import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    id: puzzleArea


    visible: true

    minimumWidth:800
    maximumWidth:800
    width: 800

    minimumHeight: 600
    maximumHeight: 600
    height: 600

    color: "white"

    title: qsTr("PetrSU")

    GameZone {
        anchors.fill: parent
        anchors.margins: 5

    }


    Brick {

    }
}





