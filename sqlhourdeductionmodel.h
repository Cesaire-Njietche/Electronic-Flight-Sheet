#ifndef SQLHOURDEDUCTION_H
#define SQLHOURDEDUCTION_H

#include <QObject>
#include <QSqlRecord>
#include <QSqlRelationalTableModel>

class SqlHourDeductionModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    SqlHourDeductionModel(QObject *parent, QSqlDatabase db = QSqlDatabase());

    enum{
        IDPilotRole = Qt::UserRole + 1,
        IFRFTRole,
        VFRFTRole,
        FirstOfFTRole,
        PilotFTRole,
        TotalFTRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
public slots:
    bool addRecord(int idP, int ifr, int vfr, int firstof, int pilot, int total);
    bool updateRecord(int idP, QString columnName, int ft);
    bool select();
    bool select(int idP);
    //bool selectWithForeignKeys();
    QVariantMap get(int idx) const;
};

#endif // SQLHOURDEDUCTION_H
