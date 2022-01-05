#ifndef LICENCE_H
#define LICENCE_H
#include <QString>

class Licence
{
public:
    Licence();
    Licence(int id);
    Licence(int id, QString date, QString title, QString authority, QString number);

    int id() const;
    void setId(const int &id);

    QString title() const;
    void setTitle(const QString &title);

    QString authority() const;
    void setAuthority(const QString &authority);

    QString number() const;
    void setNumber(const QString &number);

    QString date() const;
    void setDate(const QString &date);


private:
    int _id;
    QString _date;
    QString _title;
    QString _authority;
    QString _number;


};

#endif // Licence_H
