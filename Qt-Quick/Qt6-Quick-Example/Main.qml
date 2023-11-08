import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    id: root
    width: 640
    height: 480
    visible: true

    title: qsTr("Jukebox")

    Rectangle {
        id: topbar

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#5F8575"
    }

    Rectangle {
        id: mainSection

        anchors {
            top: topbar.bottom
            bottom: bottomBar.top
            left: parent.left
            right: parent.right
        }

        color: "#1e1e1e"

        AudioInfoBox {
            id: firstSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 0
            title: "The Record"
            authorName: "Boygenius"
            imageSource: "Assets/Images/Boygenius_-_the_record.jpg"
        }

        AudioInfoBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 1
            title: "Desire, I Want to Turn Into You"
            authorName: "Caroline Polachek"
            imageSource: "Assets/Images/Caroline_Polachek_-_Desire,_I_Want_to_Turn_Into_You.png"
        }

        AudioInfoBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 2
            title: "Softscars"
            authorName: "Yeule"
            imageSource: "Assets/Images/Yeule_-_Softscars.png"
        }

        AudioInfoBox {
            id: fourthSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 3
            title: "Free Test Data"
            authorName: "5MB AVI"
            videoSource: "qrc:/Qt6-Quick-Example/Assets/Videos/Free_Test_Data_5MB_AVI.avi"
        }
    }

    Rectangle {
        id: bottomBar

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: 100
        color: "#333333"


        ImageButton {
            id: previousButton

            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset: -70
            }

            source: "Assets/Icons/Previous.png"

            onClicked: playerController.switchToPreviousSong()
        }

        ImageButton {
            id: playPauseButton

            anchors.centerIn: parent

            source: playerController.playing ? "Assets/Icons/Pause.png" : "Assets/Icons/Play.png"

            onClicked: playerController.playPause()
        }

        ImageButton {
            id: nextButton

            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset: 70
            }

            source: "Assets/Icons/Next.png"

            onClicked: playerController.switchToNextSong()
        }
    }

    QtObject {
        id: playerController

        property int currentSongIndex: 0
        property int songCount: 4
        property bool playing: true

        function playPause() {
            playing = !playing
            if (playing) {
                fourthSong.video.play()
            } else {
                fourthSong.video.pause()
            }
        }

        function switchToNextSong() {
            currentSongIndex =  (currentSongIndex + 1) % songCount
            console.log(currentSongIndex)
        }

        function switchToPreviousSong() {
            if (currentSongIndex == 0) currentSongIndex = songCount;
            currentSongIndex =  (currentSongIndex - 1) % songCount
            console.log(currentSongIndex)
        }
    }
}
