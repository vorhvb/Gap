# ──────────────────────────────────────────────────────────────────────
#
# Name					Makefile
# Project				Gap
# Author				Elisey Konstantinov
#
# License				GPL v3
#
# ──────────────────────────────────────────────────────────────────────

COMPILER = ccache clang++
LINKER = clang++ -fuse-ld=lld

FLAGS = -std=c++23 -flto
C = `pkg-config --cflags Qt6Core Qt6Gui Qt6Widgets Qt6Quick Qt6Multimedia`
LD = `pkg-config --libs Qt6Core Qt6Gui Qt6Widgets Qt6Quick Qt6Multimedia` -Wl,--icf=safe

# ──────────────────────────────────────────────────────────────────────

all: prepare generate precompile compile link
generate:
	qmlcachegen "UI/Forms/Main window.qml" -o "Build/Generated/Cache/Main window.qmlc"
	qmlcachegen UI/Forms/Statistics.qml -o Build/Generated/Cache/Statistics.qmlc
	qmlcachegen UI/Forms/Settings.qml -o Build/Generated/Cache/Settings.qmlc

	qmlcachegen UI/Forms/Staff/Menu.qml -o Build/Generated/Cache/Staff/Menu.qmlc
	qmlcachegen UI/Forms/Staff/Header.qml -o Build/Generated/Cache/Staff/Header.qmlc
	qmlcachegen UI/Forms/Staff/Progress.qml -o Build/Generated/Cache/Staff/Progress.qmlc
	qmlcachegen UI/Forms/Staff/Style.qml -o Build/Generated/Cache/Staff/Style.qmlc

	moc "UI/Main window.h" -o "Build/Generated/Meta/Main window.cpp"
	moc UI/Statistics.h -o Build/Generated/Meta/Statistics.cpp
	moc UI/Settings.h -o Build/Generated/Meta/Settings.cpp

	rcc Resources/Description.qrc -o Build/Generated/Resources.cpp
precompile:
	$(COMPILER) -c "Build/Generated/Meta/Main window.cpp" -o "Build/Objects/Meta/Main window.o" \
		$(FLAGS) $(C)
	$(COMPILER) -c Build/Generated/Meta/Statistics.cpp -o Build/Objects/Meta/Statistics.o \
		$(FLAGS) $(C)
	$(COMPILER) -c Build/Generated/Meta/Settings.cpp -o Build/Objects/Meta/Settings.o \
		$(FLAGS) $(C)

	$(COMPILER) -c Build/Generated/Resources.cpp -o Build/Objects/Resources.o \
		$(FLAGS) $(C)
compile:
	$(COMPILER) -c Main.cpp -o Build/Objects/Main.o \
		$(FLAGS) $(C)

	$(COMPILER) -c UI/*.cpp \
		$(FLAGS) $(C) \
	&& mv *.o Build/Objects/UI
link:
	$(LINKER) Build/Objects/*.o Build/Objects/Meta/*.o Build/Objects/UI/*.o -o Build/Gap \
		$(FLAGS) $(LD)

prepare:
	-mkdir Build
	-mkdir Build/Generated
	-mkdir Build/Objects

	-mkdir Build/Generated/Cache
	-mkdir Build/Generated/Cache/Staff
	-mkdir Build/Generated/Meta

	-mkdir Build/Objects/Meta
	-mkdir Build/Objects/UI

# ──────────────────────────────────────────────────────────────────────

clean:
	-rm -r Build/Generated
	-rm -r Build/Objects
scrub:
	-rm -r Build
run:
	Build/Gap

# ──────────────────────────────────────────────────────────────────────

dump:
	tree || find .

	cat Main.cpp

	cat UI/*.h
	cat UI/*.cpp

	cat UI/Forms/*.qml
	cat UI/Forms/Staff/*.qml
	cat Resources/Description.qrc

	cat Makefile

edit:
	code . || $(VISUAL) . || $(EDITOR) .

# ──────────────────────────────────────────────────────────────────────
