// ──────────────────────────────────────────────────────────────────────
//
// Name					Statistics.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtCharts

import "qrc:/Forms/Staff"

// ──────────────────────────────────────────────────────────────────────

Window
{
	width: 500
	height: 300

	visible: true

	RowLayout
	{
		Layout.margins: 30
		spacing: 10

		ColumnLayout {
			Column {
				Text {
					text: "1:25"
					font.bold: true
					font.pointSize: 30
				}
				Text {
					text: "Grand total"
					font.pointSize: 10
				}
			}

			Column {
				Text {
					text: "4%"
					font.bold: true
					font.pointSize: 30
				}
				Text {
					text: "% skipped"
					font.pointSize: 10
				}
			}
//			Item { Layout.fillWidth: true }
			PieSeries {
				// ???
			}
		}

		ColumnLayout
		{
			Column {
			Column {
			Text {
				text: "65"
				font.bold: true
				font.pointSize: 20
				color: "red"
			}
			Text {
				text: "Work mins"
				font.pointSize: 10
			}}
			Column {
			Text {
				text: "15"
				font.bold: true
				font.pointSize: 20
				color: "yellow"
			}
			Text {
				text: "Break mins"
				font.pointSize: 10
			}}
			Column {
			Text {
				text: "25"
				font.bold: true
				font.pointSize: 20
				color: "green"
			}
			Text {
				text: "Long break mins"
				font.pointSize: 10
			}}}

			Column {
			Column {
			Text {
				text: "5"
				font.bold: true
				font.pointSize: 20
				color: "red"
			}
			Text {
				text: "Works"
				font.pointSize: 10
			}}
			Column {
			Text {
				text: "3"
				font.bold: true
				font.pointSize: 20
				color: "yellow"
			}
			Text {
				text: "Breaks"
				font.pointSize: 10
			}}
			Column {
			Text {
				text: "3"
				font.bold: true
				font.pointSize: 20
				color: "green"
			}
			Text {
				text: "Long breaks"
				font.pointSize: 10
			}}}

			Column {
			Column {
			Text {
				text: "1:25"
				font.bold: true
				font.pointSize: 20
			}
			Text {
				text: "Tracked time"
				font.pointSize: 10
			}}
			Column {
			Text {
				text: "0:25"
				font.bold: true
				font.pointSize: 20
			}
			Text {
				text: "Untracked time"
				font.pointSize: 10
			}}}
	}
}}

// ──────────────────────────────────────────────────────────────────────
