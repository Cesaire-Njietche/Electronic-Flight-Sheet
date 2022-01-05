#include "simsession.h"

SimSession::SimSession()
{

}

SimSession::SimSession(int id, QString date, QString tCenter, QString acftType, QString simType)
{
    _id = id;
    _date = date;
    _tCenter = tCenter;
    _acftType = acftType;
    _simType = simType;
}

QString SimSession::date() const
{
    return _date;
}

void SimSession::setDate(const QString &date)
{
    _date = date;
}

QString SimSession::tCenter() const
{
    return _tCenter;
}

void SimSession::setTCenter(const QString &tCenter)
{
    _tCenter = tCenter;
}

QString SimSession::acftType() const
{
    return _acftType;
}

void SimSession::setAcftType(const QString &acftType)
{
    _acftType = acftType;
}

QString SimSession::simType() const
{
    return _simType;
}

void SimSession::setSimType(const QString &simType)
{
    _simType = simType;
}

int SimSession::id() const
{
    return _id;
}

void SimSession::setId(int id)
{
    _id = id;
}
