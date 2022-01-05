#ifndef SQLPILOTFLIGHT_H
#define SQLPILOTFLIGHT_H

#include <QObject>
#include <QSqlRecord>
#include <QSqlRelationalTableModel>

class SqlPilotFlightModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    SqlPilotFlightModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());
    enum{
        IDFlightRole = Qt::UserRole  + 1,
        IDPilotRole,
        RoleRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
public slots:
    bool addRecord(int idP, int idF, int role); //role 0 for pilot and 1 for co-pilot
    bool updateRecord(int idP, int idF, int role);
    bool select();
    bool select(int idP);
    void select(int idF, int role);
    void unSelect();
    //bool selectWithForeignKeys();
    QVariantMap get(int idx) const;
};

#endif // SQLPILOTFLIGHT_H
