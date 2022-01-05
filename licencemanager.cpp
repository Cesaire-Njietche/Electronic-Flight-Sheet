#include "licencemanager.h"

LicenceManager::LicenceManager(QObject *parent) : QObject(parent)
{
    /*mItems.append(Licence("01/03/2018", "IFR", "Portugal", "B+"));
    mItems.append(Licence("17/07/2020", "VFR", "South Africa", "A-"));
    mItems.append(Licence("24/12/2017", "IFR/VFR", "Lithuania", "B+"));
    mItems.append(Licence("10/06/2016", "Night VFR", "USA", "B+"));
    mItems.append(Licence("10/06/2016", "Night VFR", "USA", "B+"));*/

}

QVector<Licence> LicenceManager::items() const
{
    return mItems;
}


void LicenceManager::setItems(const QVector<Licence> &items)
{
    mItems = items;
}

bool LicenceManager::setItemAt(int index, const Licence &q)
{
    if(index < 0 || index >= mItems.size())
        return false;

    mItems[index] = q;
    return true;

}

void LicenceManager::addItem(int id, QString date, QString name, QString authority, QString number)
{
    emit preItemAdded();

    mItems.append(Licence(id, date, name, authority, number));

    emit postItemAdded();

}

void LicenceManager::removeItemAt(int index)
{
    emit preItemRemoved(index);

    mItems.removeAt(index);

    emit postItemRemoved();
}

void LicenceManager::clear()
{
    emit preClear();
    mItems.clear();
    emit postClear();
}
