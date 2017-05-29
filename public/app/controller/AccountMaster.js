Ext.define('ExtDesktop.controller.AccountMaster', {
    extend: 'Ext.app.Controller',
    stores: [
        'sdn.Student',
        "acc.AccountDetail",
        'combo.KeyAccount',
        'combo.CreditControl',
        "combo.CycleType",
        "combo.Admission",
        "combo.Batch",
        "combo.TuitionTime",
        "combo.Term",
        "combo.FeeCatDetailTC",
        "combo.FeeCatDetailWU",
        "combo.ChargeItem",
        "combo.Tax",

        "acc.AccountMaster",
        "combo.DiscountItem",
        "combo.DiscountItemDetail",
        "acc.Invoice",
        "acc.InvoiceDetail",
        "combo.GroupAccount"
    ],
    views: [
        'module.accountMaster.Index',
        'module.accountMaster.WinAccount',
        'module.accountMaster.FmAccountInfo',
        'module.accountMaster.GridAccountDetail',
        'module.accountMaster.WinDiscount',
        "module.accountMaster.WinAdhocCharge",
        "module.accountMaster.WinTax",

        "module.accountMaster.WinFeePlanTC",
        "module.accountMaster.GridInvoice",
        "module.accountMaster.WinInvoice",
        "module.accountMaster.FmInvoice"
    ],
    refs: [

    ],
    init: function(app) {

        this.control({
            'AccountMaster button[action=Add]': {
                click: this.showWinAccountNew
            },
            'AccountMaster button[action=Edit]': {
                click: this.showWinAccountEdit
            },

            "AccountMaster button[action=SelectStudent]": {
                click: this.showStudentlist
            },
            "AccountMaster button[action=Populate]": {
                click: this.populateStudent
            },


            // event on student detail list 

            "accountMasterWinStudent textfield[name=Search]": {
                change: this.filterStudent
            },
            "accountMasterWinStudent button[action=OK]": {
                click: this.loadStudent
            },
            "accountMasterWinStudent grid": {
                itemdblclick: this.loadStudentRecordToForm
            },

            // === event on account maintenance 
            "FmAccountInfo combo[name=admission_id]": {
                change: this.loadDegreeAndCourse
            },
            "FmAccountInfo combo[name=batch_id]": {
                change: this.loadPlanDetailWU
            },
            "FmAccountInfo combo[name=term_id]": {
                change: this.loadPlanDetailTC
            },
            "FmAccountInfo combo[name=tuition_time_id]": {
                change: this.loadPlanDetailTC
            },
            "FmAccountInfo combo[name=cycle_type_id]": {
                change: this.loadPlanDetailWU
            },
            "FmAccountInfo combo[name=fee_plan_detail_id]": {
                select: this.setFeeAmount
            },
            "WinAccount button[action=Save]": {
                click: this.saveAccountMaintain
            },

            "WinAccount button[action=Close]": {
                click: this.closeAccount
            },

            "WinAccount button[action=Lock]": {
                click: this.lockAccount
            },

            //== event on account grid detail
            "GridAccountDetail button[action=AddDiscount]": {
                click: this.showFormDiscount
            },
            "GridAccountDetail button[action=AdhocCharge]": {
                click: this.showAdhocCharge
            },
            "GridAccountDetail button[action=AddTax]": {
                click: this.showFormAddTax
            },
            "GridAccountDetail button[action=Delete]": {
                click: this.deleteAccountDetail
            },
            //===== even on window discount 
            "accountMasterWinDiscount combo[name=discount_item]": {
                select: this.filterDiscountDetail
            },
            "accountMasterWinDiscount combo[name=item_id]": {
                select: this.setDiscountFieldVisible
            },
            "accountMasterWinDiscount button[action=Save]": {
                click: this.saveAccountDetail
            },

            "accountMasterWinDiscount checkbox[name=is_recurring]": {
                change: this.setFieldRecuringValueVisible
            },

            //== even on adhoc charge
            "accountMasterWinAdhocCharge checkbox[name=is_recurring]": {
                change: this.setFieldRecuringValueVisible
            },
            "accountMasterWinAdhocCharge button[action=Save]": {
                click: this.saveAccountDetail
            },
            "accountMasterWinAdhocCharge combo[name=item_id]": {
                select: this.setAdhocChargeValue
            },
            //== even on tax 
            "accountMasterWinTax combo[name=item_id]": {
                select: this.setTaxValue
            },
            "accountMasterWinTax checkbox[name=is_recurring]": {
                change: this.setFieldRecuringValueVisible
            },
            "accountMasterWinTax button[action=Save]": {
                click: this.saveAccountDetail
            },
            "GridInvoice button[action=GenerateInvoice]":{
                click : this.showFormGenerateInvoice
            },
            "GridInvoice button[action=Print]":{
                click : this.printInvoice
            },
            // ========== win invoice 
            "accountMasterWinInvoice button[action=Save]":{
                click : this.saveInvoice
            }

        });



    },
    tmpMainForm: null,
    tmpCourseId: null,
    printInvoice:function(btn){
        var rec = Util.getRecord(btn , "Please select invoice for print");
        if (rec) {
            window.open("AccInvoices/print_invoice?id="+rec.get("id"));
        }
    },
    saveInvoice:function(btn){
        var store = this.getAccInvoiceStore(); 
        Util.save(btn , store , "acc.Invoice");
        
    },
    showFormGenerateInvoice:function(btn){
        // ==== start ajax get data invoice 
        var me = this ;
        var record = btn.up("window").down("FmAccountInfo").getForm().getRecord();
        Util.ajax("/AccAccountMasters/get_simulate_data_invoice" ,{ account_id :record.get("id") } , this.afterAjaxReqeust );
    },
    afterAjaxReqeust:function(data ){
        
        var win = Ext.create("ExtDesktop.view.module.accountMaster.WinInvoice");
        win.show();
        win.center();
        win.down("textfield[name=invoice_no]").setValue(data.invoice_no);
        win.down("textfield[name=invoice_type]").setValue(data.invoice_type);
        win.down("numberfield[name=total_amount]").setValue(data.data.total_amount);
        win.down("hiddenfield[name=account_id]").setValue(data.account_id);
        win.down("datefield[name=from_date]").focus(true , 100);

        var itemList = data.data.item_list;
        var store = win.down("grid").getStore();
        store.removeAll();
        itemList.forEach(function(rec){
            
            var model = Ext.create("ExtDesktop.model.acc.InvoiceDetail",rec);
            store.add(model);
        
        })
    },
    lockAccount: function(btn) {
        var win = btn.up("window");
        var rec = win.down("FmAccountInfo").getForm().getRecord();
        var store = this.getAccAccountMasterStore();
        Ext.MessageBox.confirm('Confirm', 'Are you sure to lock this account?', function(btn) {
            if (btn == 'yes') {
                rec.set("status", "S");
                Util.storeSync(store, win);
            }
        });

    },
    closeAccount: function(btn) {
        var win = btn.up("window");
        var rec = win.down("FmAccountInfo").getForm().getRecord();
        var store = this.getAccAccountMasterStore();
        Ext.MessageBox.confirm('Confirm', 'Are you sure to close this account?', function(btn) {
            if (btn == 'yes') {
                rec.set("status", "C");
                Util.storeSync(store, win);
            }
        });

    },
    saveAccountMaintain: function(btn) {

        var win = btn.up("window");
        var form = win.down("FmAccountInfo");

        if (form.getForm().isValid()) {
            var values = form.getForm().getValues();
            var rec = form.getForm().getRecord();
            var model = Ext.create("ExtDesktop.model.acc.AccountMaster");
            var store = this.getAccAccountMasterStore();
            // get account detail 
            var accountDetailStore = this.getAccAccountDetailStore();

            values["acc_account_detail_attributes"] = Util.getItemStore(accountDetailStore);

            if (rec) {
                rec.set(values);
            } else {
                model.set(values);
                store.add(model);
            }
            Util.storeSync(store, win);

        } else {
            Util.msg("Data entry is incorrected");
        }
    },
    deleteAccountDetail: function(btn) {
        var record = Util.getRecord(btn, "Please select account detail for delete");
        var store = btn.up("grid").getStore();
        if (record) {
            if (record.get("id") > 0) {
                Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this account detail?', function(btn) {
                    if (btn == 'yes') {
                        record.set("is_deleted", true);
                    }
                });
            } else {
                store.remove(record);
            }
        }
    },
    setTaxValue: function(field, records) {
        var rec = records[0];
        var win = field.up("window");
        win.down("numberfield[name=item_value]").setValue(Number(rec.get("tax_rate")));


    },
    setAdhocChargeValue: function(field, records) {
        var rec = records[0];
        var win = field.up("window");
        if (rec.get("is_editable")) {
            win.down("numberfield[name=item_value]").setReadOnly(false);
        } else {
            win.down("numberfield[name=item_value]").setReadOnly(true);
        }
        win.down("numberfield[name=item_value]").setValue(rec.get("charge_amount"));


    },
    setFieldRecuringValueVisible: function(field, value) {
        var itemValueField = field.up("form").down("numberfield[name=recurring_val]");
        itemValueField.setDisabled(!value);

    },
    saveAccountDetail: function(btn) {
        var store = this.getAccAccountDetailStore();
        var model = Ext.create("ExtDesktop.model.acc.AccountDetail");
        var win = btn.up("window");
        var form = win.down("form");
        if (form.getForm().isValid()) {
            var values = form.getForm().getValues();
            model.set(values);
            model.set("is_deleted",false );
            model.set("item_name", form.down("combo[name=item_id]").getRawValue())

            store.add(model);
            win.close();
        } else {
            Util.msg("Data entry is incorrect , please check data entry");
        }
    },
    setDiscountFieldVisible: function(field, records) {
        var rec = records[0];
        var win = field.up("window");
        var unitName = rec.get("discount_unit") == "P" ? "Percentag" : "Amount";
        if (rec.get("is_allow_edit")) {
            win.down("numberfield[name=item_value]").setReadOnly(false);
        } else {
            win.down("numberfield[name=item_value]").setReadOnly(true);
        }

        win.down("hiddenfield[name=item_unit]").setValue(rec.get("discount_unit"));
        win.down("textfield[name=item_unit_name]").setValue(unitName);
        win.down("numberfield[name=item_value]").setValue(rec.get("discount_value"));
    },
    filterDiscountDetail: function(field) {
        var storeDetail = this.getComboDiscountItemDetailStore();
        var discount_id = field.getValue();
        var me = this;

        storeDetail.load({
            params: {
                id: discount_id
            }
        });

    },
    showFormAddTax: function() {

        var win = Ext.create('ExtDesktop.view.module.accountMaster.WinTax');
        win.show();
        win.center();
    },
    showAdhocCharge: function() {
        var win = Ext.create('ExtDesktop.view.module.accountMaster.WinAdhocCharge');
        win.show();
        win.center();
    },
    showFormDiscount: function(btn) {
        var course_id = btn.up("window").down("hiddenfield[name=course_id]").getValue();
        var store = this.getComboDiscountItemStore();
        store.load({
            params: {
                course_id: course_id
            }
        });
        var win = Ext.create('ExtDesktop.view.module.accountMaster.WinDiscount');
        win.show();
        win.center();
    },
    setFeeAmount: function(field, records) {
        var rec = records[0];
        var form = field.up("form");
        form.down("textfield[name=fee_per_cycle]").setValue(rec.get("fee_amount"));
    },

    loadPlanDetailWU: function(field) {
        var store = this.getComboFeeCatDetailWUStore();
        var win = field.up("window");

        var params = {
            degree_id: win.down("hiddenfield[name=degree_id]").getValue(),
            course_id: win.down("hiddenfield[name=course_id]").getValue(),
            cycle_type_id: win.down("combo[name=cycle_type_id]").getValue(),
            batch_id: win.down("combo[name=batch_id]").getValue()
        };
        store.load({
            params: params
        });

    },
    loadPlanDetailTC: function(field) {
        var store = this.getComboFeeCatDetailTCStore();
        var win = field.up("window");

        var params = {
            degree_id: win.down("hiddenfield[name=degree_id]").getValue(),
            course_id: win.down("hiddenfield[name=course_id]").getValue(),
            term_id: win.down("combo[name=term_id]").getValue(),
            tuition_time_id: win.down("combo[name=tuition_time_id]").getValue()
        };
        store.load({
            params: params
        });

    },
    loadDegreeAndCourse: function(field) {
        var store = this.getComboAdmissionStore();
        var value = field.getValue();
        var rec = store.getById(value);
        var form = field.up("form");
        this.tmpCourseId = rec.get("course_id");
        this.toggleFieldWuAndTcForm(rec, form);
        this.setValueToFormWuAndTcForm(rec, form);
        form.down("textfield[name=degree_name]").setValue(rec.get("degree_name"));
        form.down("textfield[name=course_name]").setValue(rec.get("course_name"));

    },
    setValueToFormWuAndTcForm: function(rec, form) {
        var win = form.up("window");
        win.down("hiddenfield[name=degree_id]").setValue(rec.get("degree_id"));
        win.down("hiddenfield[name=course_id]").setValue(rec.get("course_id"));
        if (rec.get("term_id") > 0) { // TC admission
            win.down("combo[name=term_id]").setValue(rec.get("term_id"));
            win.down("combo[name=tuition_time_id]").setValue(rec.get("tuition_time_id"));

            win.down("combo[itemName=fee_plan_wu]").hide();
            win.down("combo[itemName=fee_plan_wu]").setDisabled(true);

            win.down("combo[itemName=fee_plan_tc]").show();
            win.down("combo[itemName=fee_plan_tc]").setDisabled(false);

            win.down("combo[name=batch_id]").setDisabled(true);
            win.down("combo[name=cycle_type_id]").setDisabled(true);
            win.down("combo[name=tuition_time_id]").setDisabled(false);
            win.down("combo[name=term_id]").setDisabled(false);

        } else { // WU admission
            win.down("combo[name=batch_id]").setValue(rec.get("batch_id"));

            win.down("combo[itemName=fee_plan_wu]").show();
            win.down("combo[itemName=fee_plan_wu]").setDisabled(false);

            win.down("combo[itemName=fee_plan_tc]").hide();
            win.down("combo[itemName=fee_plan_tc]").setDisabled(true);

            win.down("combo[name=batch_id]").setDisabled(false);
            win.down("combo[name=cycle_type_id]").setDisabled(false);
            win.down("combo[name=tuition_time_id]").setDisabled(true);
            win.down("combo[name=term_id]").setDisabled(true);

        }
    },
    toggleFieldWuAndTcForm: function(rec, form) {
        var win = form.up("window");
        var batchField = win.down("combo[name=batch_id]");
        var cycleTypeField = win.down("combo[name=cycle_type_id]");
        var termField = win.down("combo[name=term_id]");
        var tuitionTimeField = win.down("combo[name=tuition_time_id]");
        //  check condition on tc or wu admission record
        if (rec.get("term_id") > 0) { // TC admission
            batchField.hide();
            cycleTypeField.hide();
            termField.show();
            tuitionTimeField.show();
        } else { // WU admission
            batchField.show();
            cycleTypeField.show();
            termField.hide();
            tuitionTimeField.hide();
        }

    },
    loadStudentRecordToForm: function(grid, rec) {
        var btn = grid.up("window").down('button[action=OK]');
        this.loadStudent(btn);
    },
    populateStudent: function(btn) {
        var form = btn.up("form");
        var studentId = form.down("hiddenfield[name=id]").getValue();
        if (studentId > 0) {

            var me = this;
            var store = this.getAccAccountMasterStore();
            store.proxy.extraParams.student_id = studentId;
            store.load();

            Util.ajax("/SdnStudent/get_student", {
                student_id: studentId
            }, me.afterAjaxPopulate, form);
        } else {
            Util.msg("Please select student for populate");
        }

    },
    afterAjaxPopulate: function(obj, form) {
        var model = Ext.create("ExtDesktop.model.sdn.Student");
        model.set(obj.data);
        form.getForm().loadRecord(model);

    },
    loadStudent: function(btn) {
        var win = btn.up("window");
        var textField = win.down("textfield[name=Search]");
        var rec = Util.getRecord(textField, "Please select student for load account master");
        if (rec) {
            win.close();
            this.tmpMainForm.down("textfield[name=student_no]").setValue(rec.get("student_no"));
            this.tmpMainForm.down("hiddenfield[name=id]").setValue(rec.get("id"));

        }
    },
    filterStudent: function(field, value) {
        var store = field.up("grid").getStore();
        Util.loadStore(store, {
            string: value
        });
    },
    showStudentlist: function(btn) {
        this.tmpMainForm = btn.up("form");
        var win = Ext.create("ExtDesktop.view.module.accountMaster.Winstudent");
        win.show();
        win.center();
    },
    showWinAccountNew: function(btn) {
        var studentId = btn.up("AccountMaster").down("hiddenfield[name=id]").getValue();

        if (studentId > 0) {
            var win = Ext.create('ExtDesktop.view.module.accountMaster.WinAccount');
            var rec = btn.up("AccountMaster").down("form").getRecord();

            win.show();
            win.center();
            //  set value to form academic information

            win.down("form[name=AcademicInfo]").loadRecord(rec);
            win.down("hiddenfield[name=student_id]").setValue(rec.get("id"));
            win.down("textfield[name=name]").setValue(rec.get("first_name") + " " + rec.get("last_name"));
            this.getAccAccountDetailStore().removeAll();
            this.getComboAdmissionStore().load({
                params: {
                    student_id: rec.get("id")
                }
            });
        } else {
            Util.msg("Please select student before add account");
        }


    },
    showWinAccountEdit: function(btn) {
        var rec = Util.getRecord(btn, "Please select admission for edit");

        if (rec) {
            var win = Ext.create('ExtDesktop.view.module.accountMaster.WinAccount');

            win.show();
            win.center();
            win.down("button[action=Close]").setDisabled(false);
            win.down("button[action=Lock]").setDisabled(false);
            //  set value to form academic information

            this.getComboAdmissionStore().load({
                params: {
                    student_id: rec.get("student_id")
                }
            });

            var winStudent = btn.up("window");
            var fristName = winStudent.down("textfield[name=first_name]").getValue();
            var lastName = winStudent.down("textfield[name=last_name]").getValue();
            var studentNo = winStudent.down("textfield[name=student_no]").getValue();

            win.down("FmAccountInfo").loadRecord(rec);
            win.down("hiddenfield[name=student_id]").setValue(rec.get("student_id"));
            win.down("textfield[name=name]").setValue(fristName + " " + lastName);
            win.down("textfield[name=student_no]").setValue(studentNo);

            win.down("combo[name=admission_id]").setValue(rec.get("admission_id"));
            win.down("combo[itemName=fee_plan_wu]").setValue(rec.get("cycle_type_id"));
            win.down("combo[itemName=fee_plan_tc]").setValue(rec.get("cycle_type_id"));

            this.getAccAccountDetailStore().load({
                params: {
                    account_id: rec.get("id")
                }
            });
            var store = this.getAccInvoiceStore(); 
            store.proxy.extraParams.account_id = rec.get("id"); 
            store.load();
        } else {
            Util.msg("Please select student before add account");
        }


    },

});