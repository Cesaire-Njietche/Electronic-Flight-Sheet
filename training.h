#ifndef TRAINING_H
#define TRAINING_H

#include <QString>

class Training
{
public:
    Training();
    Training(int id);
    Training(int id, QString date, QString title, QString center, QString authority);

    int id() const;
    void setId(const int &id);

    QString date() const;
    void setDate(const QString &date);

    QString title() const;
    void setTitle(const QString &title);

    QString center() const;
    void setCenter(const QString &center);

    QString authority() const;
    void setAuthority(const QString &scr);

private:
    int _id;
    QString _date;
    QString _title;
    QString _center;
    QString _authority;
};

#endif // TRAINING_H
