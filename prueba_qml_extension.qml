import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


import Phoenix 1.0
//import "."

Window {
    id: mainWindow
    width: 1200
    height: 800
    visible: true
    title: qsTr("Hello World")

    Button {
            text: "Open Dialog"
            onClicked: settings.visible = true
        }

    Dialog {
        id: settings
        padding: 0
        margins: 0
        modal: true

        //Center in main Window

        x: (mainWindow.width-width) / 2
        y: (mainWindow.height-height) / 2

        width: 600
        height: 400



        SwipeView {
            id:swipeView
            anchors.fill: parent
            interactive: false
            clip: true


            Item {
                Label { text: qsTr("Page1"); anchors.centerIn: parent }
                Button {
                        text: "Next"
                        onClicked: swipeView.currentIndex = 1
                }

            }

            Item {
                ColumnLayout {

                    ButtonGroup {
                        id: buttonGroup
                        onClicked: {
                            console.log("boton pulsado: " + button.text)
                        }
                    }

                    anchors.fill: parent
                    spacing: 10
                    Layout.alignment: Qt.AlignHCenter

                    Label {
                        text: qsTr("Page2");
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Button {
                        Layout.alignment: Qt.AlignHCenter
                        text: "Prev"
                        onClicked: swipeView.currentIndex = 0
                    }

                    ListView {
                        id: languageList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignHCenter

                        //model: ["Element 1", "Element 2", "Element 3", "Element 4"]
                        model: TranslatorManager.languages

                        /*
                        delegate: Text {
                            text: modelData
                            font.pixelSize: 16
                            padding: 10
                            color: index % 2 === 0 ? "lightgray" : "black"
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignHCenter
                        }
                        */


                        //delegate: CheckableButton {
                        delegate: Button {
                            //height: Utils.scale(Style.settingsLanguageCheckableButtonHeight)
                            //selected: modelData === TranslatorManager.language
                            text: modelData
                            ButtonGroup.group: buttonGroup
                            //width: 100
                            height: 80
                            //Layout.fillWidth: true
                            //Layout.alignment: Qt.AlignHCenter
                            objectName: 'SelectLanguage'
                        }

                        ScrollBar.vertical: ScrollBar {
                            policy: (languageList.contentHeight > languageList.height) ? ScrollBar.AlwaysOn : ScrollBar.AsNeeded
                        }
                    }
                }
            }
        }
    }
}

