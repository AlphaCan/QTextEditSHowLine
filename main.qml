import QtQuick 2.12
import QtQuick.Window 2.12



Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    CustomTextEdit{
        id:codeedit
    }

//    TextEdit{
//        anchors.fill: parent
//        selectByMouse: true
//        text: qsTr("werw qwerqty")
//    }

}
