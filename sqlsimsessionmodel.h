#ifndef SQLSIMSESSIONMODEL_H
#define SQLSIMSESSIONMODEL_H

#include <QObject>
#include <QSqlTableModel>

class SqlSimSessionModel : public QSqlTableModel
{
    Q_OBJECT
public:
    SqlSimSessionModel(QObject *parent, QSqlDatabase db = QSqlDatabase());
    enum{
        IDRole = Qt::UserRole + 1,
        CenterRole,
        AircraftRole,
        SimTypeRole
    };
    QHash<int, QByteArray> roleNames() const override;
    bool select();
    QVariant data(const QModelIndex &item, int role) const override;
public slots:
    QVariantMap get(int idx) const;
    void selectByID(int id);
    void unSelect();
};

#endif // SQLSIMSESSIONMODEL_H
