#include "flightsheetprint.h"

FlightSheetPrint::FlightSheetPrint(QObject *parent) : QObject(parent)
{

}

void FlightSheetPrint::createFile(QString filename)
{
    writer  = new QPdfWriter(filename);
    painter  = new QPainter(writer);

    writer->setPageSize(QPageSize(QPageSize::A4));
    writer->setResolution(300);// 3508*2479
    writer->setPageMargins(QMargins(100, 100, 100, 100));
    writer->setTitle("Flight Sheet");
    font.setFamily("Times New Roman");
    //qDebug() << QPageSize::definitionSize(QPageSize::A4).height() << QPageSize::definitionSize(QPageSize::A4).width();
    contentHeight = 13150 - 200;
    contentWidth  = 9300 - 200;
    int fontSize = 70;

    font.setPointSize(fontSize);
    font.setBold(true);
    painter->setFont(font);


}

void FlightSheetPrint::createHeader(bool b, QString pilot, QString role, QString sd, QString ed)
{
    x = 0, y = 0;
    option.setAlignment(Qt::AlignCenter);
    painter->drawText(QRect(x, y, 9000, 200), "FLIGHT SHEET", option);
    QDateTime date = QDateTime::currentDateTime();
    QString dat = date.toString("ddd dd/MM/yyyy");
    option.setAlignment(Qt::AlignLeft);
    auto font = painter->font();
    font.setPointSize(40);
    painter->setFont(font);
    y += 400;
    painter->drawText(QRect(x, y, 700, 200), "Date : ", option);
    x += 700;
    painter->drawText(QRect(x, y, 2000, 200), dat, option);
    if(b){
        y += 400;
        x = 0;
        painter->drawText(QRect(x, y, 700, 200), "Pilot : ", option);
        x += 700;
        painter->drawText(QRect(x, y, 3000, 300), pilot, option);
        y += 400;
        x = 0;
        painter->drawText(QRect(x, y, 700, 200), "Role : ", option);
        x += 700;
        painter->drawText(QRect(x, y, 2000, 300), role, option);
        y += 400;
        x = 0;
        painter->drawText(QRect(x, y, 1200, 200), "Start Date : ", option);
        x += 1200;
        painter->drawText(QRect(x, y, 2000, 200), sd, option);
        x += 2000;
        painter->drawText(QRect(x, y, 1000, 200), "End Date : ", option);
        x += 1000;
        painter->drawText(QRect(x, y, 2000, 200), ed, option);
    }
    x = 0;
    y += 400;
    font.setPointSize(35);
    painter->setFont(font);
    auto pen = painter->pen();
    pen.setColor(Qt::black);
    pen.setStyle(Qt::SolidLine);
    pen.setWidth(4);
    auto rect1 = QRectF(x, y, 1150, 400);
    x += 1150;
    auto rect2 = QRectF(x, y, 1300, 400);
    x += 1300;
    auto rect3 = QRect(x, y, 1250, 400);
    x += 1250;
    auto rect4 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect5 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect6 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect7 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect8 = QRect(x, y, 1150, 400);
    x += 1150;

    option.setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    painter->drawText(rect1, "DATE", option);
    painter->drawText(rect2, "AIRCRAFT TYPE", option);
    painter->drawText(rect3, "REGISTRATION", option);
    painter->drawText(rect4, "DEPARTURE", option);
    painter->drawText(rect5, "ARRIVAL", option);
    painter->drawText(rect6, "FLIGHT TIME", option);
    painter->drawText(rect7, "PILOT", option);
    painter->drawText(rect8, "COPILOT ", option);
    painter->setPen(pen);
    painter->drawRect(rect1);
    painter->drawRect(rect2);
    painter->drawRect(rect3);
    painter->drawRect(rect4);
    painter->drawRect(rect5);
    painter->drawRect(rect6);
    painter->drawRect(rect7);
    painter->drawRect(rect8);

    //painter->end();


}

void FlightSheetPrint::createContent(QString date, QString acft_type, QString reg, QString dep, QString arr, QString flight_time, QString pilot, QString copilot)
{
    x = 0;
    y += 400;
    if(y >= contentHeight - 400)
        writer->newPage();
    auto font = painter->font();
    font.setBold(false);
    font.setPointSize(30);
    painter->setFont(font);
    auto rect1 = QRectF(x, y, 1150, 400);
    x += 1150;
    auto rect2 = QRectF(x, y, 1300, 400);
    x += 1300;
    auto rect3 = QRect(x, y, 1250, 400);
    x += 1250;
    auto rect4 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect5 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect6 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect7 = QRect(x, y, 1150, 400);
    x += 1150;
    auto rect8 = QRect(x, y, 1150, 400);
    x += 1150;

    painter->drawText(rect1, date, option);
    painter->drawText(rect2, acft_type, option);
    painter->drawText(rect3, reg, option);
    painter->drawText(rect4, dep, option);
    painter->drawText(rect5, arr, option);
    painter->drawText(rect6, flight_time, option);
    painter->drawText(rect7, pilot, option);
    painter->drawText(rect8, copilot, option);

    painter->drawRect(rect1);
    painter->drawRect(rect2);
    painter->drawRect(rect3);
    painter->drawRect(rect4);
    painter->drawRect(rect5);
    painter->drawRect(rect6);
    painter->drawRect(rect7);
    painter->drawRect(rect8);

}

void FlightSheetPrint::createFooter(QString ft)
{
    x = 6850;
    y += 400;
    auto rect1 = QRectF(x, y, 2000, 400);
    x += 2000;
    auto rect2 = QRectF(x, y, 700, 400);
    auto font = painter->font();
    font.setBold(true);
    font.setPointSize(50);
    painter->setFont(font);
    painter->drawText(rect1, "Total Flying Time :", option);
    option.setAlignment(Qt::AlignLeft | Qt::AlignVCenter);

    painter->drawText(rect2, ft, option);

    delete painter;
    delete writer;
}
