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
			onTriggered: main_window.start();

			enabled: main_window.ticking ? false : true
		}
		Action
		{
			text: "Pause"
			shortcut: "Space"; icon.name: "pause"
			onTriggered: main_window.pause();

			enabled: main_window.ticking ? true : false
		}

		MenuSeparator {}

		Action
		{
			text: "Reset"
			shortcut: "Esc"; icon.name: "clock.arrow.circlepath"
			onTriggered: main_window.reset();
		}
	}
	Menu
	{
		title: "History"

		Action {
			text: "Skip"
			shortcut: "Tab"; icon.name: "forward"
			onTriggered: main_window.skip();
		}
		Action {
			text: "Rewind"
			shortcut: "Shift+Tab"; icon.name: "rewind"
			onTriggered: main_window.rewind();
		}
		Action
		{
			text: "Clear all statistics"
			shortcut: "Ctrl+Backspace"; icon.name: "trash"
			onTriggered: main_window.clear_all_statistics();
		}
	}
	Menu
	{
		title: "Dialogs"

		Action {
			text: "Statistics..."
			shortcut: "Ctrl+~"; icon.name: "chart.bar"
			onTriggered: main_window.open_statistics();
		}
		Action
		{
			text: "Inclinations..."
			shortcut: "Ctrl+_"; icon.name: "gear"
			onTriggered: main_window.open_settings();
		}
	}
}


// ──────────────────────────────────────────────────────────────────────
