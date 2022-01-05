#include "sqlpilotmodel.h"


SqlPilotModel::SqlPilotModel(QObject *parent, QSqlDatabase db): QSqlTableModel(parent, db)
{
    //setEditStrategy(OnManualSubmit);
}

QHash<int, QByteArray> SqlPilotModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[IDRole] = "ID_Pilot";
    names[NameRole] = "name";
    names[SurnameRole] = "surname";
    names[TelephoneRole] = "telephone";
    names[EmailRole] = "email";
    names[UnitRole] = "unit";
    names[SpecialityRole] = "speciality";
    names[DateCempnRole] = "date_cempn";
    names[DateCempnExpRole] = "date_cempn_exp";
    names[PhotoRole] = "photo";
    names[GradeRole] = "grade";
    names[BirthdateRole] = "birthdate";

    return names;
}

bool SqlPilotModel::select()
{
    return QSqlTableModel::select();
}

QVariant SqlPilotModel::data(const QModelIndex &item, int role = Qt::DisplayRole) const
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

/*bool SqlPilotModel::setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole)
{
    //if (index.column() < 1 || index.column() > 11)
       // return false;

    //QModelIndex primaryKeyIndex = QSqlQueryModel::index(index.row(), 0);
    //int id = data(primaryKeyIndex).toInt();

    //clear();

    int row = index.row();
    int columnIdx = index.column();

    select();

    auto curRecord = record(row);
    qDebug() << "Row(" +QString::number(row) + ") and Column(" + QString::number(columnIdx) +")";

    bool ok;
    switch (columnIdx) {
    case 0: curRecord.setValue(columnIdx, value.toInt());
        ok = setRecord(row, curRecord);
        break;
    case 1: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 2: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 3: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 4: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 5: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 6: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 7: curRecord.setValue(columnIdx, value.toDate());
        ok = setRecord(row, curRecord);
        break;
    case 8: curRecord.setValue(columnIdx, value.toDate());
        ok = setRecord(row, curRecord);
        break;
    case 9: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 10: curRecord.setValue(columnIdx, value.toString());
        ok = setRecord(row, curRecord);
        break;
    case 11: curRecord.setValue(columnIdx, value.toDate());
        ok = setRecord(row, curRecord);
        break;
    default: ok = false;
    }
    //refresh();

    //qDebug() << lastError().text();
    ok = submitAll();

    //qDebug() << lastError().text();
    //emit dataChanged(index, index);
    return ok;
}
*/
Qt::ItemFlags SqlPilotModel::flags(const QModelIndex &index) const
{
    Qt::ItemFlags flags = QSqlQueryModel::flags(index);
    if (index.column() >= 0 && index.column() <= 11)
        flags |= Qt::ItemIsEditable;
    return flags;
}

int SqlPilotModel::addRecord(QString name, QString sur, QString tel, QString email, QString unit, QString spec, QDate datec,
                              QDate datecexp, QString pic, QString grade, QDate bday)
{
    /*QSqlRecord newRecord = record();


    newRecord.remove(0);

    newRecord.setValue("name", name);
    newRecord.setValue("surname", sur);
    newRecord.setValue("telephone", tel);
    newRecord.setValue("email", email);
    newRecord.setValue("unit", unit);
    newRecord.setValue("speciality", spec);
    newRecord.setValue("date_cempn", datec);
    newRecord.setValue("date_cempn_exp", datecexp);
    newRecord.setValue("photo", pic);
    newRecord.setValue("grade", grade);
    newRecord.setValue("birthdate", bday);

    qDebug() << newRecord.indexOf("photo");*/
   bool ok;

   select();
   int curRow = rowCount() == 0 ? 0 : rowCount() - 1 ;
   int lastId = rowCount() > 0 ? record(curRow).value("ID_Pilot").toInt() : 0;
   //qDebug() << "Last Id " + QString::number(lastId);
   insertRows(curRow, 1);
   setData(index(curRow, 0), lastId + 1);
   setData(index(curRow, 1), name);
   setData(index(curRow, 2), sur);
   setData(index(curRow, 3), tel);
   setData(index(curRow, 4), email);
   setData(index(curRow, 5), unit);
   setData(index(curRow, 6), spec);
   setData(index(curRow, 7), datec);
   setData(index(curRow, 8), datecexp);
   setData(index(curRow, 9), pic);
   setData(index(curRow, 10), grade);
   setData(index(curRow, 11), bday);

   ok = submitAll();
  //insertRecord(-1, newRecord);

   if(ok)
       return lastId + 1;
   else {
       return -1;
   }

}

bool SqlPilotModel::updateRecord(int id, QString columnName, QString value)
{
    QString filter = "ID_Pilot = " + QString::number(id);

    setFilter(filter);
    select();

    auto curRecord = record(0);
    bool ok;

    curRecord.setValue(columnName, value);
    ok = setRecord(0, curRecord);

    submitAll();

    return ok;
}

bool SqlPilotModel::updateRecord(int id, QString columnName, QDate value)
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

QVariantMap SqlPilotModel::get(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
        map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
