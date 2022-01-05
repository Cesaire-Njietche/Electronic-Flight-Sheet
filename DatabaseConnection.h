#ifndef DATABASECONNECTION_H
#define DATABASECONNECTION_H

#include <QSqlDatabase>
#include <QDebug>

class DatabaseConnection{

public:
    QSqlDatabase static connection(){
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL", "efs_1");

        db.setDatabaseName("EFS");
        /*db.setUserName("katelynn");
        db.setHostName("127.0.0.1");
        db.setPassword("eucalyptus2118");*/

        db.setUserName("root");
        db.setHostName("127.0.0.1");
        db.setPassword("");


        if(db.open()){
            return db;
        }
        else
            return QSqlDatabase();
    }
};

#endif // DATABASECONNECTION_H

