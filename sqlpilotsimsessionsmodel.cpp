#include "sqlpilotsimsessionsmodel.h"

SqlPilotSimSessionsModel::SqlPilotSimSessionsModel(QObject *parent, QSqlDatabase db): QSqlRelationalTableModel(parent, db)
{

}

QVariant SqlPilotSimSessionsModel::data(const QModelIndex &item, int role) const
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

Qt::ItemFlags SqlPilotSimSessionsModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 2)
        flags |= Qt::ItemIsEditable;
    return flags;
}

QHash<int, QByteArray> SqlPilotSimSessionsModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDPilotROLE] = "ID_Pilot";
    names[IDSimSessionRole] = "ID_Sim_Info";
    names[DateRole] = "date";
    return names;
}

bool SqlPilotSimSessionsModel::addRecord(int idP, int idSS, QDate date)
{
    auto newRecord = record();

    newRecord.setValue("ID_Pilot", idP);
    newRecord.setValue("ID_SIm_Info", idSS);
    newRecord.setValue("date", date);

    bool ok = insertRecord(-1, newRecord);
    submitAll();

    return ok;
}

bool SqlPilotSimSessionsModel::updateRecord(int idP, int idSS, QDate date)
{
    QString filter("ID_Pilot = ");

    filter += "'" + QString::number(idP) + "'" + "AND ID_Sim_Info = " + "'" + QString::number(idSS) + "'";
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue("date", date);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlPilotSimSessionsModel::select()
{
    //setFilter("");
    return QSqlRelationalTableModel::select();
}

bool SqlPilotSimSessionsModel::select(int idP)
{
    QString filter("ID_Pilot = ");
    filter += QString::number(idP);
    setFilter(filter);
    return QSqlRelationalTableModel::select();
}

bool SqlPilotSimSessionsModel::selectWithForeignKeys()
{
    //Join Pilot_SimSession and Pilot tables
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

    //Join Pilot_SimSession and Sim_Session tables
    setRelation(1, QSqlRelation("Sim_Session", "ID_Sim_Info", "sim_type"));
    //setRelation(1, QSqlRelation("Training", "ID_Training", "center"));
    //setRelation(1, QSqlRelation("Training", "ID_Training", "title"));

    return select();
}

QVariantMap SqlPilotSimSessionsModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
