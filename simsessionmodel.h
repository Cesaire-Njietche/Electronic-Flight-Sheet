#ifndef SIMSESSIONMODEL_H
#define SIMSESSIONMODEL_H

#include <QAbstractListModel>
#include <QHash>

#include "simsessionmanager.h"

class SimSessionModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(SimSessionManager *simSManager READ ssm WRITE setSsm)

public:
    explicit SimSessionModel(QObject *parent = nullptr);

    enum{
        IDRole = Qt::UserRole + 1,
        DateRole,
        TCenterRole,
        AcftTypeRole,
        SimTypeRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

    SimSessionManager *ssm() const;
    void setSsm(SimSessionManager *ssm);

    Q_INVOKABLE int count() const;
    Q_INVOKABLE QVariantMap getSimSession(int idx) const;

private:
    SimSessionManager *_ssm;
    int c;
};

#endif // SIMSESSIONMODEL_H
