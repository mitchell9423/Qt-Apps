import QtQuick

Item {
    id: root

    property color color: "gray"
    property alias text: buttonText.text

    signal clicked()

    Rectangle {
        id: background
        anchors.fill: parent
        color: getModifiedColor(buttonMouseArea, root.color)
    }

    Text {
        id: buttonText

        anchors.centerIn: parent
    }

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            root.clicked()
        }
    }

    function getModifiedColor(item, color)
    {
        if (item.containsPress) {
            return Qt.darker(color)
        } else if (item.containsMouse) {
            return Qt.lighter(color)
        } else {
            return color
        }
    }
}
