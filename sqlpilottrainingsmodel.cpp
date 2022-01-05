#include "sqlpilottrainingsmodel.h"

SqlPilotTrainingsModel::SqlPilotTrainingsModel(QObject *parent, QSqlDatabase db): QSqlRelationalTableModel(parent, db)
{

}

QVariant SqlPilotTrainingsModel::data(const QModelIndex &item, int role) const
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

Qt::ItemFlags SqlPilotTrainingsModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 2)
        flags |= Qt::ItemIsEditable;
    return flags;
}

QHash<int, QByteArray> SqlPilotTrainingsModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDPilotROLE] = "ID_Pilot";
    names[IDTrainingRole] = "ID_Training";
    names[DateRole] = "date";
    return names;
}

bool SqlPilotTrainingsModel::addRecord(int idP, int idT, QDate date)
{
    auto newRecord = record();

    newRecord.setValue("ID_Pilot", idP);
    newRecord.setValue("ID_Training", idT);
    newRecord.setValue("date", date);

    bool ok = insertRecord(-1, newRecord);
    submitAll();

    return ok;
}

bool SqlPilotTrainingsModel::updateRecord(int idP, int idT, QDate date)
{
    QString filter("ID_Pilot = ");

    filter += "'" + QString::number(idP) + "'" + "AND ID_Training = " + "'" + QString::number(idT) + "'";
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue("date", date);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;

}

bool SqlPilotTrainingsModel::select()
{
    //setFilter("");
    return QSqlRelationalTableModel::select();
}

bool SqlPilotTrainingsModel::select(int idP)
{
    QString filter("ID_Pilot = ");
    filter += QString::number(idP);
    setFilter(filter);
    return QSqlRelationalTableModel::select();
}

bool SqlPilotTrainingsModel::selectWithForeignKeys()
{
    //Join Pilot_Training and Pilot tables
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "name"));
    /*setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "surname"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "telephone"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "email"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "unit"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "speciality"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "date_cempn"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "date_cempn_exp"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "photo"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "grade"));
    setRelation(0, QSqlRelation("Pilot", "ID_Pilot", "birthdate"));*/

    //Join Pilot_Training and Training tables
    setRelation(1, QSqlRelation("Training", "ID_Training", "authority"));
    //setRelation(1, QSqlRelation("Training", "ID_Training", "center"));
    //setRelation(1, QSqlRelation("Training", "ID_Training", "title"));

    return select();
}

QVariantMap SqlPilotTrainingsModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
