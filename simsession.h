#ifndef SIMSESSION_H
#define SIMSESSION_H

#include <QString>
class SimSession
{
public:
    SimSession();
    SimSession(int id, QString date, QString tCenter, QString acftType, QString simType);

    QString date() const;
    void setDate(const QString &date);

    QString tCenter() const;
    void setTCenter(const QString &tCenter);

    QString acftType() const;
    void setAcftType(const QString &acftType);

    QString simType() const;
    void setSimType(const QString &simType);

    int id() const;
    void setId(int id);

private:
    int _id;
    QString _date;
    QString _tCenter;
    QString _acftType;
    QString _simType;
};

#endif // SIMSESSION_H
