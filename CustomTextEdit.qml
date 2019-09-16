import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4


Item {

    id: frame
    clip: true
    width: parent.width
    height: parent.height
    anchors.centerIn: parent
    anchors.top: parent.bottom
    anchors.left: parent.left
    Keys.onUpPressed: vbar.decrease()
    Keys.onDownPressed: vbar.increase()

    TextEdit {
        id: textEdit
        selectByMouse: true
        height: contentHeight
        width: frame.width - vbar.width
        y: -vbar.position * textEdit.height
        wrapMode: TextEdit.Wrap
        activeFocusOnPress: true



        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                textEdit.forceActiveFocus();
                if(mouse.button === Qt.RightButton)
                    contentMenu.popup()
            }
        }

    }


    Menu{
        id: contentMenu
        MenuItem{
            text: qsTr("Cut")
            shortcut:"Ctrl+X"
            onTriggered: {
                textEdit.cut()
            }
        }

        MenuItem{
            text: qsTr("Copy")
            shortcut: "Ctrl+C"
            onTriggered: {
                textEdit.copy()
            }
        }

        MenuItem{
            text: qsTr("Paste")
            shortcut: "Ctrl+V"
            onTriggered: {
                textEdit.paste()
            }
        }

        MenuItem{
            text: qsTr("Undo")
            shortcut: "Ctrl+Z"
            onTriggered: {
                textEdit.undo()
            }
        }

        MenuItem{
            text: qsTr("Redo")
            shortcut: "Ctrl+Y"
            onTriggered: {
                textEdit.redo()
            }
        }
    }


    ScrollBar {
        id: vbar
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Vertical
        size: frame.height / textEdit.height
        width: 12
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom

    }

}



















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
