import QtQuick 2.4

FlightSummaryForm {
    table.onSelectRow: {
        //Flight Info tab
        fiTab.pic.text = table.listviewFS.model.get(selectedRow).ID_Pilot1
        fiTab.firstOff.text = table.listviewFS.model.get(selectedRow).ID_Pilot2
        fiTab.aircraft_id.text = table.listviewFS.model.get(selectedRow).acft_registration
        fiTab.aircraft_type.text = table.listviewFS.model.get(selectedRow).acft_type

        //Flight Detail tab
        fdTab.depart_loc.text = table.listviewFS.model.get(selectedRow).dep_aerodrome
        fdTab.takeoff_time.text = table.listviewFS.model.get(selectedRow).dep_time
        fdTab.arr_loc.text = table.listviewFS.model.get(selectedRow).arr_aerodrome
        fdTab.arr_time.text = table.listviewFS.model.get(selectedRow).arr_time
        fdTab.flightRule.text = table.listviewFS.model.get(selectedRow).flight_rule
        fdTab.flightRegime.text = table.listviewFS.model.get(selectedRow).flight_regime
        fdTab.mission.text = table.listviewFS.model.get(selectedRow).mission
        fdTab.route.text = table.listviewFS.model.get(selectedRow).route

        //Flight Assess tab
        faTab.grade.text = table.listviewFS.model.get(selectedRow).grade
        faTab.observation.text = table.listviewFS.model.get(selectedRow).observation

        //console.log(Qt.formatDate(table.listviewFS.model.get(selectedRow).dep_time, "hh:mm:ss"))
        console.log(table.listviewFS.model.get(selectedRow).dep_time)

    }

    Connections{
        target: flight_summary
        Component.onCompleted: {
            FlightModel.setForeignKeys()
/*
            //Flight Info tab
            fiTab.pic.text = table.listviewFS.model.get(selectedRow).ID_Pilot1
            fiTab.firstOff.text = table.listviewFS.model.get(selectedRow).ID_Pilot2
            fiTab.aircraft_id.text = table.listviewFS.model.get(selectedRow).acft_registration
            fiTab.aircraft_type.text = table.listviewFS.model.get(selectedRow).acft_type

            //Flight Detail tab
            fdTab.depart_loc.text = table.listviewFS.model.get(selectedRow).dep_aerodrome
            fdTab.takeoff_time.text = Qt.formatDate(table.listviewFS.model.get(selectedRow).dep_time, "hh:mm:ss")
            fdTab.arr_loc.text = table.listviewFS.model.get(selectedRow).arr_aerodrome
            fdTab.arr_time.text = Qt.formatDateTime(table.listviewFS.model.get(selectedRow).arr_time, "hh:mm:ss")
            fdTab.flightRule.text = table.listviewFS.model.get(selectedRow).flight_rule
            fdTab.flightRegime.text = table.listviewFS.model.get(selectedRow).flight_regime
            fdTab.mission.text = table.listviewFS.model.get(selectedRow).mission
            fdTab.route.text = table.listviewFS.model.get(selectedRow).route

            //Flight Assess tab
            faTab.grade.text = table.listviewFS.model.get(selectedRow).grade
            faTab.observation.text = table.listviewFS.model.get(selectedRow).observation
*/


            fdTab.edit_F_detail.takeoffTime.timeDialog.x =
                    fdTab.edit_F_detail.takeoff_time.x - fdTab.edit_F_detail.takeoff_time.width
            fdTab.edit_F_detail.takeoffTime.timeDialog.y =
                    fdTab.edit_F_detail.takeoff_time.y + fdTab.edit_F_detail.takeoff_time.height
            //date_cempnB.dateDialog.x = date_cempn.x - date_cempn.width
            //date_cempnB.dateDialog.y = date_cempn.y + date_cempn.height
        }
    }

    fdTab.edit_F_detail.takeoffTime.onClicked:{
        fdTab.edit_F_detail.takeoffTime.timeDialog.open()
        fdTab.edit_F_detail.takeoffTime.timeDialog.x =
                fdTab.edit_F_detail.takeoff_time.x - fdTab.edit_F_detail.takeoff_time.width
        fdTab.edit_F_detail.takeoffTime.timeDialog.y =
                fdTab.edit_F_detail.takeoff_time.y + fdTab.edit_F_detail.takeoff_time.height

    }

    fdTab.edit_F_detail.takeoffTime.setTime.onClicked: {
        var hr = fdTab.edit_F_detail.takeoffTime.timePicker.hoursTumbler.currentIndex + 1
        hr = hr < 10? "0"+hr:hr
        var mn = fdTab.edit_F_detail.takeoffTime.timePicker.minutesTumbler.currentIndex
        mn = mn < 10?"0"+mn:mn
        var ap = fdTab.edit_F_detail.takeoffTime.timePicker.amPmTumbler.currentIndex === 0? "AM":"PM"


        fdTab.edit_F_detail.takeoff_time.text = hr + " : " + mn + " " + ap
        fdTab.edit_F_detail.takeoffTime.timeDialog.close()
    }

    fdTab.edit_F_detail.landingTime.onClicked: {
        fdTab.edit_F_detail.landingTime.timeDialog.open()
        fdTab.edit_F_detail.landingTime.timeDialog.x =
                fdTab.edit_F_detail.landing_time.x - fdTab.edit_F_detail.landing_time.width
        fdTab.edit_F_detail.landingTime.timeDialog.y =
                fdTab.edit_F_detail.landing_time.y + fdTab.edit_F_detail.landing_time.height
    }

    fdTab.edit_F_detail.landingTime.setTime.onClicked: {
        var hr = fdTab.edit_F_detail.landingTime.timePicker.hoursTumbler.currentIndex + 1
        hr = hr < 10? "0"+hr:hr
        var mn = fdTab.edit_F_detail.landingTime.timePicker.minutesTumbler.currentIndex
        mn = mn < 10?"0"+mn:mn
        var ap = fdTab.edit_F_detail.landingTime.timePicker.amPmTumbler.currentIndex === 0? "AM":"PM"


        fdTab.edit_F_detail.landing_time.text = hr + " : " + mn + " " + ap
        fdTab.edit_F_detail.landingTime.timeDialog.close()
    }
}

/*##^##
Designer {
    D{i:0;height:1200;width:1600}
}
##^##*/
