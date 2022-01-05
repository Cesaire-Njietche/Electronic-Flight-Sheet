#ifndef PILOTSHEETPRINT_H
#define PILOTSHEETPRINT_H

#include <QObject>
#include <QtPrintSupport>
#include <QPainter>
#include <QPdfWriter>
#include <QPrinter>
#include <QDateTime>
#include <QPixmap>

class PilotSheetPrint : public QObject
{
    Q_OBJECT

    QString filename;
    QPainter *painter;
    QPdfWriter *writer;
    QDateTime date;
    QTextOption option;
    QFont font;
    int contentWidth;
    int contentHeight;
    int x = 0, y = 0;


public:
    explicit PilotSheetPrint(QObject *parent = nullptr);

public slots:
    void createFile(QString filename);
    void createHeader(QString pilot, QString imageUrl);
    void createContent(QString, QString, QString, QString, QString, QString);
    void createContent(QString, QString, QString, QString);
    void createContent(QString, QString, QString, QString, QString);
    void createTableHeader(QString, QString, QString, QString, QString);
    void createTableContent(QString, QString, QString, QString);
    void releaseResources();

};

#endif // PILOTSHEETPRINT_H
