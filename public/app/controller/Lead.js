Ext.define('ExtDesktop.controller.Lead', {
    extend: 'Ext.app.Controller',
    stores:[
        'sdn.Lead',
        'acc.PaymentMethodS',
        'combo.Course',
        'combo.DegreeTC',
        'combo.CourseTC',
        'combo.ClassShift',
        'combo.Degree'
    ],
    views: [
        'module.lead.Index',
        'module.lead.Win',
        'module.lead.WinDeposit',
        'module.lead.WinAdvanceSearch',

    ],
    init: function(app) {
        this.control({
            'GridLead button[action=Create]':{
                click : this.showForm
            },
            'GridLead button[action=Copy]':{
                click : this.showFormCopy
            },
            'GridLead button[action=Edit]':{
                click : this.edit
            },
            'GridLead button[action=Cancel]':{
                click : Util.deleteRecord
            },
             'GridLead button[action=Deposit]':{
                click : this.showDepositForm
            },


            'WinLead button[action=Save]':{
                click : this.save
            },
            'WinLead button[action=SaveAndNew]':{
                click : this.saveAndNew
            },
            'WinLead button[action=Cancel]':{
                click : this.close
            },
            'WinLead filefield':{
                change: this.uploadTempImage
            },

            'WinLead combo[name=degree_id]':{
                change : this.filterCourses
            },
            'GridLead textfield[name=search]':{
                change : this.search
            },
            'GridLead button[action=showAdvanceSearch]':{
                click : this.showAdvanceSearch
            },

            'WinAdvanceSearch button[action=Close]':{
                click : this.closeForm
            },
            'WinAdvanceSearch button[action=Search]':{
                click : this.showWithAdvanceSearch
            },
            'WinAdvanceSearch combo[name=degree_id]':{
                select : this.filterCourse
            },


            // even on deposit form
            "WinDeposit checkbox[name=use_dollar]":{
                change: this.useCurrencyDollar
            },
            "WinDeposit checkbox[name=use_khr]":{
                change: this.useCurrencyKhmer
            },
            "WinDeposit button[action=Paid]":{
                click : this.paid
            },
            "WinDeposit button[action=PaidAndPrint]":{
                click : this.paidAndPrint
            },
            "WinDeposit button[action=Close]":{
                click : this.closeForm
            }

        });
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
    afterRollbackDeposit: function(obj, grid) {
        Ext.MessageBox.hide();
        grid.getStore().load();
    },

    rollbackDeposit:function(grid,rowIndex){
        var record = grid.getStore().getAt(rowIndex);
        var me = this;
        if (record.get("status") == "B") {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to rollback deposit?', function(btn) {
                if (btn == 'yes') {
                    Ext.MessageBox.wait("Please Wait System Processing ....", "Rollback Deposit");
                    Util.ajax("/acc_pre_payment/rollback", {
                        id: record.get("id")
                    }, me.afterRollbackDeposit, grid);
                }
            })
        }
    },

    paidAndPrint:function(btn){

        this.processPaid(btn,true)
    },
    paid:function(btn){
        this.processPaid(btn)

    },
    processPaid:function(btn , isPrint){
         win = btn.up('window')
        form = win.down('form')
        if (form.getForm().isValid() ) {
            values = form.getValues()
            me = this
            if (isPrint) {

               Util.ajax("/AccStudentAccount/deposit_on_lead_module",values ,me.closeFormPaid , { win : win , print:true} )
            }else{

               Util.ajax("/AccStudentAccount/deposit_on_lead_module",values ,me.closeFormPaid , { win : win } )

            };
            // win.close()
        }else{
            Util.msg("Pleaes entry correct data in form payment")

        };
    },
    closeFormPaid:function(obj , params ){
        params.win.close()
        if (params.print) {
            id = obj.finance_obj.id
            window.open("/AccReceipts/official_receipt_wu?id="+id)


        };
    },
    useCurrencyKhmer:function(field, value ){
         // disable field dollar
        if (value ) {
            win = field.up('window')
            checkboxDollar = win.down('checkbox[name=use_dollar]')
            fieldDollar = win.down('numberfield[name=usd_amount]')
            fieldReil = win.down('numberfield[name=khr_amount]')

            checkboxDollar.setValue(false)
            fieldDollar.setValue(0)
            fieldDollar.setDisabled(true)

            fieldReil.setDisabled(false)
            fieldReil.focus(true , 200 )
        };
    },
    useCurrencyDollar:function(field, value ){

        // disable field riel
        if (value ) {
            win = field.up('window')
            checkboxReil = win.down('checkbox[name=use_khr]')
            fieldReil = win.down('numberfield[name=khr_amount]')
            fieldDollar = win.down('numberfield[name=usd_amount]')
            checkboxReil.setValue(false)

            fieldReil.setValue(0)
            fieldReil.setDisabled(true)

            fieldDollar.setDisabled(false)
            fieldDollar.focus(true , 200)
        };
    },


    filterCourses:function(field ,value){
        if (value) {
            var rec = this.getComboDegreeStore().getAt(value-1);
            var params= {};
            if (rec.get("degree_type") == "TC") {
                params.degree_id = rec.get('id');
                params.type = "TC";
            }else{
                params.type = "WU";
                params.degree_id = rec.get('id');
            };
            this.getComboCourseStore().load({
                params:params
            });
        };
    },

    filterCourse:function(field, record){
        var rec = record[0];
        var type = rec.get('degree_type');
        if (type == "TC") {
            this.getComboCourseTCStore().load({
                params:{
                    id: rec.get('id')
                }
            });
        } else{// when filter course by degree = WU
            this.getComboCourseTCStore().load({
                params:{
                    type:type,
                    id: rec.get('id')
                }
            });
        };


    },
    showWithAdvanceSearch:function(btn){
        var form = btn.up('window').down('form');
        var values = form.getValues();
        var obj ={};
        var store = this.getSdnLeadStore();
        if (values.class_shift_id) {
            obj.class_shift_id = values.class_shift_id;
        }
        if (values.course_id) {
            obj.course_id = values.course_id ;
        };
        if (values.degree_id) {
            obj.degree_id = values.degree_id;
        };
        if (values.end_date) {
            obj.end_date = values.end_date ;
            obj.start_date = values.start_date ;
        };
        if (values.status) {
            obj.status = values.status;
        };

        Util.loadStore(store, obj);
    },
    closeForm: function(btn){
        var win = btn.up('window');
        win.close();
    },

    showDepositForm:function(btn){
        rec = Util.getRecord(btn , "Please select student for make deposit")
        if (rec) {
            var win = Ext.create("ExtDesktop.view.module.lead.WinDeposit");

            win.down('form').getForm().loadRecord(rec)
            win.down('hiddenfield[name=lead_id]').setValue(rec.get('id'))
            win.down('textfield[name=student_name]').setValue( rec.get('first_name') +" " + rec.get('last_name'))
            win.show();
            win.down("numberfield[name=usd_amount]").focus(true , 200 )

        };

    },
    showAdvanceSearch:function(btn){
        var win = Ext.create("ExtDesktop.view.module.lead.WinAdvanceSearch");
        win.show();

    },
    search:function(field,value){
        var store = this.getSdnLeadStore();
        Util.loadStore(store, {string : value});

    },
    close:function(btn){
        btn.up('window').close();
    },
    edit: function(btn){
        this.selectGrid(btn,'ExtDesktop.view.module.lead.Win','Please Select Item To Edit');
    },

    selectGrid:function(btn, fileName, message){
         var grid = btn.up("gridpanel");
        var row = grid.getSelectionModel().getSelection();
        if (row.length) {
            var win = Ext.create(fileName);
            var form = win.down('form');
            var record = row[0];
            form.loadRecord(record);
            form.down("image").setSrc(record.get("image_url"));
            win.show();
            win.center();
        } else {
            this.msg(message);
        }

    },
   showForm:function(){
        var win  = Ext.create('ExtDesktop.view.module.lead.Win');
        win.show();
        win.center();
        win.down("textfield").focus(true, 300);
   },
   showFormCopy:function(btn){
        var rec = Util.getRecord(btn , "Please select grid for copy ");
        if (rec) {
            var win  = Ext.create('ExtDesktop.view.module.lead.Win');
            var values = rec.data;

            win.down('form').getForm().setValues(values);
            win.show();
            win.center();
            win.down("textfield").focus(true, 300);

        };
   },
   saveAndNew:function(btn){
        var result =this.save(btn);
        if (result) {
            this.showForm();
        }
   },
   save :function(btn){
        var win =btn.up('window') ;
        var form = win.down('form').getForm(),
        me = this,
        value = form.getValues(),
        record = form.getRecord();

        if(form.isValid()){
            Ext.MessageBox.wait('Saving Data...');

            if(record){


                form.submit({
                    url: '/sdn_lead/update/'+record.data.id ,

                    success: function(fp,o){
                        debugger;
                        Ext.MessageBox.hide();
                        win.close();
                        me.getSdnLeadStore().load();

                    },
                    failure: function(form, response) {
                        debugger;
                        Ext.MessageBox.hide();
                        Ext.MessageBox.show({
                           title:'File not support ',
                           msg: 'It support only image.Please choose image file and try again',
                           buttons: Ext.MessageBox.OK,
                           // fn: showResult,
                           animEl: 'mb4',
                           icon: Ext.MessageBox.ERROR
                       });

                        // Ext.Msg.ERROR('Error: ', "File not support .It support only image .");
                      }
                });
                return true;
            }else{ // Create new if no record

                form.submit({
                    url: '/sdn_lead/create',
                    success: function(fp,o){
                        debugger;
                        Ext.MessageBox.hide();
                        win.close();
                        me.getSdnLeadStore().load();
                    },
                    failure: function(form, response) {
                       Ext.MessageBox.hide();
                        debugger;
                       Ext.MessageBox.show({
                           title:'File not support ',
                           msg: 'It support only image.Please choose image file and try again',
                           buttons: Ext.MessageBox.OK,
                           // fn: showResult,
                           animEl: 'mb4',
                           icon: Ext.MessageBox.ERROR
                       });
                      }
                });
                return true;
            }
        }


    },


});

