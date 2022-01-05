#ifndef TRAININGMODEL_H
#define TRAININGMODEL_H

#include <QAbstractListModel>
#include <QDate>
#include "trainingmanager.h"

class TrainingModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(TrainingManager *trainingManager READ tm WRITE setTm)

public:
    explicit TrainingModel(QObject *parent = nullptr);

    enum{
        IDRole = Qt::UserRole + 1,
        DateRole,
        TitleRole,
        CenterRole,
        AuthorityRole
    };
    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;


    TrainingManager *tm() const;
    void setTm(TrainingManager *tm);
    Q_INVOKABLE int count() const;
    Q_INVOKABLE QVariantMap getTraining(int idx) const;

private:
    TrainingManager *_tm;
    int c;
};

#endif // TRAININGMODEL_H
