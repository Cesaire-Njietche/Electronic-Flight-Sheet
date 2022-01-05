#ifndef SQLLICENCEMODEL_H
#define SQLLICENCEMODEL_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlTableModel>

class SqlLicenceModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit SqlLicenceModel(QObject *parent = nullptr, QSqlDatabase db = QSqlDatabase());

    enum{
        IDRole = Qt::UserRole + 1,
        TitleRole,
        AutorityRole
    };
    QHash<int, QByteArray> roleNames() const override;
    bool select();
    QVariant data(const QModelIndex &item, int role) const override;
public slots:
    QVariantMap get(int idx) const;
    void selectByID(int id);
    void unSelect();

};

#endif // SQLLICENCEMODEL_H
