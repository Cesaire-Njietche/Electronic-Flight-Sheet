import QtQuick 2.12

FlightSheetForm {

    property int id
    property int r
    property date date1
    property date date2
    property bool filter
    property variant pilotName
    property variant filename: "FlightSheet" + Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"

    function formatTime(){
        var n = FlightModel.rowCount();
        var t = 0
        for(var i = 0; i < n; i++){
            t += FlightModel.get(i).flight_time;
        }
        var h = 0
        var mn = 0
        if(t >= 60){
            mn = t % 60
            h = (t - mn)/60
            return  h + "h" + mn + "mn"
        }
        else
            return t + "mn"
    }

    function formatCurrentTime(t){
        var h = 0
        var mn = 0
        if(t >= 60){
            mn = t % 60
            h = (t - mn)/60
            return  h + "h" + mn + "mn"
        }
        else
            return t + "mn"
    }

    function fillContent(){
        var n = FlightModel.rowCount()
        var currentFlight
        for(var i = 0; i < n; i++){
            currentFlight = FlightModel.get(i)
            FSP.createContent(Qt.formatDate(currentFlight.date, "dd/MM/yyyy"), currentFlight.acft_type,
                              currentFlight.acft_registration, currentFlight.dep_aerodrome, currentFlight.arr_aerodrome,
                              formatCurrentTime(currentFlight.flight_time), currentFlight.ID_Pilot1, currentFlight.ID_Pilot2)
        }
    }

    Connections{
        target: flight_sheet
        Component.onCompleted: {
            start_dateB.dateDialog.x = start_date.x - start_date.width
            start_dateB.dateDialog.y = start_date.x + start_date.height

            end_dateB.dateDialog.x = end_date.x - end_date.width
            end_dateB.dateDialog.y = end_date.y + end_date.height

            FlightModel.setForeignKeys()
            totalFT.text = formatTime()
        }
    }

    start_dateB.onClicked: {
        start_dateB.dateDialog.open()
    }

    end_dateB.onClicked: {
        end_dateB.dateDialog.open()
    }

   /* start_dateB.dateDialog.onGetDate:{
        date1 = date
        date = Qt.formatDate(date, "dd/MM/yyyy")
        start_date.text = date

        FlightModel.setForeignKeys()
        if(filter){
            //FlightModel.selectByRole(r, id)
            FlightModel.selectByDateRoleID(date1, date2, r, id)
            filename = pilotName +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"
            totalFT.text = formatTime()
        }
    }

    end_dateB.dateDialog.onGetDate:{
        date2 = date
        date = Qt.formatDate(date, "dd/MM/yyyy")
        end_date.text = date

        FlightModel.setForeignKeys()
        if(filter){
            //FlightModel.selectByRole(r, id)

            FlightModel.selectByDateRoleID(date1, date2, r, id)
            filename = pilotName +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"
            totalFT.text = formatTime()
        }
    }*/
    Connections {
        target: pilot
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
        ctxt.fillStyle =pilot.pressed ? secondaryDarkColor2 : secondaryColor2
        ctxt.fill()
    }

    pilot.onCurrentIndexChanged: {
        id = pilot.model.get(pilot.currentIndex).ID_Pilot
        //FlightModel.selectByPilotID(id)
        //FlightModel.selectByRole(r, id)
        pilotName = pilot.model.get(pilot.currentIndex).name + " " + pilot.model.get(pilot.currentIndex).surname
        if(filter)
            filename = pilotName +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"
        FlightModel.selectByDateRoleID(date1, date2, r, id)
        totalFT.text = formatTime()
    }

    role.onCurrentIndexChanged: {
        r = role.currentIndex
        //FlightModel.selectByRole(r, id)
        FlightModel.selectByDateRoleID(date1, date2, r, id)
        var n = FlightModel.rowCount();
        if(filter)
            filename = pilotName +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"
        totalFT.text = formatTime()
    }

    control.onToggled: {
        if(control.checked){
            filSearch.enabled = true

            //FlightModel.selectByRole(r, id)
            FlightModel.selectByDateRoleID(date1, date2, r, id)

            totalFT.text = formatTime()
            filter = true
            filename = pilotName +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"
        }
        else{
            filSearch.enabled = false
            FlightModel.setForeignKeys()
            filter = false
            totalFT.text = formatTime()
            filename = "FlightSheet" +   Qt.formatDateTime(new Date(), "dd-MM-yyyy_hh-mm") + ".pdf"

        }
    }
    dwlClick.onClicked: {
        FSP.createFile(filename)

        if(filter){
            var role
            switch(r){
            case 0: role = 'ALL'
                break
            case 1: role = 'Pilot'
                break
            case 2: role = 'Copilot'
            }
            //console.log(pilotName)

            FSP.createHeader(true, pilotName, role, Qt.formatDate(date1, "dd/MM/yyyy"), Qt.formatDate(date2, "dd/MM/yyyy"))
        }
        else
            FSP.createHeader(false, "", "", "", "")
        fillContent()

        FSP.createFooter(formatTime())
    }

}


