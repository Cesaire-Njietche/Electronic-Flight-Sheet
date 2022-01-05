import QtQuick 2.12

import "script.js" as Logic

NewPilotForm {

    Connections{
        target: rectColor
        Component.onCompleted: {


        }
    }
    /*ColorAnimation on rectColor.color {from: "#ffffff";
        to: "lightsteelblue";
        duration: 10000 ;
        loops: Animation.Infinite;}*/

    Connections{
        target: pilot
        Component.onCompleted: {
            if(listviewL.count < 4)
                controlL.visible = false
            else
                controlL.visible = true
            if(listviewSS.count < 4)
                controlSS.visible = false
            else
                controlSS.visible = true

            if (listviewT.count < 4)
                controlT.visible = false
            else
                controlT.visible = true

            b_dateB.dateDialog.x = b_date.x - b_date.width
            b_dateB.dateDialog.y = b_date.y + b_date.height
            date_cempnB.dateDialog.x = date_cempn.x - date_cempn.width
            date_cempnB.dateDialog.y = date_cempn.y + date_cempn.height
            date_cempnExpB.dateDialog.x = date_cempnExp.x - date_cempnExp.width
            date_cempnExpB.dateDialog.y = date_cempnExp.y + date_cempnExp.height
            another.x = pilot.x + 5*pilot.width/12
            another.y = pilot.y + 5*pilot.height/12

            TM.clear()
            LM.clear()
            SSM.clear()
        }
    }

    selectPic.onClicked: {
        fileDialog.open()
    }

    selectPic.onPressed: {
        bckg_selectPic.color = buttonPressedColor
    }

    selectPic.onReleased: {
        bckg_selectPic.color = secondaryColor
    }


    /*fileDialog.onAccepted: {
        pilot_pic.source = fileDialog.fileUrl
    }*/

    date_cempnB.onClicked: {
        date_cempnB.dateDialog.open()
    }


    date_cempnExpB.onClicked: {
        date_cempnExpB.dateDialog.open()
    }


    b_dateB.onClicked: {
        b_dateB.dateDialog.open()
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

    addL.onClicked: {
        n_licence.open()
    }
    addL.onPressed: {
        bckg_addL.color = buttonPressedColor
    }
    addL.onReleased: {
        bckg_addL.color = secondaryColor
    }
    n_licence.cancelL.onClicked: {
        n_licence.close()
    }
    n_licence.setL.onClicked: {
        LM.addItem(n_licence.l_id.text, n_licence.l_date.text, n_licence.l_title.currentText,
                   n_licence.l_authority.text, n_licence.l_number.text)
        n_licence.close()

        if(listviewL.count < 4)
            controlL.visible = false
        else
            controlL.visible = true
    }


    addT.onClicked: {
        n_training.open()
    }
    addT.onPressed: {
        bckg_addT.color = buttonPressedColor
    }
    addT.onReleased: {
        bckg_addT.color = secondaryColor
    }
    n_training.setT.onClicked: {
        TM.addItem(n_training.t_id.text, n_training.t_date.text, n_training.t_title.currentText,
                   n_training.t_center.text, n_training.t_authority.text)
        n_training.close()
        if (listviewT.count < 4)
            controlT.visible = false
        else
            controlT.visible = true
    }
    n_training.cancelT.onClicked: {
        n_training.close()
    }


    addSS.onClicked: {
        n_sims.open()
    }

    addSS.onPressed: {
        bckg_addSS.color = buttonPressedColor
    }
    addSS.onReleased: {
        bckg_addSS.color = secondaryColor
    }
    n_sims.cancelSS.onClicked: {
        n_sims.close()
    }
    n_sims.setSS.onClicked: {
        SSM.addItem(n_sims.ss_id.text, n_sims.ss_date.text, n_sims.ss_tCenter.currentText,
                    n_sims.ss_acftType.text, n_sims.ss_simType.text)
        n_sims.close()
        if(listviewSS.count < 4)
            controlSS.visible = false
        else
            controlSS.visible = true
    }

    /*date_cempnB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        date_cempn.text = date
    }

    date_cempnExpB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        date_cempnExp.text = date
    }
    b_dateB.dateDialog.onGetDate:{
        date = Qt.formatDate(date, "dd/MM/yyyy")
        b_date.text = date
    }*/

    save.onClicked: {
        //console.log(trainingModel.getTraining(0).ID_Training)
        //console.log(simsessionModel.getSimSession(0).ID_Sim_Info)
        //console.log(licenceModel.getLicence(0).ID_Licence)

        var lastInsertedId = PilotModel.addRecord(pilot_name.text, pilot_surname.text, pilot_phone.text, pilot_email.text,
                                                  unit.currentText, speciality.currentText, Date.fromLocaleString(Qt.locale(), date_cempn.text, "dd/MM/yyyy"),
                                                  Date.fromLocaleString(Qt.locale(), date_cempnExp.text, "dd/MM/yyyy"), pilot_pic.source,
                                                  pilot_grade.text, Date.fromLocaleString(Qt.locale(), b_date.text, "dd/MM/yyyy"))


        if(lastInsertedId > 0){
            //console.log("Yes!!!!!!")
            //efs.replace(efs.currentItem, "Home.qml")
            //console.log(trainingModel.count())
            HourDeductionModel.addRecord(lastInsertedId, 0, 0, 0, 0, 0)
            for(var i = 0; i < trainingModel.count(); i++){
                PilotTrainingModel.addRecord(lastInsertedId, trainingModel.getTraining(i).ID_Training,
                                             Date.fromLocaleString(Qt.locale(), trainingModel.getTraining(i).date, "dd/MM/yyyy"));
            }
            //console.log(licenceModel.count())
            for(var i = 0; i < licenceModel.count(); i++){
                PilotLicenceModel.addRecord(lastInsertedId, licenceModel.getLicence(i).ID_Licence,
                                            Date.fromLocaleString(Qt.locale(), licenceModel.getLicence(i).date, "dd/MM/yyyy"),
                                            licenceModel.getLicence(i).number);
            }
            for(var i = 0; i < simsessionModel.count(); i++){
                PilotSimSessionModel.addRecord(lastInsertedId, simsessionModel.getSimSession(i).ID_Sim_Info,
                                               Date.fromLocaleString(Qt.locale(), simsessionModel.getSimSession(i).date, "dd/MM/yyyy"));
            }

            another.open()

        }
        //another.open()
        /*console.log(pilot_name.text, pilot_surname.text, pilot_phone.text, pilot_email.text,
                    unit.currentText, speciality.currentText, Date.fromLocaleString(Qt.locale(), date_cempn.text, "dd/MM/yyyy"),
                    Date.fromLocaleString(Qt.locale(), date_cempnExp.text, "dd/MM/yyyy"), pilot_pic.source,
                          pilot_grade.text, Date.fromLocaleString(Qt.locale(), b_date.text, "dd/MM/yyyy"))*/
    }
}


