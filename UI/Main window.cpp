// ──────────────────────────────────────────────────────────────────────
//
// Name					Main window.cpp
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

#include "Main window.h"
#include <QDebug>

// ──────────────────────────────────────────────────────────────────────

MainWindow::MainWindow()
{
	connect (&metronome, &QTimer::timeout, this, &MainWindow::shake);
	sound.setLoopCount (QSoundEffect::Infinite);

	if (!read_settings())
	{
		work_duration = QTime (0, 25, 0);
		break_duration = QTime (0, 5, 0);
		long_break_duration = QTime (0, 15, 0);
		cycles = 4;

		ringtone = NULL;
		debug_mode = true;
	}
	if (debug_mode)
	{
		work_duration = QTime (0, 0, work_duration.minute());
		break_duration = QTime (0, 0, break_duration.minute());
		long_break_duration = QTime (0, 0, long_break_duration.minute());
	}
	reset();

	if (!ringtone.isNull()) sound.setSource (QUrl::fromLocalFile (ringtone));
	else sound.setSource (QUrl("qrc:/Resources/Ringtone.wav"));
}

// ──────────────────────────────────────────────────────────────────────

void MainWindow::shake()
{
	if (time == QTime (0, 0, 0))
	{
		metronome.stop();
		end();
	}
	else
		time = time.addSecs(-1); emit time_changed();
}
void MainWindow::end()
{
	QString saved_mode = mode;
	if (mode == "work")
	{
		milestones_passed++;

		if (milestones_passed >= cycles)
		{
			milestones_passed = 0;

			mode = "long_break"; emit mode_changed();
			time = long_break_duration; emit time_changed();
		}
		else
		{
			mode = "break"; emit mode_changed();
			time = break_duration; emit time_changed();
		}
	}
	else
	{
		mode = "work"; emit mode_changed();
		time = work_duration;
	}

	ring (saved_mode);
}
void MainWindow::ring (QString about)
{
	progress << mode; emit progress_changed();
	sound.play();

	QMessageBox box;
	QString body = about == "work" ? "Work is done!" : (about == "break" ? "Break is ended!" : "Long break is ended!");
	body += '\n';

	box.setWindowTitle ("Gap");
	box.setText (body + "Ready to go?");
	box.addButton ("Next cycle", QMessageBox::AcceptRole);
	box.addButton ("Dismiss", QMessageBox::RejectRole);
	box.exec();

	if (box.buttonRole (box.clickedButton()) == QMessageBox::AcceptRole) start();
	else pause();

	sound.stop();
}

bool MainWindow::read_settings()
{
	qDebug() << "Settings read is not yet implemented, using defaults :/";
	return false;
}

// ──────────────────────────────────────────────────────────────────────

void MainWindow::start()
{
	if (progress.isEmpty())
		progress << "work"; emit progress_changed();

	metronome.start (1000);
	ticking = true; emit ticking_changed();
}
void MainWindow::pause()
{
	metronome.stop();
	ticking = false; emit ticking_changed();
}
void MainWindow::reset()
{
	pause();

	time = work_duration; emit time_changed();
	mode = "work"; emit mode_changed();
	progress.clear(); emit progress_changed();

	milestones_passed = 0;
}

void MainWindow::skip()
{
	qDebug() << "Sorry, statistics manipulation isn’t implimented :(";
}
void MainWindow::rewind()
{
	qDebug() << "Sorry, statistics manipulation isn’t implimented :(";
}

void MainWindow::clear_all_statistics()
{
	qDebug() << "Sorry, statistics manipulation isn’t implimented :(";
}

void MainWindow::open_settings()
{
	qDebug() << "Sorry, can’t open settings: not implimented";
}
void MainWindow::open_statistics()
{
	qDebug() << "Sorry, can’t open statistics: not implimented";
}

// ──────────────────────────────────────────────────────────────────────
