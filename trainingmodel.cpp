#include "trainingmodel.h"

TrainingModel::TrainingModel(QObject *parent)
    : QAbstractListModel(parent), _tm(nullptr)
{
}

int TrainingModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !_tm)
        return 0;

    return _tm->items().size();
}

QVariant TrainingModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !_tm)
        return QVariant();

    auto item = _tm->items().at(index.row());

    switch (role) {
    case IDRole:
        return QVariant(item.id());
    case DateRole:
        return QVariant(item.date());
    case TitleRole:
        return QVariant(item.title());
    case CenterRole:
        return QVariant(item.center());
    case AuthorityRole:
        return QVariant(item.authority());
    }
    return QVariant();
}

bool TrainingModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!_tm)
        return false;

    Training item = _tm->items().at(index.row());
    switch (role) {

    case DateRole:
        item.setDate(value.toString()) ;
        break;
    case TitleRole:
        item.setTitle(value.toString());
        break;
    case CenterRole:
        item.setCenter(value.toString());
        break;
    case AuthorityRole:
        item.setAuthority(value.toString());
        break;
    }
    if (_tm->setItemAt(index.row(), item)) {

        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags TrainingModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> TrainingModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[IDRole] = "ID_Training";
    names[DateRole] = "date";
    names[TitleRole] = "title";
    names[CenterRole] = "center";
    names[AuthorityRole] = "authority";

    return  names;
}

TrainingManager *TrainingModel::tm() const
{
    return _tm;
}

void TrainingModel::setTm(TrainingManager *tm)
{
    beginResetModel();

    if(_tm)
        _tm->disconnect(this);
    _tm = tm;

    if(_tm){
        connect(_tm, &TrainingManager::preItemAdded, this, [=](){
            const int index = _tm->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(_tm, &TrainingManager::postItemAdded, this, [=](){
            endInsertRows();
        });
        connect(_tm, &TrainingManager::preItemRemoved, this, [=](int index){
            beginRemoveRows(QModelIndex(), index, index);
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(_tm, &TrainingManager::postItemRemoved, this, [=](){
            endRemoveRows();
        });
        connect(_tm, &TrainingManager::preClear, this, [=](){
            c = count();
            if(c > 0)
                beginRemoveRows(QModelIndex(), 0, c -1);
        });
        connect(_tm, &TrainingManager::postClear, this, [=](){
            if(c > 0)
                endRemoveRows();
        });
    }

    endResetModel();
}

int TrainingModel::count() const
{
    return _tm->items().size();
}

QVariantMap TrainingModel::getTraining(int idx) const
{
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
      map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}
