Ext.define('ExtDesktop.controller.Student', {
    extend: 'Ext.app.Controller',
    models: [
        // 'Company'
    ],
    stores: [
        'sdn.Student',
        "combo.Batch",
        "combo.AcademicYear",
        "combo.Course",
        "combo.Degree",
        "combo.Major",
        "combo.TuitionTime",
        "combo.CityState",
        "combo.DegreeTC",
        "combo.CourseTC",

        "combo.DegreeWU",
        "combo.CourseWU",
        "StudentCategory",
        "Occupation",
        "lookup.CmbReligion",
        "Nationality",
        "Langauge",
        "sdn.Document",
        "Ethnicity", 
        "sdn.DropType",
        "sdn.SuspendType"

    ],
    views: [
        'module.student.Index',
        'module.student.WinAdvanceSearch',
        'module.student.WinStudent',
        'module.student.FrmBasicInfo',
        'module.student.FrmAcademic',
        'module.student.FrmPersonal',
        'module.student.FmFamilyContact',
        'module.student.FmEmergencyContact',
        'module.admissionWU.FmAdditional',
        'module.student.WinAdmissionDetail',
        'module.student.WinAdmissionTCDetail'
    ],

    init: function(application) {
        this.service = Ext.create("ExtDesktop.service.sdn.Service");
        this.control({
            "studentGrid actioncolumn": {
                //itemclick: this.handleActionColumn
            },
            "studentGrid button[action=AdvanceSearch]": {
                click: this.showFormStudentAdvanceSearch
            },
            "studentGrid textfield[name=filter]": {
                change: this.search
            },
            "studentGrid button[action=Add]": {
                click: this.showFormStudent
            },
            "winAdvanceSearch button[action=Close]": {
                click: this.closeWindow
            },
            "winAdvanceSearch button[action=Search]": {
                click: this.advanceSearch
            },
            //==== student form
            'winStudent filefield': {
                change: this.uploadTempImage
            },
            "winStudent button[action=Unlock]": {
                click: this.unlockForm
            },
            "winStudent button[action=Save]": {
                click: this.save
            },

            "winStudent #closeStudent": {
                click: this.closeStudent
            },
            "winStudent #reOpenStudent": {
                click: this.openStudent
            },
            "winStudent #ShowDetail": {
                click: this.showDetail
            },
            "winStudent button[action=SuspendAdmission]": {
                click: this.suspendStudent

            },
            "winStudent button[action=Transfer]": {
                click: this.transferStudent

            },
            "winStudent button[action=DropAdmission]": {
                click: this.dropStudent
            },

            //  even on form suppend student
            "WinSuspendAdmission button[action=SuspendAdmission]":{
                click : this.saveSuspend
            },
            "winDropAdmission button[action=DropAdmission]":{
                click : this.saveDrop
            },
            "WinAdmissionDetail button[action=Unlock]":{
                click : this.unlockAmsWU
            },
            "WinAdmissionDetail button[action=Close]":{
                click : this.closeWindow
            },
             "WinAdmissionTCDetail button[action=Close]":{
                click : this.closeWindow
            },
             "WinAdmissionTCDetail button[action=Unlock]":{
                click : this.unlockAmsTC
            }
        });
    },
    admissionStore : null ,
    unlockAmsTC:function(btn){
        var win = btn.up("window");
        var rec = win.down("form").getRecord();
        win.close();

        this.showAmsDtTC(rec , false );
    },
    unlockAmsWU:function(btn ){
        var win = btn.up("window");
        var rec = win.down("form").getRecord();
        win.close();

        this.showAmsDtWU(rec , false );
    },
    saveDrop:function(btn){
        ExtDesktop.app.getController("Movement").saveDrop(btn);
        var me = this ;
        setTimeout(function(){
            // load admission store
           me.admissionStore.load();
        }, 2000);
    },
    saveSuspend:function(btn){

        ExtDesktop.app.getController("Movement").saveSuspend(btn);
        var me = this ;
        setTimeout(function(){
            // load admission store
           me.admissionStore.load();
        }, 2000);
    },

    save: function(btn) {
        Ext.MessageBox.wait("Please Wait....", "System Saving Data");
        var win = btn.up('window');
        var mainForm = win.down('form[name=mainForm]'),
            record = mainForm.getRecord(),
            values = win.down('form[name=mainForm]').getValues();
        var me = this;

        // validate form
        if (mainForm.getForm().isValid() == false) {
            Ext.MessageBox.hide();
            Util.msg('Please Entry Require Field ', btn);
            return 0;
        }

        // personal contact
        var sdnInfoValues = win.down('#FmBasic').getValues();
        var personalValues = win.down('#fmPersonal').getValues();
        var personalcontactValue = win.down("form[name=personalContact]").getValues();
        // var academicValues = win.down('form[name=academic]').getValues();
        var emergencyValues = win.down('form[name=emergency]').getValues();
        var fatherValues = win.down('form[name=father]').getValues();
        var motherValues = win.down('form[name=mother]').getValues();
        var stuernKhrValues = win.down("FmAdditional").getValues();
        // var accountingValues = win.down('form[name=feeCharge]').getValues();
        // var discountList = me.getSdnDiscountItemStore().data.items;
        // discountList = Ext.JSON.decode(Ext.encode(Ext.pluck(discountList, 'data')));
        // var feeList = me.getSdnAdditionalFeeStore().data.items;
        // feeList = Ext.JSON.decode(Ext.encode(Ext.pluck(feeList, 'data')));

        var studentModel = Ext.create('ExtDesktop.model.Student');
        studentModel.set(personalValues);
        studentModel.set(sdnInfoValues);
        studentModel.set(personalcontactValue);
        studentModel.set("sdn_document_attributes", Util.getItemStore(this.getSdnDocumentStore()))
        studentModel.set("note", win.down("textarea[name=note]").getValue());
        studentModel.set('image_url', win.down("hiddenfield[name=image_url]").getValue())

        var emergencyModel = Ext.create("ExtDesktop.model.Contact");
        emergencyModel.set(emergencyValues);

        var fatherModel = Ext.create("ExtDesktop.model.Contact");
        fatherModel.set(fatherValues);

        var motherModel = Ext.create("ExtDesktop.model.Contact");
        motherModel.set(motherValues);

        var studentKhrModel = Ext.create("ExtDesktop.model.sdn.StudentKhr");
        studentKhrModel.set(stuernKhrValues);

        // var feeChargeModel = Ext.create("ExtDesktop.model.sdn.FeeCharge");
        // accountingValues.sdn_fee_discount_attributes = discountList;
        // accountingValues.sdn_additional_fee_attributes = feeList;
        // feeChargeModel.set(accountingValues);

        var store = Ext.create("ExtDesktop.store.admission.Student");
        var model = Ext.create("ExtDesktop.model.admission.Student", {

            studentModel: studentModel.data,
            emergencyModel: emergencyModel.data,
            fatherModel: fatherModel.data,
            motherModel: motherModel.data,
            // admissionModel: admissionModel.data,
            // feeChargeModel: feeChargeModel.data,
            studentKhrModel: studentKhrModel.data,
            type: 'WU'

        });


        if (record) {
            model.set("id", record.get("id"));
        };


        store.add(model);
        store.sync({
            success: function(batch, options) {
                Ext.MessageBox.hide();
                if (win) {
                    win.close();
                }
                me.getSdnStudentStore().load();

                if (btn.action == "SaveClose") {
                    var newWin = Ext.create('ExtDesktop.view.module.admission.WinAdmission');

                    newWin.show();
                    newWin.center();
                    newWin.down("textfield").focus(true, 200)
                }

                Ext.MessageBox.show({
                    title: 'Saved',
                    msg: 'Record Save Succeed.',
                    icon: Ext.MessageBox.INFO,
                    buttons: Ext.Msg.OK
                });

            },
            failure: function(batch, options) {
                Ext.MessageBox.hide();

                store.rejectChanges();
                var msg = batch.proxy.reader.rawData.message;

                Ext.MessageBox.show({
                    title: 'Error',
                    msg: msg,
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });

            },
            callback: function(batch, options) {

            },
            scope: this
        });

    },
    search: function(field) {
        var value = field.getValue();
        var store = field.up("grid").getStore();
        Util.loadStore(store, {
            tf_keyword: value
        });
    },
    advanceSearch: function(btn) {
        var win = btn.up("window");
        var form = win.down("form");
        var values = form.getValues();
        var store = this.getSdnStudentStore();
        store.proxy.extraParams = values;
        store.load();

    },
    showDetail: function(btn) {

        var rec = Util.getRecord(btn , "Please select admission before show detail " );
        if (rec) {
            // if batch id = null  is TC
            if(rec.get("batch_id") == null  ){

                this.showAmsDtTC(rec , true );
            }else{
                this.showAmsDtWU(rec , true );

            }
        };
    },
    showAmsDtWU:function(rec , isReadOnly ){
        var win = Ext.create('ExtDesktop.view.module.student.WinAdmissionDetail',{ isReadOnly:isReadOnly });
        win.down("form").getForm().loadRecord(rec);
        var fm = win.down("#class");

        this.service.loadClassInfoWu( fm , rec.get("class_id"));

        win.show();
        win.center();
    },
    showAmsDtTC:function(rec , isReadOnly ){
        var win = Ext.create('ExtDesktop.view.module.student.WinAdmissionTCDetail',{ isReadOnly:isReadOnly });

        win.down("form").getForm().loadRecord(rec);
        var fm = win.down("#class");
        this.service.loadClassInfo( fm , rec.get("class_id"));

        win.show();
        win.center();

    },
    closeStudent: function(btn) {
        win = btn.up("window")
        me = this
        form = win.down("form")
        var rec = form.getRecord();
        if (rec.get("record_stat") == "O") {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to close student?', function(btn) {
                if (btn == 'yes') {
                    student_id = rec.get("id");
                    Util.ajax("SdnStudent/close_student", {
                        student_id: student_id
                    }, me.closeForm, { win : win , me : me })
                }
            });
        } else {
            Util.msg("Current record is close")
        };



    },
    openStudent: function(btn) {
        win = btn.up("window")
        me = this
        form = win.down("form")
        var rec = form.getRecord();
        if (rec.get("record_stat") == "C") {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to open student?', function(btn) {
                if (btn == 'yes') {
                    student_id = rec.get("id");
                    Util.ajax("SdnStudent/open_student", {
                        student_id: student_id
                    }, me.closeForm, { win : win , me : me })
                }
            });
        } else {
            Util.msg("Current record is close")
        };



    },
    closeForm: function(obj, params) {

        params.win.close();
        me.getSdnStudentStore().load();
    },
    transferStudent: function() {
        alert('Transfer student');
    },
    suspendStudent: function(btn) {
        var rec = Util.getRecord(btn , "Please select admission ");
        var win = btn.up("window") ;
        var recStudent = win.down("form").getRecord();
        if(rec){
            if( recStudent.get("record_stat") == "O"  ){

                if (rec.get("status") == "A") {
                    var win = Ext.create('ExtDesktop.view.module.student.WinSuspend')
                    win.show()
                    win.center()
                    win.down("form").getForm().loadRecord(rec);
                    win.down("hiddenfield[name=student_id]").setValue(recStudent.get("id"));
                    win.down("hiddenfield[name=admission_id]").setValue(rec.get("id"));

                    win.down("textfield[name=student_no]").setValue(recStudent.get("student_no"))
                    win.down("textfield[name=name]").setValue( recStudent.get("first_name") +" "+ recStudent.get("last_name"))
                } else{
                    Util.msg("Admission can be suppend only status Active only")
                };

            }else{

                Util.msg("Student already Closed")
            }
        }

    },
    dropStudent: function(btn ) {
        var win = btn.up("window") ;
        var rec = Util.getRecord(btn , "Please select admission for drop");
        var recStudent = win.down("form").getRecord();
        if(rec){
            if( recStudent.get("record_stat") == "O" || recStudent.get("record_stat") == "S"){
                var win = Ext.create('ExtDesktop.view.module.student.WinDrop');
                win.down("form").getForm().loadRecord(rec);
                win.down("hiddenfield[name=student_id]").setValue(recStudent.get("id"));
                win.down("hiddenfield[name=admission_id]").setValue(rec.get("id"));
                win.down("textfield[name=student_no]").setValue(recStudent.get("student_no"))

                win.show();
                win.center();
            }else{
                Util.msg("This admission is already closed")
            }
        }

    },
    unlockForm: function(btn) {
        var win = btn.up("window");
        var form = win.down("FmBasic").down("form");
        var rec = form.getRecord();
        if (rec.get("record_stat") == "O") {
            win.close();
            this.showFormStudentWithLock(rec, false);
        } else {
            Util.msg("Student data cannot edit in status close")
        };
    },
    uploadTempImage: function(field, value) {

        var form = field.up('form').getForm();
        window.imageField = field.up('form').down('image');
        form.submit({
            url: '/SdnStudent/uploadImage',
            waitMsg: 'Uploading your file...',
            success: function(response, o) {
                var objReturn = Ext.decode(o.response.responseText);
                var fileImage = imageField;
                field.up('form').down("hiddenfield[name=image_url]").setValue(objReturn.data.replace("/", ""));
                fileImage.setSrc(objReturn.data.replace("/", ""));
            }
        });
    },

    closeWindow: function(btn) {
        btn.up('window').close();
    },
    showFormStudent: function(grid, index) {
           
        var store = grid.getStore();
        var record = store.getAt(index);
        this.showFormStudentWithLock(record, true);
    },
    showFormStudentWithLock: function(record, lock) {


        var win = Ext.create('ExtDesktop.view.module.student.WinStudent', {
            lock: lock
        })

        win.show()
        win.center()
        win.down("form[name=mainForm]").getForm().loadRecord(record);
        // === set record
        // set title
        var record_stat = record.get("record_stat") == "O" ? "Open" : "Close";
        var title = "<u>Student ID:</u> " + record.get("student_no") + "," + record_stat;
        win.setTitle(title)
            // 1- form basic
        var fmBasic = win.down("#FmBasic");
        fmBasic.getForm().loadRecord(record);
        if (record.get("image_url")) {
            fmBasic.up("panel").down("image").setSrc(record.get("image_url"))
        }
        // 2- form personal
        var fmPersonal = win.down("#fmPersonal");
        fmPersonal.getForm().loadRecord(record);
        // 3- person contact
        var fmContact = win.down("form[name=personalContact]");
        fmContact.getForm().loadRecord(record);

        // 4- load emergency contact
        var admissionController = ExtDesktop.app.getController("Admission");
        Util.ajax("/SdnAdmission/get_student_contact", {
            student_id: record.get("id")
        }, admissionController.setFormContact, win);

        //5- load admission store
        this.admissionStore = win.down("FmAcademic").getStore();
       // this.admissionStore.proxy.extraParams.student_id =  ;
  
        this.admissionStore.load({
        	params:{
        		student_id: record.get("id"), 
                type:''
        	}
        });

        // 6- load khr form
        var fmAdditional = win.down("form[name=admissionWuFmAdditional]");
        fmAdditional.getForm().loadRecord(record);
        // win.down("FmAdditional").down("datefield[name=date_of_birth]").setValue(record.get("date_of_birth_khr"))
       fmAdditional.down("textarea[name=address]").setValue(record.get("address_khr"))
        fmAdditional.down("radio[name=gender]").setValue(record.get("gender_khr"))

    },
    showFormStudentAdvanceSearch: function() {
        var win = Ext.create('ExtDesktop.view.module.student.WinAdvanceSearch')
        win.show()
        win.center()
    }

});
