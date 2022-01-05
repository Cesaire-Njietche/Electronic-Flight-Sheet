#include "simsessionmanager.h"

SimSessionManager::SimSessionManager(QObject *parent) : QObject(parent)
{

}

QVector<SimSession> SimSessionManager::items() const
{
    return mItems;
}

void SimSessionManager::setItems(const QVector<SimSession> &items)
{
    mItems = items;
}

bool SimSessionManager::setItemAt(int index, const SimSession &ss)
{
    if(index < 0 || index >= mItems.size())
        return false;

    mItems[index] = ss;
    return true;
}

void SimSessionManager::addItem(int id, QString date, QString tCenter, QString acftType, QString simType)
{
    emit preItemAdded();

    mItems.append(SimSession(id, date, tCenter, acftType, simType));

    emit postItemAdded();
}

void SimSessionManager::removeItemAt(int index)
{
    emit preItemRemoved(index);

    mItems.removeAt(index);

    emit postItemRemoved();
}

void SimSessionManager::clear()
{
    emit preClear();
    mItems.clear();
    emit postClear();
}
