import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: mainWindow
    visible: true



    minimumWidth: 699
    maximumWidth: 699
    width: 699

    minimumHeight: 457
    maximumHeight: 457
    height: 457
    property alias rectangle: rectangle

    title: qsTr("PetrSU")
    Rectangle {
        id: rectangle
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
    }
      Toolbar {
          onNewGame: {

              puzzleArea.show()
              mainWindow.hide()
          }

          onQuitGame: Qt.quit()

        }

    Gameplay {
    }

    Window {
        width: 200
        minimumWidth: 200
        maximumWidth: 200
        height: 100
        minimumHeight: 100
        maximumHeight: 100
        visible: true
        Text {
            x: 6
            y: 12
            width: 189
            height: 76
            text: "Congratulations! You won!"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 10
        }
    }
}




