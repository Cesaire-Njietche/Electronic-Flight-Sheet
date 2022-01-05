#ifndef SQLPILOTTRAININGSMODEL_H
#define SQLPILOTTRAININGSMODEL_H

#include <QObject>
#include <QSqlRelationalTableModel>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>
#include <QSqlRelation>

class SqlPilotTrainingsModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    explicit SqlPilotTrainingsModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());

    enum{
        IDPilotROLE = Qt::UserRole + 1,
        IDTrainingRole,
        DateRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
public slots:
    bool addRecord(int idP, int idT, QDate date);
    bool updateRecord(int idP, int idT, QDate date);
    bool select();
    bool select(int idP);
    bool selectWithForeignKeys();
    QVariantMap get(int idx) const;
};

#endif // SQLPILOTTRAININGSMODEL_H
