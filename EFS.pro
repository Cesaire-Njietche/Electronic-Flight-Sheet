QT += quick quickcontrols2 sql printsupport

CONFIG += c++11 fluid_resource_icons

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        flightsheetprint.cpp \
        licence.cpp \
        licencemanager.cpp \
        licencemodel.cpp \
        main.cpp \
        pilotsheetprint.cpp \
        simsession.cpp \
        simsessionmanager.cpp \
        simsessionmodel.cpp \
        sqlaircraftmodel.cpp \
        sqlflightmodel.cpp \
        sqlflightsheetmodel.cpp \
        sqlhourdeductionmodel.cpp \
        sqllicencemodel.cpp \
        sqlpilotflightmodel.cpp \
        sqlpilotlicencesmodel.cpp \
        sqlpilotmodel.cpp \
        sqlpilotsimsessionsmodel.cpp \
        sqlpilottrainingsmodel.cpp \
        sqlsimsessionmodel.cpp \
        sqltrainingmodel.cpp \
        training.cpp \
        trainingmanager.cpp \
        trainingmodel.cpp


#TEMPLATE = subdirs

#SUBDIRS += fluid

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Calendar.qml \
    CustomComboBox.qml \
    FlightSummary.qml \
    FlightSummaryForm.ui.qml \
    NewPilot.qml \
    NewPilotForm.ui.qml \
    PilotSaveBox.qml \
    TimePicker.qml \
    Training.qml \
    cal.png \
    cal2.png \
    download.png \
    info.png \
    print.png \
    script.js

HEADERS += \
    DatabaseConnection.h \
    flightsheetprint.h \
    helperClass.h \
    licence.h \
    licencemanager.h \
    licencemodel.h \
    pilotsheetprint.h \
    simsession.h \
    simsessionmanager.h \
    simsessionmodel.h \
    sqlaircraftmodel.h \
    sqlflightmodel.h \
    sqlflightsheetmodel.h \
    sqlhourdeductionmodel.h \
    sqllicencemodel.h \
    sqlpilotflightmodel.h \
    sqlpilotlicencesmodel.h \
    sqlpilotmodel.h \
    sqlpilotsimsessionsmodel.h \
    sqlpilottrainingsmodel.h \
    sqlsimsessionmodel.h \
    sqltrainingmodel.h \
    training.h \
    trainingmanager.h \
    trainingmodel.h
