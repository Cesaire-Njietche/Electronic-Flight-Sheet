#ifndef SQLAIRCRAFTMODEL_H
#define SQLAIRCRAFTMODEL_H

#include <QObject>
#include <QSqlTableModel>
#include <QSqlRecord>

class SqlAircraftModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit SqlAircraftModel(QObject *parent = 0, QSqlDatabase db = QSqlDatabase());

    enum{
        RegistrationRole = Qt::UserRole + 1,
        TypeRole
    };
    QHash<int, QByteArray> roleNames() const override;
    bool select();
    QVariant data(const QModelIndex &item, int role) const override;
public slots:
    QVariantMap get(int idx) const;
    bool addRecord(QString, QString);
    void selectByReg(QString reg);
};

#endif // SQLAIRCRAFTMODEL_H
