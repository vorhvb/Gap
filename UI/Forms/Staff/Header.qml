// ──────────────────────────────────────────────────────────────────────
//
// Name					Header.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls

import QtQuick.Layouts

// ──────────────────────────────────────────────────────────────────────

ToolBar
{
	id: header

	RowLayout
	{
		anchors.fill: parent
		anchors.margins: 10

		Item {Layout.fillWidth: true}

		Style.ToolButton
		{
			icon.name: "chart.bar"
			onClicked: main_window.open_statistics();
		}
		Style.ToolButton
		{
			icon.name: "gear"
			onClicked: main_window.open_settings();
		}
	}
}

// ──────────────────────────────────────────────────────────────────────
