#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QAbstractTableModel>
#include <QQmlContext>


#include "licencemodel.h"
#include "licencemanager.h"

#include "trainingmanager.h"
#include "trainingmodel.h"

#include "simsessionmanager.h"
#include "simsessionmodel.h"

#include "DatabaseConnection.h"
#include "sqltrainingmodel.h"
#include "sqllicencemodel.h"
#include "sqlaircraftmodel.h"
#include "sqlsimsessionmodel.h"
#include "sqlpilotmodel.h"
#include "sqlpilottrainingsmodel.h"
#include "sqlpilotlicencesmodel.h"
#include "sqlpilotsimsessionsmodel.h"
#include "sqlflightmodel.h"
#include "sqlpilotflightmodel.h"
#include "sqlhourdeductionmodel.h"
#include "helperClass.h"
#include "flightsheetprint.h"
#include "pilotsheetprint.h"
#include <QDate>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<LicenceModel>("EFS", 1, 0, "LicenceModel");
    qmlRegisterType<TrainingModel>("EFS", 1, 0, "TrainingModel");
    qmlRegisterType<SimSessionModel>("EFS", 1, 0, "SimSessionModel");

    QSqlDatabase db = DatabaseConnection::connection(); //Get the database connection

    if(!db.isValid()){
        qDebug() << "Can't open the database connection! --- " + db.lastError().text();
    }
    else
    {
        qDebug() << "Connection Opened !";
    }

    //Access to the database tables

    //Training table
    SqlTrainingModel sqlTrainingModel(qApp, db);
    sqlTrainingModel.setTable("Training");
    sqlTrainingModel.select();
    //Licence table
    SqlLicenceModel sqlLicenceModel(qApp, db);
    sqlLicenceModel.setTable("Licence");
    sqlLicenceModel.select();
    //Aircraft table
    SqlAircraftModel sqlAircraftModel(qApp, db);
    sqlAircraftModel.setTable("Aircraft");
    sqlAircraftModel.select();
    //Sim_Session table
    SqlSimSessionModel sqlSimSessionModel(qApp, db);
    sqlSimSessionModel.setTable("Sim_Session");
    sqlSimSessionModel.select();
    //Pilot table
    SqlPilotModel sqlPilotModel(qApp, db);
    sqlPilotModel.setTable("Pilot");
    sqlPilotModel.select();
    //Pilot_Training table
    SqlPilotTrainingsModel sqlPilotTrainingModel(qApp, db);
    sqlPilotTrainingModel.setTable("Pilot_Training");
    //Pilot_Licence table
    SqlPilotLicencesModel sqlPilotLicenceModel(qApp, db);
    sqlPilotLicenceModel.setTable("Pilot_Licence");
    //Pilot_SimSession table
    SqlPilotSimSessionsModel sqlPilotSimSessionModel(qApp, db);
    sqlPilotSimSessionModel.setTable("Pilot_SimSession");
    //Flight table
    SqlFlightModel sqlFlightModel(qApp, db);
    sqlFlightModel.setTable("Flight");
    //Pilot_Flight table
    SqlPilotFlightModel sqlPilotFlightModel(qApp, db);
    sqlPilotFlightModel.setTable("Pilot_Flight");
    //Hour_Deduction table
    SqlHourDeductionModel sqlHourDeductionModel(qApp, db);
    sqlHourDeductionModel.setTable("Hour_Deduction");

    for(int i = 0; i < sqlPilotModel.rowCount(); i++){
        QSqlRecord record = sqlPilotModel.record(i);
        int id = record.value("ID_pilot").toInt();
        sqlHourDeductionModel.addRecord(id, 0, 0, 0, 0, 0);
    }




    /*QSqlRelationalTableModel model(qApp, db);
    model.setTable("Pilot_Training");
    model.setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "name"));
    model.setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "surname"));
    model.setRelation(1, QSqlRelation("Training", "ID_Training", "center"));

    model.select();

    for (int i = 0; i < model.rowCount(); ++i) {
       QString name = model.record(i).value("name").toString();
       QString surname = model.record(i).value("surname").toString();
       QString center = model.record(i).value("center").toString();
       QDate date = model.record(i).value("date").toDate();
       //int salary = model.record(i).value("salary").toInt();
            qDebug() << name << surname << center << date.toString() ;
    }*/


    //Properties of model to enter a new pilot
    LicenceManager _lm;
    TrainingManager _tm;
    SimSessionManager _ssm;
    FlightSheetPrint _fsp;
    PilotSheetPrint _ps;


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("TrainingModel", &sqlTrainingModel);
    engine.rootContext()->setContextProperty("LicenceModel", &sqlLicenceModel);
    engine.rootContext()->setContextProperty("AircraftModel", &sqlAircraftModel);
    engine.rootContext()->setContextProperty("SimSessionModel", &sqlSimSessionModel);
    engine.rootContext()->setContextProperty("PilotModel", &sqlPilotModel);
    engine.rootContext()->setContextProperty("PilotTrainingModel", &sqlPilotTrainingModel);
    engine.rootContext()->setContextProperty("PilotLicenceModel", &sqlPilotLicenceModel);
    engine.rootContext()->setContextProperty("PilotSimSessionModel", &sqlPilotSimSessionModel);
    engine.rootContext()->setContextProperty("FlightModel", &sqlFlightModel);
    engine.rootContext()->setContextProperty("PilotFlightModel", &sqlPilotFlightModel);
    engine.rootContext()->setContextProperty("HourDeductionModel", &sqlHourDeductionModel);
    engine.rootContext()->setContextProperty("LM", &_lm);
    engine.rootContext()->setContextProperty("TM", &_tm);
    engine.rootContext()->setContextProperty("SSM", &_ssm);
    engine.rootContext()->setContextProperty("FSP", &_fsp);
    engine.rootContext()->setContextProperty("PS", &_ps);


    const QUrl url(QStringLiteral("qrc:/main.qml"));


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
//qDebug() << component.isReady();
    return app.exec();
}
