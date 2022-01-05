#include "licence.h"

Licence::Licence()
{

}

Licence::Licence(int id)
{
    _id = id;
}

Licence::Licence(int id, QString date, QString title, QString authority, QString number)
{
    _id = id;
    _date = date;
    _title = title;
    _authority = authority;
    _number = number;
}

int Licence::id() const
{
    return _id;
}

void Licence::setId(const int &id)
{
    _id = id;
}

QString Licence::title() const
{
    return _title;
}

void Licence::setTitle(const QString &title)
{
    _title = title;
}

QString Licence::authority() const
{
    return _authority;
}

void Licence::setAuthority(const QString &authority)
{
    _authority = authority;
}

QString Licence::number() const
{
    return _number;
}

void Licence::setNumber(const QString &number)
{
    _number = number;
}

QString Licence::date() const
{
    return _date;
}

void Licence::setDate(const QString &date)
{
    _date = date;
}

