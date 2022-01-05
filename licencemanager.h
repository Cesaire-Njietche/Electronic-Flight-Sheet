#ifndef LICENCEMANAGER_H
#define LICENCEMANAGER_H

#include <QObject>
#include <QVector>
#include "licence.h"

class LicenceManager : public QObject
{
    Q_OBJECT
public:
    explicit LicenceManager(QObject *parent = nullptr);

    void setItems(const QVector<Licence> &items);
    bool setItemAt(int index, const Licence &l);
    QVector<Licence> items() const;

private:
    QVector<Licence> mItems;

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

#endif // LICENCEMANAGER_H
