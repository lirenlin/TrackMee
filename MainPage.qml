// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
import com.nokia.extras 1.1

import QtMobility.location 1.1

//import "js/script.js" as Script

Page {
    id: mainPage
    //orientationLock: PageOrientation.LockPortrait
    anchors.centerIn: parent

    PositionSource {
        id: positionSource
        updateInterval: 1000
        active: false
        onPositionChanged: { }
    }


    Rectangle {
        id: headerBar
        anchors.top: parent.top
        width: parent.width
        z: parent.z + 1
        height: 60
        Rectangle {
            id: rectangle
            anchors.fill: parent
            //  radius: 10
            color: "#00599b"
            Text {
                text: "RecordMee"
                color: "white"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 30
            }

        }
        Image {
            anchors { bottom: rectangle.bottom; left: rectangle.left; right: rectangle.right}
            anchors { bottomMargin: -10 }
            source: "image://theme/meegotouch-menu-shadow-bottom"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { aboutDialog.open()}
        }
    }

    Component {
        id: recordDelegate
        Rectangle {
            id: record
            height: 60
            width: listView.width
            Text {
                id: nameLabel
                text: name
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pointSize: 20
                horizontalAlignment: Text.AlignLeft
            }
            Text {
                id: detailLabel
                text: date 
                anchors.top: nameLabel.bottom
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pointSize: 16
                font.weight: Font.Light
                horizontalAlignment: Text.AlignLeft
                opacity: 0.6
                visible: true
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                Menu {
                    id: contextMenu
                    content: MenuLayout {
                        MenuItem {
                            text: "Delete"
                            onClicked: {
                                //db.removeRow(name)
                                print(index);
                                listModel.remove(index);
                            }
                        }
                    }
                }
                onPressAndHold: contextMenu.open()
                onPressed: { listView.currentIndex = index}

                ListView.onRemove: SequentialAnimation {
                    PropertyAction { target: record; property: "ListView.delayRemove"; value: true }
                    NumberAnimation { target: record; property: "height"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
                    // Make sure delayRemove is set back to false so that the item can be destroyed
                    PropertyAction { target: record; property: "ListView.delayRemove"; value: false }
                }
            }
        }
    }

    ListModel {
        id: listModel

        ListElement {
            name: "Apple"
            date: "Apple"
        }
        ListElement {
            name: "Orange"
            date: "Orange"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }

        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
        ListElement {
            name: "Banana"
            date: "Banana"
        }
    }

    ListView {
        id: listView
        anchors.top: headerBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true
        spacing: 2

        model: listModel
        delegate: recordDelegate

        preferredHighlightBegin: 0; preferredHighlightEnd: 0
        //highlightRangeMode: ListView.StrictlyEnforceRange
        orientation: ListView.Vertical
        //snapMode: ListView.SnapToItem;
        flickDeceleration: 2000
        cacheBuffer: 1200
        highlightFollowsCurrentItem: false
        highlight: Rectangle {
            width: parent.width; height: 60
            color: "#FFFF88"
            opacity: 0.4
            z: listView.currentItem.z+1
            y: listView.currentItem.y;
            Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
        }
    }
    ScrollDecorator {
        flickableItem: listView
    }

    Dialog {
        id: aboutDialog
        title: Rectangle {
            id: titleField
            height: 10
            width: parent.width
            Text {
                id: text
                font.pixelSize: 32
                anchors.centerIn: parent
                color: "white"
                text: "About Dialog"
            }
        }
        content:Item {
            id: content
            height: 50
            width: parent.width
            Text {
                font.pixelSize: 22
                anchors.centerIn: parent
                color: "white"
                text: "This is a simple app"
            }
        }
    }
    tools: ToolBarLayout {
        ToolIcon {
            iconId: "toolbar-add";
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:{ 
                pageStack.push(Qt.resolvedUrl("new.qml"))
            }
        }
    }
}
