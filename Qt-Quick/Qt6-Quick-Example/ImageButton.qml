import QtQuick

Image {
    id: root

    signal clicked()

    width: buttonMouseArea.containsPress ? 49.5 : 50
    height: buttonMouseArea.containsPress ? 49.5 : 50
    opacity: buttonMouseArea.containsMouse ? 0.75 : 1
    mipmap: true

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            root.clicked()
        }
    }
}
