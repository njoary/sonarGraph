cmake_minimum_required(VERSION 3.16)

project(SonarGraphs VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 Charts REQUIRED)
find_package(Qt6 6.3 COMPONENTS Quick QuickControls2 Charts REQUIRED)

set(SOURCES
    main.cpp
)

qt_add_resources(SOURCES resources.qrc)

qt_add_executable(appSonarGraphs ${SOURCES})

set_source_files_properties(qml/Theme.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appSonarGraphs
    URI SonarGraphs
    VERSION 1.0
    QML_FILES
    qml/main.qml
    qml/Theme.qml
    qml/Components/Menu.qml
    qml/Components/AmplitudeGraph.qml
    qml/Components/DataReceiver.qml
    qml/Components/DataReceiverWaterfall.qml
)


set_target_properties(appSonarGraphs PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appSonarGraphs
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appSonarGraphs
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::Charts)
