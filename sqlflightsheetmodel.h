#ifndef FLIGHTSHEETMODEL_H
#define FLIGHTSHEETMODEL_H

#include <QObject>
#include <QTime>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>
#include <QSqlRelationalTableModel>

class SqlFlightSheetModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    SqlFlightSheetModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());
};

#endif // FLIGHTSHEETMODEL_H
