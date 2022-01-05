#include "sqllicencemodel.h"

SqlLicenceModel::SqlLicenceModel(QObject *parent, QSqlDatabase db) : QSqlTableModel(parent, db)
{

}

QHash<int, QByteArray> SqlLicenceModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDRole] = "ID_Licence";
    names[TitleRole] = "title";
    names[AutorityRole] = "authority";

    return names;
}

bool SqlLicenceModel::select()
{
    return QSqlTableModel::select();
}

QVariant SqlLicenceModel::data(const QModelIndex &item, int role) const
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

QVariantMap SqlLicenceModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

void SqlLicenceModel::selectByID(int id)
{
    QString filter("ID_Licence = ");
    filter += QString::number(id);
    setFilter(filter);
    select();
}

void SqlLicenceModel::unSelect()
{
    setFilter("1=1");
    select();
}
