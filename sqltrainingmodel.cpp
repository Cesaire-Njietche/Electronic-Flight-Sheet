#include "sqltrainingmodel.h"

SqlTrainingModel::SqlTrainingModel(QObject *parent, QSqlDatabase db):
    QSqlTableModel(parent, db)
{

}

QHash<int, QByteArray> SqlTrainingModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDRole] = "ID_Training";
    names[TitleRole] = "title";
    names[CenterRole] = "center";
    names[AutorityRole] = "authority";

    return names;

}

bool SqlTrainingModel::select()
{
    return QSqlTableModel::select();
}

QVariant SqlTrainingModel::data(const QModelIndex &item, int role) const
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

void SqlTrainingModel::selectTitle(QString title)
{
    QString filter("title = ");
    filter += "'" + title + "'";
    setFilter(filter);
    select();
}

void SqlTrainingModel::selectByID(int id)
{
    QString filter("ID_Training = ");
    filter += QString::number(id);
    setFilter(filter);
    select();
}

void SqlTrainingModel::unSelect()
{
    setFilter("1=1");
    select();
}

QVariantMap SqlTrainingModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
