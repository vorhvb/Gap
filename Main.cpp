// ──────────────────────────────────────────────────────────────────────
//
// Name					Main.cpp
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

#include <QApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

// ──────────────────────────────────────────────────────────────────────

#include "UI/Main window.h"

#include "UI/Statistics.h"
#include "UI/Settings.h"

// ──────────────────────────────────────────────────────────────────────

QQmlApplicationEngine* escalation;

// ──────────────────────────────────────────────────────────────────────

int main (int n, char** x)
{
	QApplication gap (n, x);
	QQmlApplicationEngine engine;
	escalation = &engine;

	MainWindow main_window;
	Statistics statistics;
	Settings settings;

	engine.rootContext() -> setContextProperty ("main_window", &main_window);
	engine.rootContext() -> setContextProperty ("settings", &settings);
	engine.rootContext() -> setContextProperty ("statistics", &statistics);

	engine.load (QUrl ("qrc:/Forms/Main window.qml"));

    return gap.exec();
}

// ──────────────────────────────────────────────────────────────────────
