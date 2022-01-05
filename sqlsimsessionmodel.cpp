#include "sqlsimsessionmodel.h"

SqlSimSessionModel::SqlSimSessionModel(QObject *parent, QSqlDatabase db): QSqlTableModel(parent, db)
{

}

QHash<int, QByteArray> SqlSimSessionModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDRole] = "ID_Sim_Info";
    names[CenterRole] = "center";
    names[AircraftRole] = "aircraft";
    names[SimTypeRole] = "sim_type";

    return names;
}

bool SqlSimSessionModel::select()
{
    return QSqlTableModel::select();
}

QVariant SqlSimSessionModel::data(const QModelIndex &item, int role) const
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

QVariantMap SqlSimSessionModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

void SqlSimSessionModel::selectByID(int id)
{
    QString filter("ID_Sim_Info = ");
    filter += QString::number(id);
    setFilter(filter);
    select();
}

void SqlSimSessionModel::unSelect()
{
    setFilter("1=1");
    select();
}


