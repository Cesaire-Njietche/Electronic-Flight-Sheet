#include "training.h"

Training::Training()
{

}

Training::Training(int id)
{
    _id = id;
}

Training::Training(int id, QString date, QString title, QString center, QString authority)
{
    _id = id;
    _date = date;
    _title = title;
    _center = center;
    _authority = authority;
}

int Training::id() const
{
    return _id;
}

void Training::setId(const int &id)
{
    _id = id;
}

QString Training::date() const
{
    return _date;
}

void Training::setDate(const QString &date)
{
    _date = date;
}

QString Training::title() const
{
    return _title;
}

void Training::setTitle(const QString &title)
{
    _title = title;
}

QString Training::center() const
{
    return _center;
}

void Training::setCenter(const QString &center)
{
    _center = center;
}

QString Training::authority() const
{
    return _authority;
}

void Training::setAuthority(const QString &authority)
{
    _authority = authority;
}
