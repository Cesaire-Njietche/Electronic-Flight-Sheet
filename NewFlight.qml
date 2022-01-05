import QtQuick 2.12

NewFlightForm{

    property color buttonPressedColor: "#b5edf9"
    property color secondaryDarkColor: "#21a3b3"
    property color secondaryColor: "#e1f8fd"
    property int hrA: -1
    property int mnA: -1
    property string nA
    property int hrB: -1
    property int mnB: -1
    property string nB
    property date fDate

    onPageOnCompletedChanged: {
        //filling_time.text = Qt.formatTime(new Date(),"HH:mm")
    }

    takeoffTime.onClicked: {
        takeoffTime.timeDialog.visible = true
        takeoffTime.timeDialog.open()
    }
    takeoffTime.setTime.onClicked: {
        var hr = takeoffTime.timePicker.hoursTumbler.currentIndex + 1
        hrA = hr
        hr = hr < 10? "0"+hr:hr
        var mn = takeoffTime.timePicker.minutesTumbler.currentIndex
        mnA = mn
        mn = mn < 10?"0"+mn:mn
        var ap = takeoffTime.timePicker.amPmTumbler.currentIndex === 0? "AM":"PM"
        nA = ap

        takeoff_time.text = hr + ":" + mn + ":00" + " " + ap
        takeoffTime.timeDialog.close()
    }
    takeoffTime.cancelTime.onClicked: {
        takeoffTime.timeDialog.close()
    }

    landingTime.onClicked: {
        landingTime.timeDialog.open()
    }
    landingTime.setTime.onClicked:{
        var hr = landingTime.timePicker.hoursTumbler.currentIndex + 1
        hrB = hr
        hr = hr < 10? "0"+hr:hr
        var mn = landingTime.timePicker.minutesTumbler.currentIndex
        mnB = mn
        mn = mn < 10?"0"+mn:mn
        var ap = landingTime.timePicker.amPmTumbler.currentIndex === 0? "AM":"PM"
        nB = ap


        landing_time.text = hr + ":" + mn + ":00" + " " + ap
        landingTime.timeDialog.close()
    }
    landingTime.cancelTime.onClicked: {
        landingTime.timeDialog.close()
    }

    /*fTime.onClicked: {
        fTime.timeDialog.visible = true
        fTime.timeDialog.open()
    }

    fTime.setTime.onClicked: {
        var hr = fTime.timePicker.hoursTumbler.currentIndex + 1
        hr = hr < 10? "0"+hr:hr
        var mn = fTime.timePicker.minutesTumbler.currentIndex
        mn = mn < 10?"0"+mn:mn
        //var ap = fTimePicker.amPmTumbler.currentIndex == 0? "AM":"PM"

        flight_time.text = hr + " : " + mn
        fTime.timeDialog.close()
    }


    fTime.cancelTime.onClicked: {
        fTime.timeDialog.close()
    }*/

    filling_dateB.onClicked: {
        filling_dateB.dateDialog.open()
    }

    /*filling_dateB.dateDialog.onGetDate: {
        filling_date.text = Qt.formatDate(date, "dd/MM/yyyy")
        fDate = date
    }*/

    save.onClicked:  {
        //bckg.color = secondaryColor
        var h, m

        if(nB == nA)
        {
            if (hrA == 12)
                hrA = 0
            h = hrB - hrA
            m = mnB - mnA
            if(h > 0){
                m += h * 60
            }
        }
        else{
            hrB += 12
            h = hrB - hrA
            m = mnB - mnA
            m += h * 60
        }

        //console.log(landing_time.text)
        var dt = new Date()
        //console.log(dt.toLocaleTimeString())

        var DepTime = Date.fromLocaleTimeString(Qt.locale(), takeoff_time.text, Locale.ShortFormat)
        var ArrTime = Date.fromLocaleTimeString(Qt.locale(), landing_time.text, "hh:mm:ss AP")
        //console.log(ArrTime.toLocaleTimeString())


        var date = new Date()
        var idPIC = pic.model.get(pic.currentIndex).ID_Pilot
        var idFoff = firstOff.model.get(firstOff.currentIndex).ID_Pilot
        var idF = FlightModel.addRecord(fDate, idPIC, idFoff, flightRule.currentText, route.text, mission.currentText,
                                        aircraft_id.currentText, aircraft_type.text, takeoff_time.text, depart_loc.text, arrival_loc.text,
                                        landing_time.text, grade.currentText, observation.text, flightRegime.currentText, m)


        if(idF > 0){
            HourDeductionModel.updateRecord(idPIC, "PIC_FT", m)
            HourDeductionModel.updateRecord(idFoff, "FirstOf_FT", m)
            HourDeductionModel.updateRecord(idPIC, "total_FT", m)
            HourDeductionModel.updateRecord(idFoff, "total_FT", m)

            if(flightRule.currentText == "VFR"){
                HourDeductionModel.updateRecord(idPIC, "VFR_FT", m)
                HourDeductionModel.updateRecord(idFoff, "VFR_FT", m)
            }
            else{
                HourDeductionModel.updateRecord(idPIC, "IFR_FT", m)
                HourDeductionModel.updateRecord(idFoff, "IFR_FT", m)
            }

            PilotFlightModel.addRecord(idPIC, idF, 0)
            PilotFlightModel.addRecord(idFoff, idF, 1)

            another.open()
        }



        //console.log("Flight ID " +idF)
        /*console.log(DepTime)
        console.log(date, idPIC, idFoff, flightRule.currentText, route.text, mission.currentText,
                    aircraft_id.currentText, aircraft_type.text, DepTime, depart_loc.text, arrival_loc.text,
                    ArrTime, grade.currentText, observation.text, flightRegime.currentText, m)*/

    }

    save.onPressed: {
        bckg_save.color = buttonPressedColor
    }
    save.onReleased: {
        bckg_save.color = secondaryColor
    }

    reset.onPressed: {
        bckg_reset.color = buttonPressedColor
    }
    reset.onReleased: {
        bckg_reset.color = secondaryColor
    }
    cancel.onPressed: {
        bckg_cancel.color = buttonPressedColor
    }
    cancel.onReleased: {
        bckg_cancel.color = secondaryColor
    }
    Connections{
        target: page
        Component.onCompleted:{
            //filling_time.text = Qt.formatTime(new Date(),"HH:mm AP")
            //filling_date.text = Qt.formatDate(new Date(), "dd/MM/yyyy")
            takeoffTime.timeDialog.x = takeoff_time.x - takeoff_time.width
            takeoffTime.timeDialog.y = takeoff_time.y + takeoff_time.height
            landingTime.timeDialog.x = landing_time.x - landing_time.width
            landingTime.timeDialog.y = landing_time.y + landing_time.height
            aircraft_type.text = aircraft_id.model.get(
                                aircraft_id.currentIndex).Type
            another.x = page.x + 5*page.width/12
            another.y = page.y + 5*page.height/12

            fDate = new Date()
            PilotModel.select()
        }
    }

    aircraft_id.onCurrentIndexChanged: {
        aircraft_type.text = aircraft_id.model.get(
                            aircraft_id.currentIndex).Type
    }
    Connections {
        target: aircraft_id
        function onPressedChanged() {
                canvas.requestPaint()
        }
    }

    canvas.onPaint: {
        var ctxt = canvas.getContext("2d")
        ctxt.reset()
        ctxt.moveTo(0, 0)
        ctxt.lineTo(canvas.width, 0)
        ctxt.lineTo(canvas.width / 2, canvas.height)
        ctxt.closePath()
        ctxt.fillStyle = aircraft_id.pressed ? secondaryDarkColor2 : secondaryColor2
        ctxt.fill()
    }
    Connections {
        target: pic
        function onPressedChanged() {
                canvasPic.requestPaint()
        }
    }

    canvasPic.onPaint: {
        var ctxt = canvasPic.getContext("2d")
        ctxt.reset()
        ctxt.moveTo(0, 0)
        ctxt.lineTo(canvasPic.width, 0)
        ctxt.lineTo(canvasPic.width / 2, canvasPic.height)
        ctxt.closePath()
        ctxt.fillStyle = canvasPic.pressed ? secondaryDarkColor2 : secondaryColor2
        ctxt.fill()
    }
    Connections {
        target: firstOff
        function onPressedChanged() {
                canvasfoff.requestPaint()
        }
    }

    canvasfoff.onPaint: {
        var ctxt = canvasfoff.getContext("2d")
        ctxt.reset()
        ctxt.moveTo(0, 0)
        ctxt.lineTo(canvasfoff.width, 0)
        ctxt.lineTo(canvasfoff.width / 2, canvasfoff.height)
        ctxt.closePath()
        ctxt.fillStyle = canvasfoff.pressed ? secondaryDarkColor2 : secondaryColor2
        ctxt.fill()
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:1200;width:1600}
}
##^##*/
