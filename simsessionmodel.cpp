#include "simsessionmodel.h"

SimSessionModel::SimSessionModel(QObject *parent)
    : QAbstractListModel(parent), _ssm(nullptr)
{
}

int SimSessionModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !_ssm)
        return 0;

    return _ssm->items().size();
}

QVariant SimSessionModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !_ssm)
        return QVariant();

    auto item = _ssm->items().at(index.row());

    switch (role) {
    case IDRole:
        return QVariant(item.id());
    case DateRole:
        return QVariant(item.date());
    case TCenterRole:
        return QVariant(item.tCenter());
    case AcftTypeRole:
        return QVariant(item.acftType());
    case SimTypeRole:
        return QVariant(item.simType());
    }
    return QVariant();
}

bool SimSessionModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!_ssm)
        return false;

    SimSession item = _ssm->items().at(index.row());
    switch (role) {
    case DateRole:
        item.setDate(value.toString()) ;
        break;
    case TCenterRole:
        item.setTCenter(value.toString());
        break;
    case AcftTypeRole:
        item.setAcftType(value.toString());
        break;
    case SimTypeRole :
        item.setSimType(value.toString());
    }
    if (_ssm->setItemAt(index.row(), item)) {

        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags SimSessionModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> SimSessionModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[IDRole] = "ID_Sim_Info";
    names[DateRole] = "date";
    names[TCenterRole] = "tCenter";
    names[AcftTypeRole] = "acftType";
    names[SimTypeRole] = "simType";

    return names;
}

SimSessionManager *SimSessionModel::ssm() const
{
    return _ssm;
}

void SimSessionModel::setSsm(SimSessionManager *ssm)
{
    beginResetModel();

    if(_ssm)
        _ssm->disconnect(this);
    _ssm = ssm;

    if(_ssm){
        connect(_ssm, &SimSessionManager::preItemAdded, this, [=](){
            const int index = _ssm->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(_ssm, &SimSessionManager::postItemAdded, this, [=](){
            endInsertRows();
        });
        connect(_ssm, &SimSessionManager::preItemRemoved, this, [=](int index){
            beginRemoveRows(QModelIndex(), index, index);
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(_ssm, &SimSessionManager::postItemRemoved, this, [=](){
            endRemoveRows();
        });
        connect(_ssm, &SimSessionManager::preClear, this, [=](){
            c = count();
            if(c > 0)
                beginRemoveRows(QModelIndex(), 0, c -1);
        });
        connect(_ssm, &SimSessionManager::postClear, this, [=](){
            if(c > 0)
                endRemoveRows();
        });
    }

    endResetModel();
}


int SimSessionModel::count() const
{
    return _ssm->items().size();
}

QVariantMap SimSessionModel::getSimSession(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
