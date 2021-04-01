import QtQuick 6
import QtQuick.Window 2.15
import QtQuick.Controls 6
import QtQuick.Controls.Material 2.15

ApplicationWindow{
    id: window
    width: 500
    height: 580
    visible: true
    title: qsTr("Acessar ao sistema de agenda")

    // SET FLAGS
     flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.WindowTitleHint

    // SET MATERIAL STYLE
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

        QtObject {
        id: internal
        property string user: "silvaneimartins"
        property string pass: "123456"

        // CHECK LOGIN FUNCTION
        function checkLogin(username, password) {
            if(username === user && password === pass){
                var component = Qt.createComponent("app.qml")
                var win = component.createObject()
                win.show()
                visible = false
            }else{
                // CHANGE USER COLOR
                if(username !== user){
                    usernameField.Material.foreground = Material.Pink
                    usernameField.Material.accent = Material.Pink
                } else {
                    usernameField.Material.foreground = Material.LightBlue
                    usernameField.Material.accent = Material.LightBlue
                }

                // CHANGE PASS COLOR
                if(password !== pass){
                    passwordField.Material.foreground = Material.Pink
                    passwordField.Material.accent = Material.Pink
                } else {
                    passwordField.Material.foreground = Material.LightBlue
                    passwordField.Material.accent = Material.LightBlue
                }
            }
        }
    }

    // CREATE TOP BAR
    Rectangle{
        id: topBar
        height: 50
        color: "#202024"
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10
        }
        radius: 3

        Text{
            text: qsTr("Agenda comercial")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }
    }

    // IMAGE IMPORT
    Image{
        id: image 
        width: 300
        height: 120
        source: "../images/agenda.webp"        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topBar.bottom
        anchors.margins: 60
    }

    // TEXT FIELD USERNAME
    TextField{
        id: usernameField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Seu nome de usuário ou e-mail")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 60
    }

    // TEXT FIELD USERNAME
    TextField{
        id: passwordField
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Sua senha")
        verticalAlignment: Text.AlignVCenter        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: usernameField.bottom
        anchors.topMargin: 10
        echoMode: TextInput.Password
    }
    
    // CHECKBOX SAVE PASS
    CheckBox{
        id: checkBox
        text: qsTr("Salvar sua senha")
        anchors.top: passwordField.bottom
        anchors.topMargin: 10        
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // BUTTON LOGIN
    Button{
        id: buttonLogin
        width: 300
        text: qsTr("Logar")
        anchors.top: checkBox.bottom
        anchors.topMargin: 10        
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: internal.checkLogin(usernameField.text, passwordField.text)
    }
}