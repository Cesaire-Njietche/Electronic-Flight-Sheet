#include "sqlhourdeductionmodel.h"

SqlHourDeductionModel::SqlHourDeductionModel(QObject *parent, QSqlDatabase db):QSqlRelationalTableModel(parent, db)
{

}

QVariant SqlHourDeductionModel::data(const QModelIndex &item, int role) const
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

Qt::ItemFlags SqlHourDeductionModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 5)
        flags |= Qt::ItemIsEditable;
    return flags;
}

QHash<int, QByteArray> SqlHourDeductionModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDPilotRole] = "ID_Pilot";
    names[IFRFTRole] = "IFR_FT";
    names[VFRFTRole] = "VFR_FT";
    names[FirstOfFTRole] = "FirstOf_FT";
    names[PilotFTRole] = "PIC_FT";
    names[TotalFTRole] = "total_FT";

    return names;
}

bool SqlHourDeductionModel::addRecord(int idP, int ifr, int vfr, int firstof, int pilot, int total)
{
    auto newRecord = record();

    newRecord.setValue("ID_Pilot", idP);
    newRecord.setValue("IFR_FT", ifr);
    newRecord.setValue("VFR_FT", vfr);
    newRecord.setValue("FirstOf_FT", firstof);
    newRecord.setValue("PIC_FT", pilot);
    newRecord.setValue("total_FT", total);

    bool ok = insertRecord(-1, newRecord);
    submitAll();

    return ok;
}

bool SqlHourDeductionModel::updateRecord(int idP, QString columnName, int ft)
{
    QString filter("ID_Pilot = ");

    filter += QString::number(idP);
    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    int cft = curRecord.value(columnName).toInt();
    curRecord.setValue(columnName, ft + cft);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlHourDeductionModel::select()
{
    return QSqlRelationalTableModel::select();
}

bool SqlHourDeductionModel::select(int idP)
{
    QString filter("ID_Pilot = ");
    filter += QString::number(idP);
    setFilter(filter);
    return QSqlRelationalTableModel::select();
}

QVariantMap SqlHourDeductionModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
