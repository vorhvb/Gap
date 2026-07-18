// ──────────────────────────────────────────────────────────────────────
//
// Name					Main window.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtQuick.Effects

// ──────────────────────────────────────────────────────────────────────

pragma ComponentBehavior: Bound

// ──────────────────────────────────────────────────────────────────────

ApplicationWindow
{
	title: "Gap"
	width: 400
	height: 500

	visible: true

	ColumnLayout
	{
		anchors.centerIn: parent
		anchors.top: parent.bottom
		anchors.bottom: parent.bottom

		anchors.margins: 10

		component SButton: Button {
			id: root

			// Свойства для настройки стиля
			property color backgroundColor: "#4A90E2"      // Основной цвет кнопки
			property color backgroundColorHover: "#357ABD"  // Цвет при наведении
			property color textColor: "white"               // Цвет текста
			property real cornerRadius: 8                   // Радиус скругления углов
			property bool isPrimary: true                   // Primary или Secondary стиль

			implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
			                        implicitContentWidth + leftPadding + rightPadding)
			implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
			                        implicitContentHeight + topPadding + bottomPadding)

			padding: 12
			spacing: 8

			// Текст кнопки
			contentItem: Text {
			    text: root.text
			    font: root.font
			    font.pixelSize: 16
			    font.weight: Font.Medium
			    color: root.textColor
			    horizontalAlignment: Text.AlignHCenter
			    verticalAlignment: Text.AlignVCenter
			    elide: Text.ElideRight
			}

			// Фон кнопки с градиентом и тенями
			background: Rectangle {
			    id: bgRect
			    radius: root.cornerRadius

			    // Градиент в зависимости от состояния
			    gradient: Gradient {
			        orientation: Gradient.Vertical

			        GradientStop {
			            position: 0.0
			            color: root.pressed ?
			                Qt.darker(root.backgroundColor, 1.1) :
			                (root.hovered ? root.backgroundColorHover : root.backgroundColor)
			        }

			        GradientStop {
			            position: 1.0
			            color: root.pressed ?
			                Qt.darker(root.backgroundColor, 1.2) :
			                (root.hovered ? Qt.darker(root.backgroundColorHover, 1.05) : Qt.darker(root.backgroundColor, 1.1))
			        }
			    }

			    // Тень для объема
			    layer.enabled: true
			    layer.effect: DropShadow {
			        transparentBorder: true
			        horizontalOffset: 0
			        verticalOffset: 2
			        radius: 4
			        samples: 16
			        color: Qt.rgba(0, 0, 0, 0.15)
			    }

			    // Анимация изменения цвета
			    Behavior on gradient {
			        ColorAnimation {
			            duration: 150
			            easing.type: Easing.OutCubic
			        }
			    }

			    // Визуальная обратная связь при нажатии
			    opacity: root.pressed ? 0.95 : 1.0

			    Behavior on opacity {
			        NumberAnimation {
			            duration: 100
			        }
			    }
			}
		}
	}

	SButton {text: "Go"}
}


// ──────────────────────────────────────────────────────────────────────
