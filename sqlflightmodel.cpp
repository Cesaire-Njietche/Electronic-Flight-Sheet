#include "sqlflightmodel.h"

SqlFlightModel::SqlFlightModel(QObject *parent, QSqlDatabase db): QSqlRelationalTableModel(parent, db)
{

}

QHash<int, QByteArray> SqlFlightModel::roleNames() const
{
    QHash<int, QByteArray>names;

    names[IDRole] = "ID_Flight";
    names[DateRole] = "date";
    names[IDP1Role] = "ID_Pilot1";
    names[IDP2Role] = "ID_Pilot2";
    names[FlightRuleRole] = "flight_rule";
    names[RouteRole] = "route";
    names[MissionRole] = "mission";
    names[AcftRegRole] = "acft_registration";
    names[AcftTypeRole] = "acft_type";
    names[DepTimeRole] = "dep_time";
    names[DepAerodromeRole] = "dep_aerodrome";
    names[ArrAerodromeRole] = "arr_aerodrome";
    names[ArrTimeRole] = "arr_time";
    names[GradeRole] = "grade";
    names[ObservationRole] = "observation";
    names[FlightRegimeRole] = "flight_regime";
    names[FlightTimeRole] = "flight_time";

    return names;
}

QVariant SqlFlightModel::data(const QModelIndex &item, int role) const
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

Qt::ItemFlags SqlFlightModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 16)
        flags |= Qt::ItemIsEditable;
    return flags;
}

int SqlFlightModel::addRecord(QDate date, int idP1, int idP2, QString frule, QString route, QString mission,
                              QString acftReg, QString acftType,QString depTime, QString depAero, QString arrAero,
                              QString arrTime, QString grade, QString obs, QString fregime, int ftime)
{
    bool ok;

    select();
    int curRow = rowCount() == 0 ? 0 : rowCount() - 1 ;
    int lastId = rowCount() > 0 ? record(curRow).value("ID_Flight").toInt() : 0;
    qDebug() << "Last Id " + QString::number(lastId);
    insertRows(curRow, 1);
    setData(index(curRow, 0), lastId + 1);
    setData(index(curRow, 1), idP1);
    setData(index(curRow, 2), idP2);
    setData(index(curRow, 3), date);
    setData(index(curRow, 4), frule);
    setData(index(curRow, 5), route);
    setData(index(curRow, 6), mission);
    setData(index(curRow, 7), acftReg);
    setData(index(curRow, 8), acftType);
    setData(index(curRow, 9), depTime);
    setData(index(curRow, 10), depAero);
    setData(index(curRow, 11), arrAero);
    setData(index(curRow, 12), arrTime);
    setData(index(curRow, 13), grade);
    setData(index(curRow, 14), obs);
    setData(index(curRow, 15), fregime);
    setData(index(curRow, 16), ftime);

    ok = submitAll();
   //insertRecord(-1, newRecord);

    if(ok)
        return lastId + 1;
    else {
        qDebug() << lastError().text();
        return -1;
    }
}

bool SqlFlightModel::select()
{
    return QSqlRelationalTableModel::select();
}

bool SqlFlightModel::selectByPilotID(int id)
{
    QString filter("ID_Pilot1 = ");
    filter += QString::number(id) + " OR ID_Pilot2 = " + QString::number(id);
    setFilter(filter);
    return select();
}

bool SqlFlightModel::selectByRole(int role, int id)
{
    QString filter("ID_Pilot1 = ");
    QString filter2("ID_Pilot2 = ");

    switch (role) {

        case 0: filter += QString::number(id) + " OR ID_Pilot2 = " + QString::number(id);
                setFilter(filter);
                break;
        case 1: filter += QString::number(id);
                setFilter(filter);
                break;
        case 2: filter2 += QString::number(id);
                setFilter(filter2);
                break;
    }


    return select();
}

bool SqlFlightModel::selectByDate(QDate s, QDate e)
{
    QString filter("date >= ");
    filter += "'" + s.toString("yyyy-MM-dd") + "'" + " AND date <= " + "'" + e.toString("yyyy-MM-dd") + "'";
    qDebug() << " --- " + s.toString() + " --- " + e.toString();

    setFilter(filter);

    return select();

}

bool SqlFlightModel::selectByDateRoleID(QDate s, QDate e, int role, int id)
{
    QString filter("ID_Pilot1 = ");
    QString filter2("ID_Pilot2 = ");

    //qDebug() << " --- " + s.toString("yyyy-MM-dd") + " --- " + e.toString("yyyy-MM-dd");
    switch (role) {

        case 0: filter = "(ID_Pilot1 = " + QString::number(id) + " OR ID_Pilot2 = " + QString::number(id) + ")";
                //setFilter(filter);
                break;
        case 1: filter += QString::number(id);
                //setFilter(filter);
                break;
        case 2: filter = "ID_Pilot2 = " + QString::number(id);
                //setFilter(filter2);
                break;
    }

    filter += " AND ( date BETWEEN '"+ s.toString("yyyy-MM-dd") + "'" + " AND " + "'" + e.toString("yyyy-MM-dd") + "')";
    //qDebug() << filter;
    setFilter(filter);

    select();
}

bool SqlFlightModel::updateRecord(int id, QString columnName, QString value)
{
    QString filter = "ID_Flight = " + QString::number(id);

    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue(columnName, value);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlFlightModel::updateRecord(int id, QString columnName, QTime value)
{
    QString filter = "ID_Flight = " + QString::number(id);

    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue(columnName, value);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

void SqlFlightModel::unSelect()
{
    setFilter("1=1");
    setRelation(1, QSqlRelation("Pilot", "ID_Pilot", "ID_Pilot"));
    setRelation(2, QSqlRelation("Pilot", "ID_Pilot", "ID_Pilot"));
    select();
}

void SqlFlightModel::setForeignKeys()
{
    setFilter("1=1");
    setRelation(1, QSqlRelation("Pilot", "ID_Pilot", "name"));
    setRelation(2, QSqlRelation("Pilot", "ID_Pilot", "name"));

    select();
}

QVariantMap SqlFlightModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
        map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

int SqlFlightModel::count()
{
    //select();
    return rowCount();

}
