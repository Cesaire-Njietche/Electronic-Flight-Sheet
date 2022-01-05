#ifndef SQLPILOTSIMSESSIONSMODEL_H
#define SQLPILOTSIMSESSIONSMODEL_H

#include <QObject>
#include <QSqlRelationalTableModel>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>
#include <QSqlRelation>

class SqlPilotSimSessionsModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    explicit SqlPilotSimSessionsModel(QObject *parent, QSqlDatabase db = QSqlDatabase());

    enum{
        IDSimSessionRole= Qt::UserRole + 1,
        IDPilotROLE,
        DateRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
public slots:
    bool addRecord(int idP, int idSS, QDate date);
    bool updateRecord(int idP, int idSS, QDate date);
    bool select();
    bool select(int idP);
    bool selectWithForeignKeys();
    QVariantMap get(int idx) const;
};

#endif // SQLPILOTSIMSESSIONSMODEL_H
