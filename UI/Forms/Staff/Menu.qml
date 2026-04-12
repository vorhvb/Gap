// ──────────────────────────────────────────────────────────────────────
//
// Name					Menu.qml
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

import QtQuick
import QtQuick.Controls

// ──────────────────────────────────────────────────────────────────────

MenuBar
{
	Menu
	{
		title: "Timer"

		Action
		{
			text: "Start"
			shortcut: "Space"; icon.name: "play"
			onTriggered: ;

			enabled: main_window.ticking ? false : true
		}
		Action
		{
			text: "Pause"
			shortcut: "Space"; icon.name: "pause"
			onTriggered: ;

			enabled: main_window.ticking ? true : false
		}

		MenuSeparator {}

		Action
		{
			text: "Reset"
			shortcut: "Esc"; icon.name: "clock.arrow.circlepath"
			onTriggered: ;
		}
	}
	Menu
	{
		title: "History"

		Action {
			text: "Skip"
			shortcut: "Tab"; icon.name: "forward"
			onTriggered: ;
		}
		Action {
			text: "Rewind"
			shortcut: "Shift+Tab"; icon.name: "rewind"
			onTriggered: ;
		}
		Action
		{
			text: "Clear all statistics"
			shortcut: "Ctrl+Backspace"; icon.name: "trash"
			onTriggered: ;
		}
	}
	Menu
	{
		title: "Dialogs"

		Action {
			text: "Statistics..."
			shortcut: "Ctrl+~"; icon.name: "chart.bar"
			onTriggered: ;
		}
		Action
		{
			text: "Inclinations..."
			shortcut: "Ctrl+_"; icon.name: "gear"
			onTriggered: ;
		}
	}
}


// ──────────────────────────────────────────────────────────────────────
