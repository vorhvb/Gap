// ──────────────────────────────────────────────────────────────────────
//
// Name					Statistics.h
// Project				Gap
// Author				Elisey Konstantinov
//
// License				GPL v3
//
// ──────────────────────────────────────────────────────────────────────

#pragma once
#include <QObject>

// ──────────────────────────────────────────────────────────────────────

#include <QTime>

// ──────────────────────────────────────────────────────────────────────

class Statistics : public QObject
{
	Q_OBJECT

	Q_PROPERTY (QTime sessions MEMBER sessions NOTIFY sessions_chaged)
	Q_PROPERTY (QTime skipped MEMBER skipped NOTIFY skipped_chaged)

	Q_PROPERTY (QTime works MEMBER works NOTIFY works_chaged)
	Q_PROPERTY (QTime breaks MEMBER breaks NOTIFY breaks_chaged)
	Q_PROPERTY (QTime long_breaks MEMBER long_breaks NOTIFY long_breaks_chaged)
	Q_PROPERTY (QTime work_time MEMBER work_time NOTIFY work_time_chaged)
	Q_PROPERTY (QTime break_time MEMBER break_time NOTIFY break_time_chaged)
	Q_PROPERTY (QTime long_break_time MEMBER long_break_time NOTIFY long_break_time_chaged)
	Q_PROPERTY (QTime tracked MEMBER tracked NOTIFY tracked_chaged)
	Q_PROPERTY (QTime untracked MEMBER untracked NOTIFY untracked_chaged)

	public:
		;
	public slots:
		;

	private:
		;
};

// ──────────────────────────────────────────────────────────────────────
