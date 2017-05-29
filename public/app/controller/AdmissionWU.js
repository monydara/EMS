Ext.define('ExtDesktop.controller.AdmissionWU', {
    extend: 'Ext.app.Controller',
    stores: [
        'sdn.Lead',
        'admissionWU.Admission',
        'sdn.Document',
        'AcademicYear',
        'admissionWU.AdmissionList',
        'Ethnicity',
        'Langauge',
        'Nationality',
        'Occupation',
        'lookup.CmbReligion',
        'StudentCategory',
        'Batch',
        'combo.Major',
        'combo.Batch',
        'combo.DegreeWU',
        'combo.CourseWU',
        'combo.TuitionTime',
        'combo.ClassShift',
        'combo.AcademicYear',
        'combo.DocumentType',
        'combo.CityState',
        'acd.Faculty'

    ],
    views: [
            'module.admissionWU.Index',
            'module.admissionWU.FmEmergencyContact',
            'module.admissionWU.FmFamilyContact',
            'module.admissionWU.WinSelectReferenceAdmission'
    ],
    init: function(app) {

        this.control({
            'admissionWUGrid button[action=Add]': {
                click: this.showPage
            },
            'admissionWUGrid button[action=ActiveAdmission]': {
                click: this.activeStudent
            },
            'admissionWUGrid button[action=CancelStudent]': {
                click: this.cancelStudent
            },
            'admissionWUGrid button[action=Edit]': {
                click: this.showPageEdit
            },
            "admissionWUGrid button[action=Copy]": {
                click: this.createCopy
            },
            "admissionWUGrid button[action=Transfer]": {
                click: this.showPageTransfer
            },
            "admissionWUGrid textfield[name=filter]": {
                change: this.search
            },
            "GridAdmissionList textfield[name=filter]": {
                change: this.searchAdmissionList
            },


            'WinAddmissionWU button[action=BroweRegistration]': {
                click: this.BroweRegistration
            },
            'WinAddmissionWU combo[name=course_id]': {
                change: this.filterMajor
            },
            'WinAddmissionWU button[action=studentAdmission]': {
                click: this.getStudentList
            },
            'WinStudentAdmission textfield[name=search]': {
                change: this.loadGridStudentBySearch
            },
            'WinAddmissionWU filefield': {
                change: this.uploadTempImage
            },
            'WinAddmissionWU combo[name=city]': {
                select: this.changeAddress
            },


            'WinAddmissionWU button[action=Cancel]': {
                click: this.closeWindow
            },
            'WinAddmissionWU button[action=Save]': {
                click: this.save
            },
            'WinAddmissionWU button[action=SelectRefAdmission]': {
                click: this.showAdmissionList
            },

            // -----------  new event
            'WinAddmissionWU button[action=SaveClose]': {
                click: this.save
            },

            'WinAddmissionWU button[action=AddDocument]': {
                click: this.showFormDocument
            },




            // ----------- add registation to form
            'WinStudentAdmissionWU grid': {
                itemdblclick: this.loadRegistrationToForm
            },
            //------------- action form transfer
            'amsWinTransfer textfield[name=reference_no]':{
                specialkey: this.loadAdmissionRecord
            },
            'amsWinTransfer button[action=Save]':{
                click: this.saveAdmissionTransfer
            },
            'amsWinTransfer combo[name=degree_id]':{
                change: this.filterCourse
            },
            'amsWinTransfer combo[name=course_id]':{
                change: this.filterMajor
            },
            // student reference
            "WinSelectReferenceAdmission grid":{
                itemdblclick: this.loadAdmissionToForm
            },
            "WinAddmissionWU button[action=PopulateRefAdmission]":{
                click: this.populateAdmission
            }
        });

    },
    formAdmission: null,
    winAdmission: null ,
    populateAdmission:function(btn){
        var  win = btn.up("window");
        var refNo = win.down("textfield[name=reference_no]").getValue();
        var me = this ;
        if (refNo && !( refNo == "" )) {
            Util.ajax("SdnAdmission/get_admission" ,{ admission_no:refNo} , me.loadAfterAjaxAms, win  );

        } else{
            Util.msg("Please select admission before populate");
        };
    },
    loadAfterAjaxAms:function(obj , win ){

        var data = obj.data[0].sdn_student ;

        win.down("form[name=sdnInfo]").getForm().setValues(data);
        win.down("image").setSrc(data.image_url);
        win.down("form[name=personalInfo]").getForm().setValues(data);

        win.down("hiddenfield[name=studentId]").setValue(obj.data[0].student_id);
        console.log(     win.down("hiddenfield[name=studentId]").getValue(), "===== student id ")
    },
    loadAdmissionToForm:function(grid , rec){
        var win = grid.up("window");
        var w = this.winAdmission;
        var referenceNoField = w.down('textfield[name=reference_no]');

        var refNo = rec.get("admission_no") ;
        if ( refNo && !(refNo == "")) {
            referenceNoField.setValue(refNo);
            win.close();
        } else{
            Util.msg("Please active this admission ");
        };



    },
    showAdmissionList:function(btn){
        this.winAdmission = btn.up("window");
        win = Ext.create("ExtDesktop.view.module.admissionWU.WinSelectReferenceAdmission")
        win.show()
        win.center()
    },
    saveAdmissionTransfer:function(btn){

        win = btn.up("window")
        form = win.down("form")
        values = form.getValues()
        rec = form.getRecord()
        me = this

        if (rec) {
            rec.set(values)
            obj = rec.getData()
            Util.ajax("/SdnAdmission/save_admission_transfer" ,obj, me.afterTransfer , win )
        }else{
            Util.msg("Please select reference fist  ")
        };

    },
    afterTransfer:function(obj, win){
        if (obj.success) {
            win.close()
        }else{
            Util.msg(obj.success)
        };
    },
    loadAdmissionRecord:function(field,e){
        me = this
         if (e.getKey() == e.ENTER) {
            value = field.getValue()
            params= {
                admission_no:value
            }
            Util.ajax("/SdnAdmission/get_admission",params, me.loadAdmissionByReference , field )

        }
    },
    loadAdmissionByReference:function(obj , field){
        if (obj.data) {
            data = obj.data[0]
            form = field.up("form")
            model = Ext.create("ExtDesktop.model.admission.Admission")
            data.degree_id = null
            data.course_id = null
            data.major_id = null
            model.set(data)
            model.set("reference_no",data.admission_no)
            form.getForm().loadRecord(model)


        }else{
            Util.msg("Please enter correct admission no ")
        };
    },

    showPageTransfer:function(btn){

        win = Ext.create("ExtDesktop.view.module.admissionWU.WinTransfer")
        win.show()
        win.center()
        win.down("textfield").focus(true,200)

    },
    search:function(field , value){
        store = field.up('grid').getStore()
        Util.loadStore(store , { text:value , type:'WU'} )
    },

    searchAdmissionList:function(field , value){
        store = field.up('grid').getStore()
        Util.loadStore(store , { search:value} )
    },

    showFormDocument: function() {
        var win = Ext.create('ExtDesktop.view.module.admission.WinDocument');
        win.show();
        win.center();
    },
    loadRegistrationToForm: function(dv, record, item, index, e) {
        var me = this;
        if (me.formAdmission) {
            dv.up("grid").getStore().proxy.extraParams = null ;
            me.formAdmission.down('form[name=sdnInfo]').getForm().setValues(record.data);
            me.formAdmission.down('form[name=personalInfo]').getForm().setValues(record.data);

            me.formAdmission.down('image').setSrc(record.get("image_url").replace("/", ""));
            me.formAdmission.down('hiddenfield[name=image_url]').setValue(record.get("image_url").replace("/", ""));
            me.formAdmission.down('hiddenfield[name=lead_id]').setValue(record.get("id"));
            dv.up('window').close();
        };
    },
    BroweRegistration: function(btn) {
        var me = this;
        var form = btn.up("window");
        me.formAdmission = form;

        var win = Ext.create('ExtDesktop.view.module.admissionWU.WinStudent');
        win.show();
        win.center();
    },

    cancelStudent: function(btn) {
        var record = Util.getRecord(btn ,"Please select admission for active");
        var grid = btn.up("grid");
        var me = this;
        if (record.get("status") == "N") {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to Cancel this student?', function(btn) {
                if (btn == 'yes') {
                    Ext.MessageBox.wait("Please Wait System Processing ....", "Cancel Student");
                    Util.ajax("/SdnStudent/cancel_student", {
                        admission_id: record.get("id")
                    }, me.afterCancelStudent, {grid : grid , record:record, title:"Cancel Admission Succeed" });
                }
            })
        } else {
            Util.msg("Student can active in status New Only");
        };
    },
    activeStudent: function(btn) {
        var record =Util.getRecord(btn , "Please select admission for active");
        var me = this;
        if (record.get("status") == "N") {
            var grid = btn.up("grid");
            Ext.MessageBox.confirm('Confirm', 'Are you sure to activate this record?', function(btn) {
                if (btn == 'yes') {
                    Ext.MessageBox.wait("Please Wait System Processing ....", "Ative Student");
                    Util.ajax("/SdnStudent/active_student_wu", {
                        student_id: record.get("id")
                    }, me.afterAtiveStudent, {grid : grid , record:record, title:"Admission Activated" });
                }
            })
        } else {
            Util.msg("Student can active in status New Only");
        };


    },
    afterCancelStudent:function(obj, param){
        Ext.MessageBox.hide();   
        param.grid.getStore().load();
    },
    afterAtiveStudent: function(obj, param) {

        Ext.MessageBox.hide();
        param.grid.getStore().load();
        var sdnData = param.record.data ; 
        
        var win = Ext.create("Ext.window.Window",{
            bodyPadding:20 , 
            title:param.title,
            items:[
                {
                    html:'Student Id: '+sdnData.student_no
                },
                {
                    html:'Student Name: '+sdnData.first_name +" "+ sdnData.last_name 
                },{
                    html:'Admission No: <b>'+obj.data.admission_no+"</b>"
                }
            ], 
            buttons:[
                {
                    xtype:'button', 
                    text:'Ok', 
                    handler:function(){
                        win.close();
                    }
                }
            ]
        })
        win.show();

        
    },
    showPageEdit: function(btn) {
        var me = this;
        var grid = btn.up("gridpanel");
        var row = grid.getSelectionModel().getSelection();

        if (row.length) {
            var win = Ext.create("ExtDesktop.view.module.admissionWU.WinAdmission");
            var form = win.down('form');
            var record = row[0];

            if (record.get("status") == "N") {

                // load contact information
                form.loadRecord(record);

                form.down("image").setSrc(record.get("image_url"));

                // sdn.DiscountItem
                // me.getSdnDiscountItemStore().load({
                //     params: {
                //         student_id: record.get("id")
                //     }
                // });
                //     'sdn.AdditionalFee',
                // me.getSdnAdditionalFeeStore().load({
                //     params: {
                //         student_id: record.get("id")
                //     }
                // });
                // 'sdn.Document',
                me.getSdnDocumentStore().load({
                    params: {
                        student_id: record.get("student_id")
                    }
                });

                Util.ajax("SdnAdmission/get_student_contact", {
                    student_id: record.get("student_id")
                }, me.setFormContact, win);
                // filter course
                win.show();
                win.center();
            } else {
                Util.msg("Admission can edit in status New only");
            };
        } else {
            Util.msg("Please Select Record Before Click Edit");
        }

    },

    setFormContact: function(obj, win) {
        var values = obj.data;

        if (values) {
            setTimeout(function() {

                values.forEach(function(rec) {
                    if (rec.contact_type == "E") {
                        win.down("form[name=emergency]").getForm().setValues(rec);

                    } else if (rec.contact_type == "F") {
                        win.down("form[name=father]").getForm().setValues(rec);

                    } else if (rec.contact_type == "M") {
                        win.down("form[name=mother]").getForm().setValues(rec);

                    };

                })
            }, 2000);

        };
    },
    createCopy: function(btn) {
        var grid = btn.up("grid");
        var row = grid.getSelectionModel().getSelection();

        if (row.length) {

            var win = Ext.create('ExtDesktop.view.module.admissionWU.WinAdmission');
            var form = win.down('form');
            var record = row[0];
            win.show();
            win.center();

            this.setRecordCopy(win, record);

        } else {
            this.msg("Please select record before click on copy");
        }
    },

    setRecordCopy: function(win, record) {

        // personal form
        win.down("combo[name=category_id]").setValue(record.get("category_id"));
        win.down("combo[name=occupation_id]").setValue(record.get("occupation_id"));
        win.down("combo[name=religion_id]").setValue(record.get("religion_id"));
        win.down("combo[name=national_id]").setValue(record.get("national_id"));
        win.down("combo[name=langauge_id]").setValue(record.get("langauge_id"));
        win.down("combo[name=ethnicity_id]").setValue(record.get("ethnicity_id"));

        // acadimic form
        win.down("combo[name=batch_id]").setValue(record.get("batch_id"));
        win.down("combo[name=degree_id]").setValue(record.get("degree_id"));
        win.down("combo[name=course_id]").setValue(record.get("course_id"));
            // win.down("combo[name=term_id]").setValue(record.get("term_id"));
        win.down("combo[name=major_id]").setValue(record.get("major_id"));
        // win.down("combo[name=tuition_time_id]").setValue(record.get("tuition_time_id"));
        win.down("datefield[name=admission_date]").setValue(record.get("admission_date"));
        win.down("combo[name=class_shift_id]").setValue(record.get("class_shift_id"));
        win.down("combo[name=admission_type]").setValue(record.get("admission_type"));
        // win.down("combo[name=s_level_id]").setValue(record.get("s_level_id"));
        win.down("combo[name=start_acd_year_id]").setValue(record.get("start_acd_year_id"));



    },

    filterMajor: function(field, value) {
        console.log('filter major')
        var store = this.getComboMajorStore();
        store.load({
            params: {
                course_id: value
            }
        });

    },
    loadGridStudentBySearch: function(field, value) {
        var grid = field.up('grid');
        var store = grid.getStore();
        Util.loadStore(store, {
            filter: value
        });

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

        // create admission from student
        var studentId = win.down("hiddenfield[name=studentId]").getValue();

        // personal contact
        var sdnInfoValues = win.down('form[name=sdnInfo]').getValues();
        var personalValues = win.down('form[name=personalInfo]').getValues();
        var academicValues = win.down('form[name=academic]').getValues();
        var emergencyValues = win.down('form[name=emergency]').getValues();
        var fatherValues = win.down('form[name=father]').getValues();
        var motherValues = win.down('form[name=mother]').getValues();
        // var accountingValues = win.down('form[name=feeCharge]').getValues();
        var studnetKhrValues = win.down('form[name=additional]').getValues();

       /* var discountList = me.getSdnDiscountItemStore().data.items;
        discountList = Ext.JSON.decode(Ext.encode(Ext.pluck(discountList, 'data')));
        var feeList = me.getSdnAdditionalFeeStore().data.items;
        feeList = Ext.JSON.decode(Ext.encode(Ext.pluck(feeList, 'data')));
*/
        var studentModel = Ext.create('ExtDesktop.model.Student');
        studentModel.set(personalValues);
        studentModel.set(sdnInfoValues);
        studentModel.set("sdn_document_attributes" ,Util.getItemStore(this.getSdnDocumentStore()) )
        studentModel.set("note", win.down("textarea[name=note]").getValue());

        var emergencyModel = Ext.create("ExtDesktop.model.Contact");
        emergencyModel.set(emergencyValues);

        var fatherModel = Ext.create("ExtDesktop.model.Contact");
        fatherModel.set(fatherValues);

        var motherModel = Ext.create("ExtDesktop.model.Contact");
        motherModel.set(motherValues);

        var admissionModel = Ext.create("ExtDesktop.model.admission.Admission");
        admissionModel.set(academicValues);

        // var feeChargeModel = Ext.create("ExtDesktop.model.sdn.FeeCharge");
        // accountingValues.sdn_fee_discount_attributes = discountList;
        // accountingValues.sdn_additional_fee_attributes = feeList;
        // feeChargeModel.set(accountingValues);

        var studentKhrModel = Ext.create("ExtDesktop.model.sdn.StudentKhr");
        studentKhrModel.set(studnetKhrValues);
        console.log(     win.down("hiddenfield[name=studentId]").getValue(), "===== student id ")

        var store = Ext.create("ExtDesktop.store.admission.Student");
        var model = Ext.create("ExtDesktop.model.admission.Student", {

            studentModel: studentModel.data,
            emergencyModel: emergencyModel.data,
            fatherModel: fatherModel.data,
            motherModel: motherModel.data,
            admissionModel: admissionModel.data,
            studentKhrModel: studentKhrModel.data,
            type: 'WU',
            student_id:studentId

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

                me.getAdmissionWUAdmissionStore().load();
                 if (btn.action == "SaveClose") {

                    var newWin = Ext.create('ExtDesktop.view.module.admissionWU.WinAdmission');

                    newWin.show();
                    newWin.center();
                    newWin.down("textfield").focus(true , 200)
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

    afterSaveAdmissionAndClose: function(obj, win) {
        win.close();
    },
    afterSaveAdmission: function(obj, win) {
        //      win.close();
        win.down('form').getForm().reset();
    },

    closeWindow: function(btn) {
        btn.up('window').close();
    },


    filterLevel: function(field, obj) {
        var rec = obj[0].data;
        var combo = field.up('window').down('combo[name=tcLevel]');

        combo.store.proxy.extraParams.courseId = rec.courseId;

        combo.store.load();
        combo.setValue('');

    },
    filterCourse: function(field, obj) {
        var degree_id = field.getValue();
        var comboCourse = field.up('window').down('combo[name=course_id]');

        comboCourse.store.proxy.extraParams.degree_id = degree_id;

        comboCourse.store.load();
        comboCourse.setValue('');
    },

    uploadTempImage: function(field, value) {
        console.log('start upload temp image')
        var form = field.up('form').getForm();
        var image=field.up('form').down('image');
        window.imageField = field.up('form').down('image');
        console.log(image);
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

    changeAddress: function(obj) {

        var name = obj.name;
        if (obj.getValue() == "") {
            return;
        }
        switch (name) {
            case 'city':
                changeCity(obj);
                break;
            case 'district':
                changeDistrcit(obj);
                break;

        }

        function changeCity(obj) {

            var form = obj.up('form');
            var cbDistrict = form.down('combo[name=district]');
            var cityId = form.down('combo[name=city]').getValue();
            var cbCommune = form.down('combo[name=commune]');

            if (cityId > 0) {
                var cityStore = cbDistrict.store;
                var communeStore = cbCommune.store;
                cityStore.proxy.extraParams.cityId = cityId;
                cityStore.load();
                cbDistrict.setValue("");
            }
        }

        function changeDistrcit(obj) {

            var form = obj.up('form');
            var cbCommune = form.down('combo[name=commune]');
            var cbDistrict = form.down('combo[name=district]');
            var districtId = cbDistrict.getValue();
            var communeStore = cbCommune.store;

            if (districtId > 0) {
                communeStore.proxy.extraParams.districtId = districtId;
                communeStore.load();
            }
        }
    },

    getStudentList: function(btn) {
        var winAdmission = btn.up('window');
        var win = Ext.create("ExtDesktop.view.module.admissionWU.WinStudent", {
            winAdmission: winAdmission
        });
        var store = win.down('grid').getStore();
        // win.down('grid').store.load();

        win.show();
        win.center();

    },
    loadRecordStudentToAdmissionForm: function(rec, winAdmission, grid) {

        var win = grid.up('window');
        win.close();

        var formStudentInfo = winAdmission.down('form[name=studnetInfo]').getForm();
        formStudentInfo.loadRecord(rec);

        var formPersonalInfo = winAdmission.down('form[name=personalInfo]');
        formPersonalInfo.getForm().loadRecord(rec);

        // load address filter

        this.changeAddress(formPersonalInfo.down('combo[name=city]'));
        var comboDistrict = formPersonalInfo.down('combo[name=district]');
        comboDistrict.setValue(rec.get('district'));
        var me = this;
        setTimeout(function() {
            me.changeAddress(comboDistrict);
        }, 100);

        // set image
        window.imageTmpComponent = winAdmission.down('image');
        window.imageTmpComponent.setSrc("resources/images/photo/" + rec.get("photoPath"));

        // stduent info to admissin form
        //winAdmission.down('form[name=education]').getForm().loadRecord(rec);
        //winAdmission.down('form[name=admissionInfo]').down('combo[name=studentCatId]').setValue(rec.get('studentCatId'));

        // filter level by course
        var combo = winAdmission.down('combo[name=tcLevel]');

        combo.store.proxy.extraParams.courseId = rec.get('courseId');
        combo.store.load();

        // set student id
        winAdmission.down('hiddenfield[name=studentId]').setValue(rec.get('id'));
        winAdmission.down('textarea[name=note]').setValue(rec.get('note'));
    },

    showPage: function(viewe) {

        var win = Ext.create('ExtDesktop.view.module.admissionWU.WinAdmission');
        var me = this;

        // Util.loadStoreInController('Admission');
        win.show();
        win.down("textfield[name=first_name]").focus(true, 300);

    }


});
