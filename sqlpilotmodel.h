#ifndef SQLPILOTMODEL_H
#define SQLPILOTMODEL_H

#include <QObject>
#include <QSqlTableModel>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>

class SqlPilotModel : public QSqlTableModel
{
    Q_OBJECT

public:
    explicit SqlPilotModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());

    enum{
        IDRole = Qt::UserRole + 1,
        NameRole,
        SurnameRole,
        TelephoneRole,
        EmailRole,
        UnitRole,
        SpecialityRole,
        DateCempnRole,
        DateCempnExpRole,
        PhotoRole,
        GradeRole,
        BirthdateRole
    };
    QHash<int, QByteArray> roleNames() const override;


    QVariant data(const QModelIndex &item, int role) const override;
    //bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
public slots:
    int addRecord(QString, QString, QString, QString, QString, QString, QDate, QDate, QString,
                      QString, QDate);
    bool select();
    bool updateRecord(int id, QString columnName, QString value);
    bool updateRecord(int id, QString columnName, QDate value);
    QVariantMap get(int idx) const;

};

#endif // SQLPILOTMODEL_H
