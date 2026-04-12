// ──────────────────────────────────────────────────────────────────────
//
// Name					Progress.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls

// ──────────────────────────────────────────────────────────────────────

Row
{
	spacing: 5

	Repeater
	{
		model: main_window.progress

		Rectangle
		{
			color: modelData == "work" ? "#EF5350" : "#9CCC65"
			width: parent.height
			height: parent.height

			radius: width / 2

			SequentialAnimation on opacity
			{
				loops: Animation.Infinite
				NumberAnimation {from: 0.5; to: 1.0; duration: 500}
				NumberAnimation {from: 1.0; to: 0.5; duration: 500}

				running: main_window.ticking ? (index == main_window.progress.length - 1) : false
			}
		}
	}
}

// ──────────────────────────────────────────────────────────────────────
