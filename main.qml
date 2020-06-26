import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: mainWindow
    visible: true

    signal newGame()
    signal quitGame()

    minimumWidth: 699
    maximumWidth: 699
    width: 699

    minimumHeight: 457
    maximumHeight: 457
    height: 457

    title: qsTr("PetrSU")
    Rectangle {
       width: 699
       height: 457

       color: "lightblue"

        Image {
            id: image
            x: 0
            y: -71
            width: 700
            height: 600
            fillMode: Image.PreserveAspectFit
            source: "image/background.jpg"
        }
        Button

        {

            id: control
            x: 29
            y: 186
            width: 210
            height: 64

            text: qsTr("𝓝𝓮𝔀 𝓖𝓪𝓶𝓮")
            transformOrigin: Item.Center
            checkable: false
            font.pointSize: 12
            visible: true
            autoRepeat: false
            flat: false
            highlighted: false


            contentItem: Text {
                color: "#ecbebe"
                text: "𝓝𝓮𝔀 𝓖𝓪𝓶𝓮"
                visible: true
                font.pointSize: 20
                //font: control.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight

            }


            background: Rectangle {
                color:"black"
                implicitWidth: 90
                opacity: 1
                implicitHeight: 30
                border.color: control.down ? "#FA8072" : "#696969"
                border.width: 1
                radius: 20

            }


        }
        Button

        {
            id: control2
            x: 134
            y: 299
            width: 210
            height: 64
            text: qsTr("𝓠𝓾𝓲𝓽")
            autoRepeat: false
            flat: false
            highlighted: false

            contentItem: Text {
                color: "#ecbebe"
                text: "𝓠𝓾𝓲𝓽"
                font.pointSize: 20
                // font: control2.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight

            }


            background: Rectangle {
                color:"black"
                implicitWidth: 90
                implicitHeight: 30
                border.color: control2.down ? "#FA8072" : "#696969"
                border.width: 1
                radius: 20 }
        }
    }
    Gameplay {

        }

    }




