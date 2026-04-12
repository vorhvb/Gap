// ──────────────────────────────────────────────────────────────────────
//
// Name					Style.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls as T

import QtQuick.Effects

// ──────────────────────────────────────────────────────────────────────

Item
{
	component ApplicationWindow: T.ApplicationWindow
	{
		minimumWidth: width; maximumWidth: width
		minimumHeight: height; maximumHeight: height

		font.pointSize: 13
	}

// ──────────────────────────────────────────────────────────────────────

	component Button: T.Button
	{
		implicitWidth: implicitContentWidth + 50
		implicitHeight: implicitContentHeight + 25

		background: Rectangle
		{
			radius: 3

			color: parent.pressed ? Qt.darker (palette.button, 1.1) : palette.button
			Behavior on color {ColorAnimation {duration: 100}}
		}

		layer.enabled: true
		layer.effect: MultiEffect
		{
			shadowEnabled: true
			shadowColor: Qt.darker (parent.palette.window, 1.3)

			shadowHorizontalOffset: 3
			shadowVerticalOffset: 3
			shadowBlur: 0.5
		}

		scale: hovered ? 1.1 : 1.0
		Behavior on scale {NumberAnimation {duration: 100}}
	}

	component ToolButton: T.ToolButton
	{
		background: Rectangle
		{
			radius: 3

			color: parent.pressed ? Qt.darker (parent.palette.window, 1.1) : parent.palette.window
			Behavior on color {ColorAnimation {duration: 100}}
		}

		scale: hovered ? 1.1 : 1.0
		Behavior on scale {NumberAnimation {duration: 100}}
	}
}

// ──────────────────────────────────────────────────────────────────────
