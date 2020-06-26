import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
   // width: 699
  //  height: 457
   // visible: false
    signal newGame()
    signal quitGame()
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
    onClicked: {
        newGame()
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
    visible: true
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
    onClicked: {
        quitGame()
    }
}
}
