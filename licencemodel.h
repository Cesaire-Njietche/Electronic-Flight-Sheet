#ifndef LICENCEMODEL_H
#define LICENCEMODEL_H

#include <QAbstractListModel>

#include "licencemanager.h"

class LicenceModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(LicenceManager *licenceManager READ lm WRITE setLm)

public:
    explicit LicenceModel(QObject *parent = nullptr);

    enum{
        IDRole = Qt::UserRole + 1,
        DateRole,
        TitleRole,
        AuthorityRole,
        NumberRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;


    LicenceManager *lm() const;
    void setLm(LicenceManager *lm);

    Q_INVOKABLE QVariantMap getLicence(int idx) const;
    Q_INVOKABLE int count() const;
private:
    LicenceManager *_lm;
    int c;

};

#endif // LicenceMODEL_H
