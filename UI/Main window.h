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

#include <QList>
#include <QString>
#include <QTime>

#include <QTimer>

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

	private:
		QTimer metronome;

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
