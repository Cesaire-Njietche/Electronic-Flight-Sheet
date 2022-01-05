import QtQuick 2.4

PilotSheetForm {

    property int currentPilotId: 0
    property variant pilotName
    property variant filename
    property variant imageUrl
    property variant nam
    property variant surname
    property variant phone
    property variant email
    property variant grade
    property variant bday
    property variant unit
    property variant spec
    property variant datec
    property variant datecexp
    property variant ifr
    property variant vfr
    property variant pic
    property variant copilot
    property variant total



    pgiTab.edit_G_info.b_dateB.onClicked: {
        pgiTab.edit_G_info.b_dateB.dateDialog.open()
        pgiTab.edit_G_info.b_dateB.dateDialog.x =
                pgiTab.edit_G_info.b_date.x - pgiTab.edit_G_info.b_date.width
        pgiTab.edit_G_info.b_dateB.dateDialog.y =
                pgiTab.edit_G_info.b_date.y + pgiTab.edit_G_info.b_date.height
    }

    pgiTab.edit_G_info.date_cempnB.onClicked: {
        pgiTab.edit_G_info.date_cempnB.dateDialog.open()
        pgiTab.edit_G_info.date_cempnB.dateDialog.x =
                pgiTab.edit_G_info.date_cempn.x - pgiTab.edit_G_info.date_cempn.width
        pgiTab.edit_G_info.date_cempnB.dateDialog.y =
                pgiTab.edit_G_info.date_cempn.y + pgiTab.edit_G_info.date_cempn.height
    }

    pgiTab.edit_G_info.date_cempnExpB.onClicked: {
        pgiTab.edit_G_info.date_cempnExpB.dateDialog.open()
        pgiTab.edit_G_info.date_cempnExpB.dateDialog.x =
                pgiTab.edit_G_info.date_cempnExp.x - pgiTab.edit_G_info.date_cempnExp.width
        pgiTab.edit_G_info.date_cempnExpB.dateDialog.y =
                pgiTab.edit_G_info.date_cempnExp.y + pgiTab.edit_G_info.date_cempnExp.height
    }
    /*pgiTab.edit_G_info.date_cempnB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        pgiTab.edit_G_info.date_cempn.text = date
    }

    pgiTab.edit_G_info.date_cempnExpB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        pgiTab.edit_G_info.date_cempnExp.text = date
    }
    pgiTab.edit_G_info.b_dateB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        pgiTab.edit_G_info.b_date.text = date
    }
*/
    Connections{
        target: pilot_sheet
        Component.onCompleted:
        {PilotModel.select()
            TM.clear()
            LM.clear()
            SSM.clear()
            pilot_pic.source = filterPilot.model.get(filterPilot.currentIndex).photo
            nam = pgiTab.pilot_name.text = filterPilot.model.get(filterPilot.currentIndex).name
            surname = pgiTab.pilot_surname.text = filterPilot.model.get(filterPilot.currentIndex).surname
            phone = pgiTab.pilot_phone.text = filterPilot.model.get(filterPilot.currentIndex).telephone
            email = pgiTab.pilot_email.text = filterPilot.model.get(filterPilot.currentIndex).email
            grade = pgiTab.pilot_grade.text = filterPilot.model.get(filterPilot.currentIndex).grade
            unit = pgiTab.unit.text = filterPilot.model.get(filterPilot.currentIndex).unit
            spec = pgiTab.speciality.text = filterPilot.model.get(filterPilot.currentIndex).speciality
            bday = pgiTab.b_date.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).birthdate, "dd/MM/yyyy")
            datec = pgiTab.date_cempn.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).date_cempn, "dd/MM/yyyy")
            datecexp = pgiTab.date_cempnExp.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).date_cempn_exp, "dd/MM/yyyy")

            var ok1 = PilotTrainingModel.select(filterPilot.model.get(filterPilot.currentIndex).ID_Pilot)
            var ok2 = PilotLicenceModel.select(filterPilot.model.get(filterPilot.currentIndex).ID_Pilot)
            var ok3 = PilotSimSessionModel.select(filterPilot.model.get(filterPilot.currentIndex).ID_Pilot)

            var ptmc = PilotTrainingModel.rowCount()
            var plmc = PilotLicenceModel.rowCount()
            var pssmc = PilotSimSessionModel.rowCount()


            for(var i = 0; i < ptmc; i++){
                var id = PilotTrainingModel.get(i).ID_Training
                var date = Qt.formatDate(PilotTrainingModel.get(i).date, "dd/MM/yyyy")
                TrainingModel.selectByID(id)
                var title = TrainingModel.get(0).title
                var center = TrainingModel.get(0).center
                var authority = TrainingModel.get(0).authority
                TM.addItem(id, date, title, center, authority)
            }
            //UnSelect the ID to have all the rows in the SQL training model
            TrainingModel.unSelect()

            for(var j = 0; j < plmc; j++){
                var idl = PilotLicenceModel.get(j).ID_Licence
                var datel = Qt.formatDate(PilotLicenceModel.get(j).date, "dd/MM/yyyy")
                var ln = PilotLicenceModel.get(j).licence_number
                LicenceModel.selectByID(idl)
                var name = LicenceModel.get(0).title
                console.log(name)
                var authorityl = LicenceModel.get(0).authority
                LM.addItem(idl, datel, name, authorityl, ln)
            }
            //UnSelect the ID to have all the rows in the SQL licence model
            LicenceModel.unSelect()

            for(var k = 0; k < pssmc; k++){
                var idss = PilotSimSessionModel.get(k).ID_Sim_Info

                var datess = Qt.formatDate(PilotSimSessionModel.get(k).date, "dd/MM/yyyy")
                SimSessionModel.selectByID(idss)
                var centerss = SimSessionModel.get(0).center
                var acft = SimSessionModel.get(0).aircraft
                var stype = SimSessionModel.get(0).sim_type
                SSM.addItem(idss, datess, centerss, acft, stype)
            }
            //UnSelect the ID to have all the rows in the SQL sim session model
            SimSessionModel.unSelect()

            pilotName = pgiTab.pilot_name.text + " " + pgiTab.pilot_surname.text
            filename = pilotName + ".pdf"
            imageUrl = pilot_pic.source
        }

    }

    Connections {
        target: filterPilot
        function onPressedChanged() {
            canvas.requestPaint()
        }

    }

    function formatTime(time)
    {
        var m = time
        var h = 0
        var mn = 0
        if(m >= 60){
            mn = m % 60
            h =(m - mn)/60
            return h + "h" + mn + "mn"
        }
        else
           return m + "mn"
    }

    filterPilot.onCurrentIndexChanged: {
        TM.clear()
        LM.clear()
        SSM.clear()
        pilot_pic.source = filterPilot.model.get(filterPilot.currentIndex).photo
        nam = pgiTab.pilot_name.text = filterPilot.model.get(filterPilot.currentIndex).name
        surname = pgiTab.pilot_surname.text = filterPilot.model.get(filterPilot.currentIndex).surname
        phone = pgiTab.pilot_phone.text = filterPilot.model.get(filterPilot.currentIndex).telephone
        email = pgiTab.pilot_email.text = filterPilot.model.get(filterPilot.currentIndex).email
        grade = pgiTab.pilot_grade.text = filterPilot.model.get(filterPilot.currentIndex).grade
        unit = pgiTab.unit.text = filterPilot.model.get(filterPilot.currentIndex).unit
        spec = pgiTab.speciality.text = filterPilot.model.get(filterPilot.currentIndex).speciality
        bday = pgiTab.b_date.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).birthdate, "dd/MM/yyyy")
        datec = pgiTab.date_cempn.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).date_cempn, "dd/MM/yyyy")
        datecexp = pgiTab.date_cempnExp.text = Qt.formatDate(filterPilot.model.get(filterPilot.currentIndex).date_cempn_exp, "dd/MM/yyyy")

        currentPilotId = filterPilot.model.get(filterPilot.currentIndex).ID_Pilot
        HourDeductionModel.select(currentPilotId)

        ifr = pgiTab.ift.text = formatTime(HourDeductionModel.get(0).IFR_FT)
        vfr = pgiTab.vft.text = formatTime(HourDeductionModel.get(0).VFR_FT)
        pic = pgiTab.cpicft.text = formatTime(HourDeductionModel.get(0).FirstOf_FT)
        copilot = pgiTab.picft.text = formatTime(HourDeductionModel.get(0).PIC_FT)
        total = pgiTab.tft.text = formatTime(HourDeductionModel.get(0).total_FT)

        var ok1 = PilotTrainingModel.select(currentPilotId)
        var ok2 = PilotLicenceModel.select(currentPilotId)
        var ok3 = PilotSimSessionModel.select(currentPilotId)



        var ptmc = PilotTrainingModel.rowCount()
        var plmc = PilotLicenceModel.rowCount()
        var pssmc = PilotSimSessionModel.rowCount()

        //console.log("PTMC " + ptmc)
        //console.log("PLMC " + plmc)
        //console.log("PSSMC " + pssmc)
        for(var i = 0; i < ptmc; i++){
            var id = PilotTrainingModel.get(i).ID_Training
            var date = Qt.formatDate(PilotTrainingModel.get(i).date, "dd/MM/yyyy")
            TrainingModel.selectByID(id)
            var title = TrainingModel.get(0).title
            var center = TrainingModel.get(0).center
            var authority = TrainingModel.get(0).authority
            TM.addItem(id, date, title, center, authority)
        }
        //UnSelect the ID to have all the rows in the SQL training model
        TrainingModel.unSelect()

        for(var j = 0; j < plmc; j++){
            var idl = PilotLicenceModel.get(j).ID_Licence
            var datel = Qt.formatDate(PilotLicenceModel.get(j).date, "dd/MM/yyyy")
            var ln = PilotLicenceModel.get(j).licence_number
            LicenceModel.selectByID(idl)
            var name = LicenceModel.get(0).title
            //console.log(name)
            var authorityl = LicenceModel.get(0).authority
            LM.addItem(idl, datel, name, authorityl, ln)
        }
        //UnSelect the ID to have all the rows in the SQL licence model
        LicenceModel.unSelect()

        for(var k = 0; k < pssmc; k++){
            var idss = PilotSimSessionModel.get(k).ID_Sim_Info
            //console.log("ID SS " + idss)
            var datess = Qt.formatDate(PilotSimSessionModel.get(k).date, "dd/MM/yyyy")
            SimSessionModel.selectByID(idss)
            var centerss = SimSessionModel.get(0).center
            var acft = SimSessionModel.get(0).aircraft
            var stype = SimSessionModel.get(0).sim_type
            SSM.addItem(idss, datess, centerss, acft, stype)
        }
        //UnSelect the ID to have all the rows in the SQL sim session model
        SimSessionModel.unSelect()

        pilotName = pgiTab.pilot_name.text + " " + pgiTab.pilot_surname.text
        filename = pilotName + ".pdf"
        imageUrl = pilot_pic.source

    }

    canvas.onPaint: {

            var ctxt = canvas.getContext("2d")
            ctxt.reset()
            ctxt.moveTo(0, 0)
            ctxt.lineTo(canvas.width, 0)
            ctxt.lineTo(canvas.width / 2, canvas.height)
            ctxt.closePath()
            ctxt.fillStyle = filterPilot.pressed ? secondaryDarkColor2 : secondaryColor2
            ctxt.fill()
    }
    ptiTab.n_training.setT.onClicked: {
        TM.addItem(ptiTab.n_training.t_id.text, ptiTab.n_training.t_date.text, ptiTab.n_training.t_title.currentText,
                   ptiTab.n_training.t_center.text, ptiTab.n_training.t_authority.text)


        PilotTrainingModel.addRecord(currentPilotId, parseInt(ptiTab.n_training.t_id.text),
                                     Date.fromLocaleString(Qt.locale(), ptiTab.n_training.t_date.text, "dd/MM/yyyy"))

        //Todo  implement the delete
        ptiTab.n_training.close()
        if (ptiTab.listviewT.count < 4)
            ptiTab.controlT.visible = false
        else
            ptiTab.controlT.visible = true
    }
    pliTab.n_licence.setL.onClicked: {
        LM.addItem(pliTab.n_licence.l_id.text, pliTab.n_licence.l_date.text, pliTab.n_licence.l_title.currentText,
                   pliTab.n_licence.l_authority.text, pliTab.n_licence.l_number.text)
        PilotLicenceModel.addRecord(currentPilotId, parseInt(pliTab.n_licence.l_id.text),
                                    Date.fromLocaleString(Qt.locale(), pliTab.n_licence.l_date.text, "dd/MM/yyyy"),
                                    pliTab.n_licence.l_number.text)
        pliTab.n_licence.close()

        //Todo  implement the delete
        if(pliTab.listviewL.count < 4)
            pliTab.controlL.visible = false
        else
            pliTab.controlL.visible = true
    }

    pssiTab.n_simsession.setSS.onClicked: {
        SSM.addItem(pssiTab.n_simsession.ss_id.text, pssiTab.n_simsession.ss_date.text, pssiTab.n_simsession.ss_tCenter.currentText,
                    pssiTab.n_simsession.ss_acftType.text, pssiTab.n_simsession.ss_simType.text)

        PilotSimSessionModel.addRecord(currentPilotId, parseInt(pssiTab.n_simsession.ss_id.text),
                                       Date.fromLocaleString(Qt.locale(), pssiTab.n_simsession.ss_date.text, "dd/MM/yyyy"))

        //Todo  implement the delete
        pssiTab.n_simsession.close()
        if(pssiTab.listviewSS.count < 4)
            pssiTab.controlSS.visible = false
        else
            pssiTab.controlSS.visible = true
    }

    dwlClick.onClicked: {
        PS.createFile(filename)
        PS.createHeader(pilotName, imageUrl)
        PS.createContent(nam, surname, phone, email, grade, bday)
        PS.createContent(unit, spec, datec, datecexp)
        PS.createContent(ifr, vfr, pic, copilot, total)

        PS.createTableHeader("Training Information", "Date", "Title", "Center", "Issuing Authority")
        for(var i = 0; i < PilotTrainingModel.rowCount(); i++){
            var id = PilotTrainingModel.get(i).ID_Training
            var date = Qt.formatDate(PilotTrainingModel.get(i).date, "dd/MM/yyyy")
            TrainingModel.selectByID(id)
            var title = TrainingModel.get(0).title
            var center = TrainingModel.get(0).center
            var authority = TrainingModel.get(0).authority
            PS.createTableContent(date, title, center, authority)
        }

        PS.createTableHeader("Licence Information", "Date", "Title", "Issuing Authority", "Licence Number")
        for(var j = 0; j < PilotLicenceModel.rowCount(); j++){
            var idl = PilotLicenceModel.get(j).ID_Licence
            var datel = Qt.formatDate(PilotLicenceModel.get(j).date, "dd/MM/yyyy")
            var ln = PilotLicenceModel.get(j).licence_number
            LicenceModel.selectByID(idl)
            var name = LicenceModel.get(0).title
            //console.log(name)
            var authorityl = LicenceModel.get(0).authority
            PS.createTableContent(datel, name, authorityl, ln)
        }

        PS.createTableHeader("Simulator Session Information", "Date", "Center", "Aircraft", "Simulator Type")
        for(var k = 0; k < PilotSimSessionModel.rowCount(); k++){
            var idss = PilotSimSessionModel.get(k).ID_Sim_Info
            //console.log("ID SS " + idss)
            var datess = Qt.formatDate(PilotSimSessionModel.get(k).date, "dd/MM/yyyy")
            SimSessionModel.selectByID(idss)
            var centerss = SimSessionModel.get(0).center
            var acft = SimSessionModel.get(0).aircraft
            var stype = SimSessionModel.get(0).sim_type
            PS.createTableContent(datess, centerss, acft, stype)
        }
        PS.releaseResources()
    }
}
