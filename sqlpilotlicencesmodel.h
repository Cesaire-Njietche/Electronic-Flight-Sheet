#ifndef SQLPILOTLICENCESMODEL_H
#define SQLPILOTLICENCESMODEL_H

#include <QObject>
#include <QSqlRecord>
#include <QSqlError>
#include <QDate>
#include <QDebug>
#include <QSqlRelation>

class SqlPilotLicencesModel : public QSqlRelationalTableModel
{
    Q_OBJECT
public:
    explicit SqlPilotLicencesModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());

    enum{
        IDPilotROLE = Qt::UserRole + 1,
        IDLicenceRole,
        DateRole,
        LicenceNumberRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
public slots:
    bool addRecord(int idP, int idL, QDate date, QString lnumber);
    bool updateRecord(int idP, int idL, QDate date);
    bool updateRecord(int idP, int idL, QString lnumber);
    bool select();
    bool select(int idP);
    bool selectWithForeignKeys();
    QVariantMap get(int idx) const;
};

#endif // SQLPILOTLICENCESMODEL_H
