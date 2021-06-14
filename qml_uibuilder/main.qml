import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    width: 400
    height: 300
    visible: true
    title: qsTr("QML UiBuilder")
    function startUpFunction(){
        //This is relevant for the Android code
        //that intercepts console log and this
        //indicates that qml has loaded and
        //opening webmessage channels can be started.
        console.log('qmlwasm1');
    }

    property alias aliasText1: text1.text
    Text {
        id: text1
        text: qsTr("Hello Node-RED!")
        color: "black"
    }

    Button {
        id: button
        objectName: "button"
        anchors.top: text1.bottom
        text: "click me"
        onClicked: {
            msgBoard.postMessage("Hello Node-RED!");
            //uibuilder.send({'topic':'from-the-front','payload':42});
            //msgBoard.refresh();
        }
        function clickReturn(msg: string){
            console.log(msg);
            let imsg=JSON.parse(msg);
            mainWindow.aliasText1=imsg.payload;
        }
    }

    Component.onCompleted: startUpFunction();
}
