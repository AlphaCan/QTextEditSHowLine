import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

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
        height: contentHeight
        width: frame.width - vbar.width
        y: -vbar.position * textEdit.height
        wrapMode: TextEdit.Wrap

        selectByMouse: true
        MouseArea{
            anchors.fill: parent
            onWheel: {
                if (wheel.angleDelta.y > 0) {
                    vbar.decrease();
                }
                else {
                    vbar.increase();
                }
            }
            onClicked: {
                textEdit.forceActiveFocus();
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
