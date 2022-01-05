#ifndef SQLTRAININGMODEL_H
#define SQLTRAININGMODEL_H

#include <QObject>
#include <QSqlTableModel>

class SqlTrainingModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit SqlTrainingModel(QObject *parent = 0, QSqlDatabase db = QSqlDatabase());

    enum{
        IDRole = Qt::UserRole + 1,
        AutorityRole,
        CenterRole,
        TitleRole
    };
    QHash<int, QByteArray> roleNames() const override;
    bool select();
    QVariant data(const QModelIndex &item, int role) const override;
public slots:
    void selectTitle(QString);
    void selectByID(int id);
    void unSelect();
    QVariantMap get(int idx) const;
};

#endif // SQLTRAININGMODEL_H
