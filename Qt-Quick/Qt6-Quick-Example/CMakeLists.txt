cmake_minimum_required(VERSION 3.16)

project(Qt6-Quick-Example VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick Multimedia)


qt_add_executable(appQt6-Quick-Example
    main.cpp
)

qt_add_qml_module(appQt6-Quick-Example
    URI Qt6-Quick-Example
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES AudioInfoBox.qml
    QML_FILES ImageButton.qml

    RESOURCES
    Assets/Images/Boygenius_-_the_record.jpg
    Assets/Images/Caroline_Polachek_-_Desire,_I_Want_to_Turn_Into_You.png
    Assets/Images/Yeule_-_Softscars.png

    Assets/Icons/Next.png
    Assets/Icons/Pause.png
    Assets/Icons/Play.png
    Assets/Icons/Previous.png
    Assets/Icons/Jukebox.ico

    Assets/Videos/Free_Test_Data_5MB_AVI.avi
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQt6-Quick-Example PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQt6-Quick-Example
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQt6-Quick-Example
    PRIVATE Qt6::Quick Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appQt6-Quick-Example
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
