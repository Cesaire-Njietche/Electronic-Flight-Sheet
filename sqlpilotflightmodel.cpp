#include "sqlpilotflightmodel.h"

SqlPilotFlightModel::SqlPilotFlightModel(QObject *parent, QSqlDatabase db): QSqlRelationalTableModel(parent, db)
{

}

QVariant SqlPilotFlightModel::data(const QModelIndex &item, int role) const
{
    if (item.row() >= rowCount())
        return QString();

    if (role < Qt::UserRole)
        return QSqlQueryModel::data(item, role);
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(item.row(), columnIdx);
        return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
}

Qt::ItemFlags SqlPilotFlightModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 2)
        flags |= Qt::ItemIsEditable;
    return flags;
}

QHash<int, QByteArray> SqlPilotFlightModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDFlightRole] = "ID_Flight";
    names[IDPilotRole] = "ID_Pilot";
    names[RoleRole] = "role";

    return names;
}

bool SqlPilotFlightModel::addRecord(int idP, int idF, int role)
{
    auto newRecord = record();

    newRecord.setValue("ID_Pilot", idP);
    newRecord.setValue("ID_Flight", idF);
    newRecord.setValue("role", role);

    bool ok = insertRecord(-1, newRecord);
    submitAll();

    return ok;
}

bool SqlPilotFlightModel::updateRecord(int idP, int idF, int role)
{
    QString filter("ID_Pilot = ");

    filter += "'" + QString::number(idP) + "'" + "AND ID_Flight = " + "'" + QString::number(idF) + "'";
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue("role", role);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlPilotFlightModel::select()
{
    return QSqlRelationalTableModel::select();
}

bool SqlPilotFlightModel::select(int idP)
{
    QString filter("ID_Pilot = ");
    filter += QString::number(idP);
    setFilter(filter);
    return QSqlRelationalTableModel::select();
}

void SqlPilotFlightModel::select(int idF, int role)
{
    QString filter("ID_Flight = ");
    filter += QString::number(idF) + " AND role = " + QString::number(role);
    setFilter(filter);
}

void SqlPilotFlightModel::unSelect()
{
    setFilter("1=1");
    select();
}

QVariantMap SqlPilotFlightModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
