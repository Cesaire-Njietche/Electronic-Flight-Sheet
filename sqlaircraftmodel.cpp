#include "sqlaircraftmodel.h"

SqlAircraftModel::SqlAircraftModel(QObject *parent, QSqlDatabase db): QSqlTableModel(parent, db)
{

}

QHash<int, QByteArray> SqlAircraftModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[RegistrationRole] = "Registration";
    names[TypeRole] = "Type";

    return names;
}

bool SqlAircraftModel::select()
{
    return QSqlTableModel::select();
}

QVariant SqlAircraftModel::data(const QModelIndex &item, int role) const
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

QVariantMap SqlAircraftModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

bool SqlAircraftModel::addRecord(QString reg, QString type)
{
    QSqlRecord newRecord = record();

    newRecord.setValue("Registration", reg);
    newRecord.setValue("Type", type);

    return insertRecord(-1, newRecord);
}

void SqlAircraftModel::selectByReg(QString reg)
{
    QString filter("Registration = ");
    filter += "'" + reg + "'";

    setFilter(filter);
    select();
}
