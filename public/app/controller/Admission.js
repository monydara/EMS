Ext.define('ExtDesktop.controller.Admission', {
    extend: 'Ext.app.Controller',
    stores: [     
        'AcademicYear',
        'admission.Admission',
        'sdn.Document',
        'sdn.Lead',

        'Ethnicity',
        'Langauge',
        'Nationality',
        'Occupation',
        'lookup.CmbReligion',
        'StudentCategory',
        'combo.CourseTC',
        'combo.DegreeTC',
        'combo.Major',
        'combo.Term',
        'combo.TuitionTime',
        'combo.CourseLevel',
        'StudentCategory',
        'combo.ClassShift',
        'combo.AcademicYear',
        'combo.DocumentType',
        'combo.Batch',
        'admission.Student',
        'combo.CityState'
    ],
    views: [
        'module.admission.WinAdmission',
        'module.admission.Index',
        'module.admission.FmFamilyContact',
        'module.admission.FmEmergencyContact',
        'module.admission.WinStudent',
        'module.admission.WinDocument',
    ],
    init: function(app) {

        this.control({
            'admissionGrid button[action=Add]': {
                click: this.showPage
            },
            'admissionGrid button[action=ActiveAdmission]':{
                click : this.activeStudent
            },
            'admissionGrid button[action=Cancel]':{
                click : this.cancelStudent
            },

            'admissionGrid button[action=Edit]': {
                click: this.showPageEdit
            },
            "admissionGrid button[action=Copy]": {
                click: this.createCopy
            },
            "admissionGrid textfield[name=filter]": {
                change: this.search
            },

            'WinAddmission button[action=BrowseRegistration]': {
                click: this.BrowseRegistration
            },
            'WinAddmission button[action=studentAdmission]': {
                click: this.getStudentList
            },
            'WinStudentAdmission textfield[name=search]': {
                change: this.loadGridStudentBySearch
            },
            'WinAddmission filefield': {
                change: this.uploadTempImage
            },
            'WinAddmission combo[name=city]': {
                select: this.changeAddress
            },
            'WinAddmission combo[name=degree_id]': {
                select: this.filterCourse
            },


            'WinAddmission button[action=Cancel]': {
                click: this.closeWindow
            },
            'WinAddmission button[action=Save]': {
                click: this.save
            },


            // -----------  new event
            'WinAddmission button[action=SaveClose]': {
                click: this.save
            },
            'WinAddmission combo[name=course_id]': {
                change: this.filterMajor
            },
            'WinAddmission button[action=AddDocument]': {
                click: this.showFormDocument
            },

            //------------- action on document
            'WinDocument button[action=Cancel]': {
                click: this.closeWindow
            },
            'WinDocument button[action=Save]': {
                click: this.saveDocument
            },



            'winAdditionalFee button[action=Cancel]': {
                click: this.closeWindow
            },
            // ----------- add registation to form
            'WinStudentAdmission grid': {
                itemdblclick: this.loadRegistrationToForm
            }


        });

    },

    formAdmission: null,


    search:function(field, value){
        store = field.up('grid').getStore()
        Util.loadStore(store , { text:value , type:'TC'} )
    },
    loadRegistrationToForm: function(dv, record, item, index, e) {
        var me = this;
        if (me.formAdmission) {
            dv.up("grid").getStore().proxy.extraParams = null ;
           // console.log(record.data);
            this.getComboCourseTCStore().load({
                params:{
                    degree_id: record.get('degree_id')
                }
            });

            var store = this.getComboMajorStore();
            store.load({
                params: {
                            course_id: record.get('course_id')
                }
            });

            me.formAdmission.down('form').getForm().setValues(record.data);
            me.formAdmission.down('image').setSrc(record.get("photo_path").replace("/", ""));
            me.formAdmission.down('hiddenfield[name=image_url]').setValue(record.get("photo_path").replace("/", ""));
            me.formAdmission.down('hiddenfield[name=lead_id]').setValue(record.get("id"));
            dv.up('window').close();
        };
    },
    BrowseRegistration: function(btn) {
        var form = btn.up("window");
        this.formAdmission = form;
        var win = Ext.create('ExtDesktop.view.module.admission.WinStudent');
        win.show();
        win.center();
    },
    cancelStudent: function(btn) {

        var record =Util.getRecord(btn , "Please select admission for cancel");
        var grid = btn.up("grid");
        var me = this;
        if (record.get("status") == "N") {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to Cancel this student?', function(btn) {
                if (btn == 'yes') {
                    Ext.MessageBox.wait("Please Wait System Processing ....", "Cancel Student");
                    Util.ajax("/SdnStudent/cancel_student", {
                        admission_id: record.get("id")
                    }, me.afterAtiveStudent, grid);
                }
            })
        } else {
            Util.msg("Student can active in status New Only");
        };


    },
    activeStudent: function(btn, rowIndex) {

        var record =Util.getRecord(btn,"Please Select Admission for Active")
        var me = this;
        if (record.get("status") == "N") {
            var grid = btn.up("grid");
            Ext.MessageBox.confirm('Confirm', 'Are you sure to Activate this record?', function(btn) {
                if (btn == 'yes') {
                    Ext.MessageBox.wait("Please Wait System Processing ....", "Active Student");
                    Util.ajax("/SdnStudent/active_student", {
                        admission_id: record.get("id")
                    }, me.afterAtiveStudent,grid );
                }
            })
        } else {
            Util.msg("Student can active in status New Only");
        };


    },
    afterAtiveStudent: function(obj, grid) {
        Ext.MessageBox.hide();
        grid.getStore().load();
    },
    showPageEdit: function(btn) {
        var me = this;
        var grid = btn.up("gridpanel");
        var row = grid.getSelectionModel().getSelection();

        if (row.length) {
            var win = Ext.create("ExtDesktop.view.module.admission.WinAdmission");

            var form = win.down('form');
            var record = row[0];

            if (record.get("status") == "N") {

                // load contact information
                form.loadRecord(record);

                form.down("image").setSrc(record.get("image_url"));

                win.down("button[action=BrowseRegistration]").hide();


                me.getSdnDocumentStore().load({
                    params: {
                        admission_id: record.get("id")
                    }
                });

                Util.ajax("/SdnAdmission/get_student_contact", {
                    admission_id: record.get("id")
                }, me.setFormContact, win);
                // filter course
                win.show();
                win.center();
            }else{
                Util.msg("This student can edit in status <b> New </b> only", btn);
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
                        if (win.down("form[name=emergency]")) {
                            win.down("form[name=emergency]").getForm().setValues(rec);
                               debugger;
                        };

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

            var win = Ext.create('ExtDesktop.view.module.admission.WinAdmission');
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
        // win.down("combo[name=batch_id]").setValue(record.get("batch_id"));
        win.down("combo[name=degree_id]").setValue(record.get("degree_id"));
        win.down("combo[name=course_id]").setValue(record.get("course_id"));
        win.down("combo[name=term_id]").setValue(record.get("term_id"));
        win.down("combo[name=major_id]").setValue(record.get("major_id"));
        win.down("combo[name=tuition_time_id]").setValue(record.get("tuition_time_id"));
        win.down("datefield[name=admission_date]").setValue(record.get("admission_date"));
        win.down("combo[name=class_shift_id]").setValue(record.get("class_shift_id"));
        win.down("combo[name=admission_type]").setValue(record.get("admission_type"));
        win.down("combo[name=s_level_id]").setValue(record.get("s_level_id"));
        win.down("combo[name=start_acd_year_id]").setValue(record.get("start_acd_year_id"));


    },
    setValuePriceToPrice: function(field, obj) {
        var rec = obj[0];
        var form = field.up('form'),
            chargeField = form.down('numberfield[name=charge_amount]');
        chargeField.setValue(rec.get('charge_amount'));
    },
    showFormAdditionalForm: function(btn) {

        var win = Ext.create("ExtDesktop.view.module.admission.WinAdditionalFee");
        win.show();
        win.center();
    },
    calculateNetFee: function(btn) {

        var win = btn.up('window'),
            netFeeField = win.down('numberfield[name=net_cycle_fee]');
        var netFeeValue = netFeeField.getValue();
        var totalCharge = netFeeValue;

        if (netFeeValue > 0) {
            var discountStore = this.getSdnDiscountItemStore();

            discountStore.each(function(rec) {

                var discountAmount = rec.get('discount_amount');
                if (discountAmount > 0 && rec.get('is_del') != true) {
                    totalCharge = totalCharge - discountAmount;
                } else if (rec.get('is_del') != true) {

                    discountAmount = netFeeValue * rec.get('discount_p') / 100;
                    rec.set('discount_amount', discountAmount);
                    totalCharge = totalCharge - discountAmount;
                }


            });

            var storeAdditionalCharge = this.getSdnAdditionalFeeStore();
            storeAdditionalCharge.each(function(rec) {
                if (rec.get("is_del") != true) {
                    var additionalAmount = rec.get("charge_amount");
                    totalCharge = totalCharge + (additionalAmount * 1);
                };

            });
            var dipositAmount = win.down("numberfield[name=deposit_fee]").getValue();

            win.down("numberfield[name=total_fee]").setValue(totalCharge - dipositAmount);


        } else {
            Ext.Msg.alert("Inform", 'Please Select Fee Charge');
        };
    },



    removeDocument: function(grid, rowIndex) {
        var store = grid.getStore();
        var rec = store.getAt(rowIndex);
        Ext.MessageBox.confirm('Confirm', 'Are you sure to Delete?', function(btn) {
            if (btn == 'yes') {
                if (rec.id > 0) {
                    rec.set("is_del",true)
                }else{
                    store.remove(rec)
                }

                Ext.Msg.alert("Deleted", 'Record Has Been Deleted.');
            }
        });


    },
    saveDocument: function(btn) {
        var win = btn.up('window'),
            form = win.down('form').getForm(),
            value = form.getValues();

        if (form.isValid()) {
            var store = this.getSdnDocumentStore();
            var model = Ext.create('ExtDesktop.model.sdn.Document');

            Ext.MessageBox.show({
                msg: 'File is uploading, please wait...',
                progressText: 'Uploading...',
                width: 300,
                wait: true,
            });
            form.submit({
                url:'/UploadFile/upload',
                success: function(r, obj) {
                    Ext.MessageBox.hide();
                    var objReturn = Ext.decode(obj.response.responseText);
                    file_url = objReturn.file_url.replace("/", "")
                    value.file_path = file_url
                    value.is_del = false
                    value.doc_type = win.down('combo[name=doc_type_id]').getRawValue()
                    model.set(value)
                    store.add(model)
                    win.close()

                },
                failure: function(form, obj) {
                    Ext.MessageBox.hide();
                    var objReturn = Ext.decode(obj.response.responseText).error;
                    Ext.Msg.alert('Fiald', 'System not support with this file');
                }
            });
        } else {
            Ext.Msg.alert('Warning', 'Please Entry Require Field');
        };

    },
    showFormDocument: function() {
        var win = Ext.create('ExtDesktop.view.module.admission.WinDocument');
        win.show();
        win.center();
    },
    filterMajor: function(field, value) {
        var store = this.getComboMajorStore();
        store.load({
            params: {
                course_id: value
            }
        });

        var storeCourseLevel = this.getComboCourseLevelStore();
        storeCourseLevel.load({
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
        if (mainForm.getForm().isValid() == false){
            Ext.MessageBox.hide();
            Util.msg('Please Entry Require Field ', btn);
            return 0;
        }

        // personal contact
        var sdnInfoValues = win.down('form[name=sdnInfo]').getValues();
        var personalValues = win.down('form[name=personalInfo]').getValues();
        var academicValues = win.down('form[name=academic]').getValues();
        var emergencyValues = win.down('form[name=emergency]').getValues();
        var fatherValues = win.down('form[name=father]').getValues();
        var motherValues = win.down('form[name=mother]').getValues();
        // var accountingValues = win.down('form[name=feeCharge]').getValues();
        // var discountList = me.getSdnDiscountItemStore().data.items;
        // discountList = Ext.JSON.decode(Ext.encode(Ext.pluck(discountList, 'data')));
        // var feeList = me.getSdnAdditionalFeeStore().data.items;
        // feeList = Ext.JSON.decode(Ext.encode(Ext.pluck(feeList, 'data')));

        var studentModel = Ext.create('ExtDesktop.model.Student');
        studentModel.set(personalValues);
        studentModel.set(sdnInfoValues);
        studentModel.set("sdn_document_attributes" ,Util.getItemStore(this.getSdnDocumentStore()) )
        studentModel.set("note", win.down("textarea[name=note]").getValue());
        studentModel.set('image_url', win.down("hiddenfield[name=image_url]").getValue())
        var emergencyModel = Ext.create("ExtDesktop.model.Contact");
        emergencyModel.set(emergencyValues);

        var fatherModel = Ext.create("ExtDesktop.model.Contact");
        fatherModel.set(fatherValues);

        var motherModel = Ext.create("ExtDesktop.model.Contact");
        motherModel.set(motherValues);

        var admissionModel = Ext.create("ExtDesktop.model.admission.Admission");
        admissionModel.set(academicValues);


        var store = Ext.create("ExtDesktop.store.admission.Student");
        var model = Ext.create("ExtDesktop.model.admission.Student", {

            studentModel: studentModel.data,
            emergencyModel: emergencyModel.data,
            fatherModel: fatherModel.data,
            motherModel: motherModel.data,
            admissionModel: admissionModel.data,
            // feeChargeModel: feeChargeModel.data,
            type: 'TC'

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
                me.getAdmissionAdmissionStore().load();

                if (btn.action == "SaveClose") {
                    var newWin = Ext.create('ExtDesktop.view.module.admission.WinAdmission');

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
        //    	win.close();
        win.down('form').getForm().reset();
    },
    closeWindow: function(btn) {
        btn.up('window').close();
    },
    setVat: function(field, value) {

        var form = field.up('form');
        form.down('textfield[name=vat_number]').setDisabled(!value);
    },
    filterLevel: function(field, obj) {
        var rec = obj[0].data;
        var combo = field.up('window').down('combo[name=tcLevel]');

        combo.store.proxy.extraParams.courseId = rec.courseId;

        combo.store.load();
        combo.setValue('');

    },
    filterCourse: function(field, record) {
        if (record) {
            var rec = record[0];
            field.up('form').down('combo[name=course_id]').setValue('');

            var id =rec.get('id');
            this.getComboCourseTCStore().load({
                params:{
                    degree_id: id
                }
            });

        }

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
        var win = Ext.create("ExtDesktop.view.module.admission.WinStudent", {
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
        winAdmission.down('form[name=education]').getForm().loadRecord(rec);
        winAdmission.down('form[name=admissionInfo]').down('combo[name=studentCatId]').setValue(rec.get('studentCatId'));

        // filter level by course
        var combo = winAdmission.down('combo[name=tcLevel]');

        combo.store.proxy.extraParams.courseId = rec.get('courseId');
        combo.store.load();

        // set student id
        winAdmission.down('hiddenfield[name=studentId]').setValue(rec.get('id'));
        winAdmission.down('textarea[name=note]').setValue(rec.get('note'));
    },
    showPage: function(viewe) {

        var win = Ext.create('ExtDesktop.view.module.admission.WinAdmission');
        var me = this;
        this.getSdnDocumentStore().removeAll();
        // Util.loadStoreInController('Admission');
        win.show();
        win.down("textfield[name=first_name]").focus(true, 300);

    },


});
