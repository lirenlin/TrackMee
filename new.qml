import QtQuick 1.1
import com.nokia.meego 1.1

Page {
    id: addPage
    Column {
        spacing: 10
        Text {
            text: "This is a single page"
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
        anchors { verticalCenter: sliderLabel.verticalCenter; left: timeSlider }
        anchors { rightMargin: 8; right: parent.right}
    }

    tools: ToolBarLayout {
        id: pageTool
        ToolButton { text: "Cancel"; onClicked: pageStack.pop() }
        ToolButton { text: "Start"; onClicked: pageStack.pop() }
    }
}
