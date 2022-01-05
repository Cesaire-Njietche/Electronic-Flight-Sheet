#include "trainingmanager.h"

TrainingManager::TrainingManager(QObject *parent) : QObject(parent)
{

}

bool TrainingManager::setItemAt(int index, const Training &t)
{
    if(index < 0 || index >= mItems.size())
        return false;

    mItems[index] = t;
    return true;
}

QVector<Training> TrainingManager::items() const
{
    return mItems;
}

void TrainingManager::setItems(const QVector<Training> &items)
{
    mItems = items;
}

void TrainingManager::addItem(int id, QString date, QString name, QString venue, QString score)
{
    emit preItemAdded();

    mItems.append(Training(id, date, name, venue, score));

    emit postItemAdded();
}

void TrainingManager::removeItemAt(int index)
{
    emit preItemRemoved(index);

    mItems.removeAt(index);

    emit postItemRemoved();
}

void TrainingManager::clear()
{
    emit preClear();
    mItems.clear();
    emit postClear();
}
