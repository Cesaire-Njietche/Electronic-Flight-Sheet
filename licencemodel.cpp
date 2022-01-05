#include "licencemodel.h"
#include "licencemanager.h"

LicenceModel::LicenceModel(QObject *parent)
    : QAbstractListModel(parent), _lm(nullptr)
{
}

int LicenceModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !_lm)
        return 0;

    return _lm->items().size();
}

QVariant LicenceModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !_lm)
        return QVariant();

    auto item = _lm->items().at(index.row());

    switch (role) {
    case IDRole:
        return QVariant(item.id());
    case DateRole:
        return QVariant(item.date());
    case TitleRole:
        return QVariant(item.title());
    case AuthorityRole:
        return QVariant(item.authority());
    case NumberRole:
        return QVariant(item.number());
    }
    return QVariant();
}

bool LicenceModel::setData(const QModelIndex &index, const QVariant &value, int role)
{

    if(!_lm)
        return false;

    Licence item = _lm->items().at(index.row());
    switch (role) {
    case DateRole:
        item.setDate(value.toString()) ;
        break;
    case TitleRole:
        item.setTitle(value.toString());
        break;
    case AuthorityRole:
        item.setAuthority(value.toString());
        break;
    case NumberRole:
        item.setNumber(value.toString());
        break;
    }
    if (_lm->setItemAt(index.row(), item)) {

        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags LicenceModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> LicenceModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDRole] = "ID_Licence";
    names[DateRole] = "date";
    names[TitleRole] = "title";
    names[AuthorityRole] = "authority";
    names[NumberRole] = "number";
    return  names;
}

LicenceManager *LicenceModel::lm() const
{
    return _lm;
}

void LicenceModel::setLm(LicenceManager *lm)
{
    beginResetModel();

    if(_lm)
        _lm->disconnect(this);
    _lm = lm;

    if(_lm){
        connect(_lm, &LicenceManager::preItemAdded, this, [=](){
            const int index = _lm->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(_lm, &LicenceManager::postItemAdded, this, [=](){
            endInsertRows();
        });
        connect(_lm, &LicenceManager::preItemRemoved, this, [=](int index){
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(_lm, &LicenceManager::postItemRemoved, this, [=](){
            endRemoveRows();
        });
        connect(_lm, &LicenceManager::preClear, this, [=](){
            c = count();
            if(c > 0)
                beginRemoveRows(QModelIndex(), 0, c -1);
        });
        connect(_lm, &LicenceManager::postClear, this, [=](){
            if(c > 0)
                endRemoveRows();
        });
    }

    endResetModel();
}

QVariantMap LicenceModel::getLicence(int idx) const {
  QVariantMap map;
  foreach(int k, roleNames().keys()) {
    map[roleNames().value(k)] = data(index(idx, 0), k);
  }
  return map;
}

int LicenceModel::count() const
{
    return _lm->items().size();
}
