// ──────────────────────────────────────────────────────────────────────
//
// Name					Settings.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls

import "qrc:/Forms/Staff"

// ──────────────────────────────────────────────────────────────────────

Window
{
	width: 500
	height: 300

	visible: true

	//font.family: "Noto Sans" // не работает. 𓋹

	Label
	{
		text: "General"
		id: genLabel
		font.bold: true
		font.pointSize: 15
		x: 10
		y: 10
		renderType: Text.NativeRendering
	}
	Label
	{
		text: "Work duration"
		x: work.x + 20
		y: work.y - (height / 2)
		background: Rectangle {color: palette.window}
		color: "grey"
		font.pointSize: 10
		renderType: Text.NativeRendering
	}
	Label
	{
		text: "Break duration"
		x: breakk.x + 20
		y: breakk.y - (height / 2)
		background: Rectangle {color: palette.window}
		color: "grey"
		font.pointSize: 10
		renderType: Text.NativeRendering
	}
	Label
	{
		text: "Long break duration"
		x: lbreak.x + 20
		y: lbreak.y - (height / 2)
		background: Rectangle {color: palette.window}
		color: "grey"
		font.pointSize: 10
		renderType: Text.NativeRendering
	}
	Label
	{
		text: "Cycles"
		x: c.x + 20
		y: c.y - (height / 2)
		background: Rectangle {color: palette.window}
		color: "grey"
		font.pointSize: 10
		renderType: Text.NativeRendering
	}
	SpinBox
	{
		id: work
		width: 460
		height: 30
		x: 10
		y: 10 + genLabel.height + 10
	}
	SpinBox
	{
		id: breakk
		width: 460
		height: 30
		x: 10
		y: 10 + genLabel.height + 10 + 30 + 10
	}
	SpinBox
	{
		id: lbreak
		width: 460
		height: 30
		x: 10
		y: 10 + genLabel.height + 10 + 60 + 10 + 10
	}
	SpinBox
	{
		id: c
		width: 460
		height: 30
		x: 10
		y: 10 + genLabel.height + 10 + 90 + 20 + 20
	}
	Label
	{
		text: "Customization"
		id: secLabel
		font.bold: true
		font.pointSize: 15
		x: 10
		y: c.y + 30 + 20
		renderType: Text.NativeRendering
	}
	TextField
	{
		id: r
		placeholderText: focus ? "" : "Ringtone path"
		x: 10
		y: secLabel.y + secLabel.height + 10
		width: 420
		height: 30
	}
	Label
	{
		text: "Ringtone path"
		visible: r.focus
		x: r.x + 20
		y: r.y - (height / 2)
		background: Rectangle {color: palette.window}
		color: "grey"
		font.pointSize: 10
		renderType: Text.NativeRendering
	}
	ToolButton
	{
		text: "..."
		x: r.x + r.width
		y: r.y
		width: 30
		height: 30
		font.pointSize: 10
	}
}

// ──────────────────────────────────────────────────────────────────────
