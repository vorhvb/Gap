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

import "qrc:/Forms/Staff"

// ──────────────────────────────────────────────────────────────────────

Style.ApplicationWindow
{
	title: "Gap"
	width: 400
	height: 500

	visible: true

	menuBar: Menu {}
	header: Header {}

	ColumnLayout
	{
		anchors.centerIn: parent
		anchors.top: header.bottom
		anchors.bottom: parent.bottom

		anchors.margins: 10
		spacing: 25

		Image
		{
			source: main_window.mode == "work" ? "qrc:/Resources/Work.svg" : "qrc:/Resources/Pause.svg"
			sourceSize: Qt.size(256, 256)

			Text
			{
				text: main_window.time.toLocaleTimeString (Qt.locale(), "mm:ss")
				anchors.centerIn: parent
				anchors.verticalCenterOffset: 25

				font.pointSize: 30
			}
		}
		Progress {Layout.alignment: Qt.AlignHCenter; Layout.preferredHeight: 5}

		RowLayout
		{
			spacing: 30
			Layout.alignment: Qt.AlignHCenter

			Style.Button
			{
				text: main_window.ticking ? "Pause" : "Start"
				palette.buttonText: "white"
				palette.button: main_window.ticking ? "#F3CA27" : "#3DB670"

				onClicked: main_window.ticking ? main_window.pause() : main_window.start();
			}
			Style.Button
			{
				text: "Reset"
				palette.buttonText: "white"
				palette.button: "#C74D40"

				onClicked: main_window.reset();
			}
		}
	}
}

// ──────────────────────────────────────────────────────────────────────
