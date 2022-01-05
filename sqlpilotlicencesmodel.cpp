#include "sqlpilotlicencesmodel.h"

SqlPilotLicencesModel::SqlPilotLicencesModel(QObject *parent, QSqlDatabase db): QSqlRelationalTableModel(parent, db)
{

}

QVariant SqlPilotLicencesModel::data(const QModelIndex &item, int role) const
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

Qt::ItemFlags SqlPilotLicencesModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 3)
        flags |= Qt::ItemIsEditable;
    return flags;
}

QHash<int, QByteArray> SqlPilotLicencesModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDPilotROLE] = "ID_Pilot";
    names[IDLicenceRole] = "ID_Licence";
    names[DateRole] = "date";
    names[LicenceNumberRole] = "licence_number";
    return names;
}

bool SqlPilotLicencesModel::addRecord(int idP, int idL, QDate date, QString lnumber)
{
    auto newRecord = record();

    newRecord.setValue("ID_Pilot", idP);
    newRecord.setValue("ID_Licence", idL);
    newRecord.setValue("date", date);
    newRecord.setValue("licence_number", lnumber);

    bool ok = insertRecord(-1, newRecord);
    submitAll();

    return ok;
}

bool SqlPilotLicencesModel::updateRecord(int idP, int idL, QString lnumber)
{
    QString filter("ID_Pilot = ");

    filter += "'" + QString::number(idP) + "'" + "AND ID_Licence = " + "'" + QString::number(idL) + "'";
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue("licence_number", lnumber);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlPilotLicencesModel::select()
{
    //setFilter("");
    return QSqlRelationalTableModel::select();
}

bool SqlPilotLicencesModel::select(int idP)
{
    QString filter("ID_Pilot = ");
    filter += QString::number(idP);
    setFilter(filter);
    return QSqlRelationalTableModel::select();
}

bool SqlPilotLicencesModel::selectWithForeignKeys()
{
    //Join Pilot_Licence and Pilot tables
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

    //Join Pilot_Licence and Licence tables
    setRelation(1, QSqlRelation("Licence", "ID_Licence", "authority"));
    //setRelation(1, QSqlRelation("Licence", "ID_Licence", "title"));

    return select();
}

QVariantMap SqlPilotLicencesModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

bool SqlPilotLicencesModel::updateRecord(int idP, int idL, QDate date)
{
    QString filter("ID_Pilot = ");

    filter += "'" + QString::number(idP) + "'" + "AND ID_Licence = " + "'" + QString::number(idL) + "'";
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue("date", date);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}
