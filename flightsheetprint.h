#ifndef FLIGHTSHEETPRINT_H
#define FLIGHTSHEETPRINT_H

#include <QObject>
#include <QtPrintSupport>
#include <QPainter>
#include <QPdfWriter>
#include <QPrinter>
#include <QDateTime>


class FlightSheetPrint : public QObject
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
    explicit FlightSheetPrint(QObject *parent = nullptr);

public slots:
    void createFile(QString filename);
    void createHeader(bool, QString pilot, QString role, QString sd, QString ed);
    void createContent(QString date, QString acft_type, QString reg, QString dep,
                       QString arr, QString flight_time, QString pilot, QString copilot);
    void createFooter(QString ft);

};

#endif // FLIGHTSHEETPRINT_H
