#include "pilotsheetprint.h"

PilotSheetPrint::PilotSheetPrint(QObject *parent) : QObject(parent)
{

}

void PilotSheetPrint::createFile(QString filename)
{
    writer  = new QPdfWriter(filename);
    painter  = new QPainter(writer);

    writer->setPageSize(QPageSize(QPageSize::A4));
    writer->setResolution(300);// 3508*2479
    writer->setPageMargins(QMargins(100, 100, 100, 100));
    writer->setTitle("Pilot Sheet");
    font.setFamily("Times New Roman");
    contentHeight = 13150 - 200;
    contentWidth  = 9300 - 200;
    int fontSize = 60;

    font.setPointSize(fontSize);
    font.setBold(true);
    painter->setFont(font);
}

void PilotSheetPrint::createHeader(QString pilot, QString imageUrl)
{

    x = 0, y = 0;
    option.setAlignment(Qt::AlignCenter);
    painter->drawText(QRect(x, y, 9000, 200), "PILOT SHEET", option);
    //QDateTime date = QDateTime::currentDateTime();
    //QString dat = date.toString("ddd dd/MM/yyyy");
    //option.setAlignment(Qt::AlignLeft);
    auto font = painter->font();
    font.setPointSize(40);
    painter->setFont(font);
    y += 400;
    painter->drawText(QRect(x, y, 1000, 200), "Pilot Name : ", option);
    x += 1000;
    auto font1 = painter->font();
    font1.setBold(false);
    painter->setFont(font1);
    painter->drawText(QRect(x, y, 1500, 200), pilot, option);
    x += 7500;
    if(!imageUrl.isEmpty() && imageUrl.size() > 0){
        imageUrl = imageUrl.mid(8);
        QPixmap pic(imageUrl);
        painter->drawPixmap(x, y, 700, 700, pic);
        y += 500;
        //qDebug() << "Yessss";
    }

    auto pen = painter->pen();
    pen.setWidth(4);
    painter->setPen(pen);
    x = 0;
    y += 250;
    painter->drawLine(x, y, 9500, y);

}

void PilotSheetPrint::createContent(QString name, QString surname, QString phone, QString email, QString grade, QString bday)
{
    y += 200;
    auto rect1 = QRectF(x, y, 1700, 300);
    painter->drawText(rect1, "General Information", option);
    painter->drawRoundedRect(rect1, 15.0, 15.0);
    y += 400;
    x = 0;
    option.setAlignment(Qt::AlignLeft);
    font.setBold(true);
    font.setPointSize(35);
    painter->setFont(font);

    painter->drawText(QRect(x, y, 1000, 150), "Name :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), name, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Phone :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), phone, option);
    x = 0;
    y += 300;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Surname :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), surname, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Email :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), email, option);
    x = 0;
    y += 300;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Grade :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), grade, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Birthdate :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), bday, option);


}

void PilotSheetPrint::createContent(QString unit, QString spec, QString datec, QString datecexp)
{

    x += 2000;
    int c_x = x;
    y -= 1000;
    auto rect1 = QRectF(x, y, 1700, 300);
    option.setAlignment(Qt::AlignCenter);
    font.setPointSize(40);
    painter->setFont(font);
    painter->drawText(rect1, "Technical Information", option);
    painter->drawRoundedRect(rect1, 15.0, 15.0);

    y += 400;
    x = c_x;
    option.setAlignment(Qt::AlignLeft);
    font.setPointSize(33);
    font.setBold(true);
    painter->setFont(font);

    painter->drawText(QRect(x, y, 1000, 150), "Unit :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), unit, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Speciality :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), spec, option);
    x = c_x;
    y += 300;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "Date CEMPN :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), datec, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1500, 150), "Date CEMPN EXP :", option);
    x += 1500;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), datecexp, option);


}

void PilotSheetPrint::createContent(QString ifr, QString vfr, QString pic, QString copilot, QString total)
{
    x = 0;
    y += 700;

    auto rect1 = QRectF(x, y, 1700, 300);
    option.setAlignment(Qt::AlignCenter);
    font.setPointSize(40);
    painter->setFont(font);
    painter->drawText(rect1, "Flying Time", option);
    painter->drawRoundedRect(rect1, 15.0, 15.0);

    y += 400;
    option.setAlignment(Qt::AlignLeft);
    font.setPointSize(33);
    font.setBold(true);
    painter->setFont(font);

    painter->drawText(QRect(x, y, 1000, 150), "IFR FLIGHT :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), ifr, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), "VFR FLIGHT :", option);
    x += 1000;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), vfr, option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1400, 150), "PILOT POSITION :", option);
    x += 1500;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), pic,  option);
    x += 1000;
    font.setBold(true);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1500, 150), "COPILOT POSITION :", option);
    x += 1500;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1000, 150), copilot, option);
    x = 0;
    y += 300;
    font.setBold(true);
    painter->setFont(font);

    painter->drawText(QRect(x, y, 1650, 150), "TOTAL FLYING TIME :", option);
    x += 1500;
    font.setBold(false);
    painter->setFont(font);
    painter->drawText(QRect(x, y, 1200, 150), total, option);


}

void PilotSheetPrint::createTableHeader(QString name, QString date, QString _nd, QString _rd, QString _th)
{
     x = 0;
     y += 600;

     auto rect = QRectF(x, y, 2300, 300);
     option.setAlignment(Qt::AlignCenter);
     font.setPointSize(40);
     font.setBold(false);
     painter->setFont(font);
     painter->drawText(rect, name, option);
     painter->drawRoundedRect(rect, 15.0, 15.0);

     font.setPointSize(35);
     font.setBold(true);
     painter->setFont(font);
     auto pen = painter->pen();
     pen.setColor(Qt::black);
     pen.setStyle(Qt::SolidLine);
     pen.setWidth(4);

     x = 0;
     y += 400;
     auto rect1 = QRectF(x, y, 2000, 300);
     x += 2000;
     auto rect2 = QRectF(x, y, 2000, 300);
     x += 2000;
     auto rect3 = QRect(x, y, 2000, 300);
     x += 2000;
     auto rect4 = QRect(x, y, 2000, 300);

     option.setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
     painter->drawText(rect1, date, option);
     painter->drawText(rect2, _nd, option);
     painter->drawText(rect3, _rd, option);
     painter->drawText(rect4, _th, option);
     painter->drawRect(rect1);
     painter->drawRect(rect2);
     painter->drawRect(rect3);
     painter->drawRect(rect4);
}

void PilotSheetPrint::createTableContent(QString date, QString _nd, QString _rd, QString _th)
{
    font.setPointSize(35);
    font.setBold(false);
    painter->setFont(font);
    auto pen = painter->pen();
    pen.setColor(Qt::black);
    pen.setStyle(Qt::SolidLine);
    pen.setWidth(4);

    x = 0;
    y += 300;
    auto rect1 = QRectF(x, y, 2000, 300);
    x += 2000;
    auto rect2 = QRectF(x, y, 2000, 300);
    x += 2000;
    auto rect3 = QRect(x, y, 2000, 300);
    x += 2000;
    auto rect4 = QRect(x, y, 2000, 300);

    option.setAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
    painter->drawText(rect1, date, option);
    painter->drawText(rect2, _nd, option);
    painter->drawText(rect3, _rd, option);
    painter->drawText(rect4, _th, option);
    painter->drawRect(rect1);
    painter->drawRect(rect2);
    painter->drawRect(rect3);
    painter->drawRect(rect4);
}

void PilotSheetPrint::releaseResources()
{
    delete painter;
    delete writer;
}
