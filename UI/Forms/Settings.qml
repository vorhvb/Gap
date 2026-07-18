// ──────────────────────────────────────────────────────────────────────
//
// Name					Settings.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

//import QtQuick.Controls.Material

// ──────────────────────────────────────────────────────────────────────

Window {
    title: "Settings"
    width: 500
    height: 300

    visible: true //Material.theme: Material.Light; Material.accent: "green"

    ColumnLayout {
        anchors.centerIn: parent
        anchors.fill: parent

        anchors.margins: 10
        spacing: 10

        Button {
            id: control
            text: "Done"
            leftPadding: 25
            rightPadding: 25
            topPadding: 5
            bottomPadding: 5
            font.family: "Noto Sans"
            font.pointSize: 13
            background: Rectangle {
                radius: 3
                border.color: "#A3A3A3"
                border.width: 0.3
                gradient: Gradient // кстати градиент отвратительный
                {
                    GradientStop {
                        position: 0
                        color: control.pressed ? (Qt.darker(Qt.lighter(control.palette.button, 1.1), 1.1)) : (Qt.lighter(control.palette.button, 1.1))
                        Behavior on color {
                            ColorAnimation {
                                duration: 100
                            }
                        }
                    }
                    GradientStop {
                        position: 1
                        color: control.pressed ? (Qt.lighter(Qt.darker(control.palette.button, 1.1), 1.1)) : (Qt.darker(control.palette.button, 1.1))
                        Behavior on color {
                            ColorAnimation {
                                duration: 100
                            }
                        }
                    }
                }
                color: "white"
            }

            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: Qt.darker(control.palette.window, 1.3)

                shadowHorizontalOffset: 1
                shadowVerticalOffset: 1
                shadowBlur: 0.5
            }

            palette.button: "#2D8AED"
        }
        Button {
            id: control2
            text: "Cancel"
            leftPadding: 25
            rightPadding: 25
            topPadding: 5
            bottomPadding: 5
            font.family: "Noto Sans"
            font.pointSize: 13
            background: Rectangle {
                radius: 3
                border.color: "#A3A3A3"
                border.width: 0.3
                color: control2.pressed ? Qt.darker("white", 1.1) : "white"
            }

            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: Qt.darker(control2.palette.window, 1.3)

                shadowHorizontalOffset: 1
                shadowVerticalOffset: 1
                shadowBlur: 0.5
            }
        }
    }
}

// ──────────────────────────────────────────────────────────────────────
