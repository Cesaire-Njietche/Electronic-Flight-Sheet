#ifndef TRAININGMANAGER_H
#define TRAININGMANAGER_H

#include <QObject>
#include "training.h"

class TrainingManager : public QObject
{
    Q_OBJECT
public:
    explicit TrainingManager(QObject *parent = nullptr);

    bool setItemAt(int index, const Training &t);

    QVector<Training> items() const;
    void setItems(const QVector<Training> &items);

private:
    QVector<Training> mItems;

public slots:
    void addItem(int, QString, QString, QString, QString);
    void removeItemAt(int);
    void clear();

signals:
    void preItemAdded();
    void postItemAdded();
    void preItemRemoved(int index);
    void postItemRemoved();
    void preClear();
    void postClear();

};

#endif // TRAININGMANAGER_H
