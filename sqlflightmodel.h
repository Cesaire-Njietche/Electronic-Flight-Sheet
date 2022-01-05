#ifndef SQLFLIGHTMODEL_H
#define SQLFLIGHTMODEL_H

#include <QObject>
#include <QTime>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>
#include <QSqlRelationalTableModel>

class SqlFlightModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    SqlFlightModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());

    enum{
        IDRole = Qt::UserRole + 1,
        IDP1Role,
        IDP2Role,
        DateRole,
        FlightRuleRole,
        RouteRole,
        MissionRole,
        AcftRegRole,
        AcftTypeRole,
        DepTimeRole,
        DepAerodromeRole,
        ArrAerodromeRole,
        ArrTimeRole,
        GradeRole,
        ObservationRole,
        FlightRegimeRole,
        FlightTimeRole
    };
    QHash<int, QByteArray> roleNames() const override;


    QVariant data(const QModelIndex &item, int role) const override;
    //bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
public slots:
    int addRecord(QDate, int, int, QString, QString, QString, QString, QString, QString, QString, QString, QString, QString,
                      QString, QString, int);
    bool select();
    bool selectByPilotID(int id);
    bool selectByRole(int role, int id);
    bool selectByDate(QDate s, QDate e);
    bool selectByDateRoleID(QDate s, QDate e, int role, int id);
    bool updateRecord(int id, QString columnName, QString value);
    bool updateRecord(int id, QString columnName, QTime value);
    void unSelect();
    void setForeignKeys();
    QVariantMap get(int idx) const;
    int count();
};

#endif // SQLFLIGHTMODEL_H
