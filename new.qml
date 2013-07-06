import QtQuick 1.1
import com.nokia.meego 1.1
import QtMobility.location 1.1

Page {
    id: addPage
    property int interval: 1000
    property bool recording: false

    onRecordingChanged: {
        if(addPage.recording) {
            print(recording)
            positionSource.start()
        }
    }

    PositionSource {
        id: positionSource
        updateInterval: addPage.interval
        active: false
        onPositionChanged: {
            if(typeof(positionSource.position.coordinate.latitude)!="undefined") {
                if(positionSource.position.latitudeValid) {
                    latitude.text = position.coordinate.latitude
                    longitude.text = position.coordinate.longitude
                    altitude.text = position.coordinate.altitude
                }
            }
        }
    }

    Column {
        spacing: 10
        Text {
            id: latitude
            text: ""
        }
        Text {
            id: longitude
            text: ""
        }
        Text {
            id: altitude
            text: ""
        }
    }

    Label {
        id: nameLabel
        anchors { left: parent.left; leftMargin: 8}
        anchors { verticalCenter: parent.verticalCenter }
        text: "Name:"
    }

    TextField {
        id: textInput
        anchors { left: nameLabel.right; leftMargin: 8; right: parent.right; rightMargin: 8;}
        anchors { verticalCenter: nameLabel.verticalCenter }
        placeholderText: "Add file name"
    }

    /*
     TextInput {
         id: textInput
         anchors { left: nameLabel.right; leftMargin: 8; right: parent.right; rightMargin: 8;}
         anchors { verticalCenter: nameLabel.verticalCenter }
         selectByMouse: true
     }
     */

    Label {
        id: sliderLabel
        anchors { left: parent.left; leftMargin: 8}
        anchors { top: nameLabel.bottom; topMargin: 8}
        text: "Interval:"
    }

    Slider {
        id:timeSlider
        stepSize:1
        valueIndicatorVisible: true
        minimumValue:0
        maximumValue:100
        anchors { verticalCenter: sliderLabel.verticalCenter; left: sliderLabel.right }
        anchors { rightMargin: 8; right: parent.right}
    }

    tools: ToolBarLayout {
        id: pageTool
        ToolButton { text: "Cancel"; onClicked: pageStack.pop() }
        ToolButton { text: "Start"; onClicked: addPage.recording = true}
    }
}
