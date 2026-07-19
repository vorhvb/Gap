// ──────────────────────────────────────────────────────────────────────
//
// Name					Main window.h
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

#pragma once
#include <QObject>

// ──────────────────────────────────────────────────────────────────────

#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>

#include <QList>
#include <QString>
#include <QFile>
#include <QTime>
#include <QUrl>

#include <QTimer>
#include <QSoundEffect>
#include <QMessageBox>
#include <cstddef>

// ──────────────────────────────────────────────────────────────────────

extern QQmlApplicationEngine* escalation;

// ──────────────────────────────────────────────────────────────────────

class MainWindow : public QObject
{
	Q_OBJECT

	Q_PROPERTY (QTime time MEMBER time NOTIFY time_changed)
	Q_PROPERTY (QString mode MEMBER mode NOTIFY mode_changed)
	Q_PROPERTY (QList<QString> progress MEMBER progress NOTIFY progress_changed)

	Q_PROPERTY (bool ticking MEMBER ticking NOTIFY ticking_changed)

	public:
		MainWindow();

		QTime time;
		QString mode;
		QList<QString> progress;

		bool ticking;

		signals:
			void time_changed();
			void mode_changed();
			void progress_changed();
			void ticking_changed();
	public slots:
		void start();
		void pause();
		void reset();

		void skip();
		void rewind();

		void clear_all_statistics();

		void open_settings();
		void open_statistics();

	protected:
		//fixme: check if UB. Nope there’s no UB, just error "component is not ready"
		QQmlComponent statistics {escalation, QUrl ("qrc:/Forms/Statistics.qml")}; QPointer<QQuickWindow> true_statistics = nullptr;
		QQmlComponent settings {escalation, QUrl ("qrc:/Forms/Settings.qml")}; QPointer<QQuickWindow> true_settings = nullptr;

	private:
		QTimer metronome;
		QSoundEffect sound;

		QTime work_duration; QTime break_duration; QTime long_break_duration; int cycles;
		QString ringtone;
		bool debug_mode;

		void shake(); void ring (QString about); void end();
		bool read_settings();

		int milestones_passed;
 		bool time_travel_available;
		struct
		{
			QTime time;
			QString mode;
			QList<QString> progress;

			bool ticking;
		} time_machine;
};

// ──────────────────────────────────────────────────────────────────────
