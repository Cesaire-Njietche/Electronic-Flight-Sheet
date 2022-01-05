#ifndef SIMSESSIONMANAGER_H
#define SIMSESSIONMANAGER_H

#include <QObject>
#include <QVector>

#include "simsession.h"

class SimSessionManager : public QObject
{
    Q_OBJECT
public:
    explicit SimSessionManager(QObject *parent = nullptr);

    QVector<SimSession> items() const;
    void setItems(const QVector<SimSession> &items);
    bool setItemAt(int index, const SimSession &ss);

private:
    QVector<SimSession> mItems;

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

#endif // SIMSESSIONMANAGER_H
