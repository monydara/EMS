Ext.define('ExtDesktop.controller.Movement', {
    extend: 'Ext.app.Controller',
    stores: [
        'StudentListStore',
        'SdnReasonTypeStore',
        'StudentStatusLogStore'
    ],
    views: [
        // 'module.movement.Index',

        // 'module.movement.WinSuspend',
        'module.movement.WinDrop',
        'module.movement.WinReactivate',

        'module.movement.WinSearchDropStudent',
        'module.movement.WinSearchSuspendStudent',
        'module.movement.StudentList',
        'module.movement.WinAdvanceSearch'


    ],
    init: function(app) {
        this.control({
            'GridMovement button[action=Drop]': {
                click: this.showFormDrop
            },
            'GridMovement button[action=Suspend]': {
                click: this.showFormSuspend
            },
            'GridMovement button[action=AdvanceSearch]': {
                click: this.showWinAdvanceSearch
            },
             'WinAdvanceSearch button[action=Search]': {
                click: this.searchStatusLog
            },
   
            'GridMovement button[action=Reactivate]': {
                click: this.showFormReactivate
            },
            'FrmDropStudent button[action=Cancel]': {
                click: this.close
            },
            'FrmSuspendStudent button[action=Cancel]': {
                click: this.close
            },
            'FrmReactivateStudent button[action=Cancel]': {
                click: this.close
            },
            'FrmSearchLog button[action=Close]': {
                click: this.close
            },

            'FrmDropStudent button[action=SelectStudent]': {
                click: this.showWinSearchDropStudent
            },
            'WinSearchDropStudent StudentList button[action=addStudent]': { // access to Window subject and text field name keyword
                click: this.addDropStudentBtnOk
            },
            'WinSearchDropStudent grid': {
                itemdblclick: this.addDropStudentDblClick
            },
            'FrmDropStudent button[action=Save]': {
                click: this.saveDrop
            },

            'WinSearchDropStudent StudentList textfield[name=keyword]': { // access to Window subject and text field name keyword
                // change:{
                //     fn: this.searchStudentBasic ,  // fn : reference to the callback function when the textfield is changed
                //     params:{
                //         searchType: "D"     // D=Drop : passing parameter to this function , 
                //                             //it can get this parameter by the fourth parameter eOpts which is an object  
                //                             // searchStudentBasic(textfield,newVal,oldVal,eOpts)
                //     }
                // }
                change: {
                    fn: this.searchStudentBasic,
                    params: "ActiveSuspend" // we can drop only for Active or Suspend student
                }
            },

            // for suspend function  addSuspendStudentDblClick

            'FrmSuspendStudent button[action=SelectStudent]': {
                click: this.showWinSearchSuspendStudent
            },
            'WinSearchSuspendStudent StudentList button[action=addStudent]': {
                click: this.addSuspendStudentBtnOk
            },
            'FrmSuspendStudent button[action=Save]': {
                click: this.saveSuspend
            },

            'WinSearchSuspendStudent grid': {
                itemdblclick: this.addSuspendStudentDblClick
            },
            'WinSearchSuspendStudent StudentList textfield[name=keyword]': { // access to Window subject and text field name keyword
                // change:{
                //     fn: this.searchStudentBasic ,  // fn : reference to the callback function when the textfield is changed
                //     params:{
                //         searchType: "D"     // D=Drop : passing parameter to this function , 
                //                             //it can get this parameter by the fourth parameter eOpts which is an object  
                //                             // searchStudentBasic(textfield,newVal,oldVal,eOpts)
                //     }
                // }
                change: {
                    fn: this.searchStudentBasic,
                    params: "Active" // we can suspend only for Active student
                }
            },

            // for Reactivate function
            'FrmReactivateStudent button[action=SelectStudent]': {
                click: this.showWinSearchReactivateStudent
            },

            'WinSearchReactivateStudent StudentList button[action=addStudent]': { // access to Window subject and text field name keyword
                click: this.addReactivateStudentBtnOk
            },
            'FrmReactivateStudent button[action=Save]': {
                click: this.saveReactivate
            },
            'WinSearchReactivateStudent grid': {
                itemdblclick: this.addReactivateStudentDblClick
            },
            'WinSearchReactivateStudent StudentList textfield[name=keyword]': { // access to Window subject and text field name keyword
                // change:{
                //     fn: this.searchStudentBasic ,  // fn : reference to the callback function when the textfield is changed
                //     params:{
                //         searchType: "D"     // D=Drop : passing parameter to this function , 
                //                             //it can get this parameter by the fourth parameter eOpts which is an object  
                //                             // searchStudentBasic(textfield,newVal,oldVal,eOpts)
                //     }
                // }
                change: {
                    fn: this.searchStudentBasic,
                    params: "DropSuspend" // we can Reactive only for drop or suspend student
                }
            }



        });
    },
    indexGrid:null,
    showWinAdvanceSearch:function(btn){
        debugger;
        this.indexGrid = btn.up('gridpanel')
        var win = Ext.create('ExtDesktop.view.module.movement.WinAdvanceSearch');
        win.show();
    },
    close: function(button) {
        var win = button.up('window');
        win.close();
    },

    showFormDrop: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.movement.WinDrop');
        // loading store to the drop down list for reason type Drop
        var store = this.getSdnReasonTypeStoreStore();
        store.proxy.extraParams = {
            reason: "D"
        }; // D is drop
        store.load();

        win.show();
        win.center();
    },
    showFormSuspend: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.movement.WinSuspend');
        // loading store to the drop down list for reason type Drop
        var store = this.getSdnReasonTypeStoreStore();
        store.proxy.extraParams = {
            reason: "S"
        }; // S is Suspend
        store.load();

        win.show();
        win.center();
    },
    showFormReactivate: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.movement.WinReactivate');

        win.show();
        win.center();
    },

    formDropStudent: null,
    showWinSearchDropStudent: function(btn) {
        this.formDropStudent = btn.up("window").down("form");
        var win = Ext.create('ExtDesktop.view.module.movement.WinSearchDropStudent');

        // loading store for student list and passing parameter
        var store = this.getStudentListStoreStore();
        store.proxy.extraParams = {
            studentType: "ActiveSuspend"
        }; // for Drop and Suspend student
        store.load();

        win.show();
        win.center();
    },
    addDropStudentBtnOk: function(btn) {

        var record = Util.getRecord(btn, "Please select a record");
        var name = record.data.first_name + " " + record.data.last_name;

        this.formDropStudent.loadRecord(record);

        this.formDropStudent.down("textfield[name=student_name]").setValue(name); // setttng name to textfield

        console.log("******** ", record.data);
        // debugger;
        btn.up("window").close();
    },
    addStudentToForm: function(grid, btn) {

    },
    saveDrop: function(btn) {

        var me = this;
        rec = btn.up("window").down("form").getRecord();
        console.log(rec);
        value = btn.up("window").down("form").getValues();

        Util.ajax("SdnStudentMovement/create", {
            student_id: value.student_id,
            admission_id: value.admission_id,
            status_type: 'D', //rec.get('status'),
            reason_type_id: value.reason_type_id,
            start_date: value.start_date,
            end_date: "",
            description: value.description,
            campus_id: value.campus_id
        }, me.closeWinOnSuccess(btn));


        setTimeout(this.getStudentStatusLogStoreStore().load(), 2000);


    },
    closeWinOnSuccess: function(btn) {
        btn.up("window").close();

    },
    // ************************** for suspend function
    formSuspendStudent: null,
    showWinSearchSuspendStudent: function(btn) {

        this.formSuspendStudent = btn.up("window").down("form");
        var win = Ext.create('ExtDesktop.view.module.movement.WinSearchSuspendStudent');

        // loading store for student list and passing parameter
        var store = this.getStudentListStoreStore();
        store.proxy.extraParams = {
            studentType: "Active"
        }; // for Drop and Suspend student
        store.load();

        win.show();
        win.center();
    },
    addSuspendStudentBtnOk: function(btn) {

        var record = Util.getRecord(btn, "Please select a record");
        var name = record.data.first_name + " " + record.data.last_name;

        this.formSuspendStudent.loadRecord(record);

        this.formSuspendStudent.down("textfield[name=student_name]").setValue(name); // setttng name to textfield

        console.log("******** ", record.data);
        // debugger;
        btn.up("window").close();
    },
    saveSuspend: function(btn) {

        var me = this;
        rec = btn.up("window").down("form").getRecord();
        console.log(rec);
        value = btn.up("window").down("form").getValues();
        console.log(value)

        Util.ajax("SdnStudentMovement/create", {
            student_id: value.student_id,
            admission_id: value.admission_id,
            status_type: 'S', //rec.get('status'),
            reason_type_id: value.reason_type_id,
            start_date: value.start_date,
            end_date: value.end_date,
            description: value.description,
            campus_id: value.campus_id
        }, me.closeWinOnSuccess(btn));


        setTimeout(me.getStudentStatusLogStoreStore().load(), 2000);

    },
    // ************************** for Reactivate function
    formReactivateStudent: null,
    showWinSearchReactivateStudent: function(btn) {

        this.formReactivateStudent = btn.up("window").down("form");

        var win = Ext.create('ExtDesktop.view.module.movement.WinSearchReactivateStudent');

        // loading store for student list and passing parameter
        var store = this.getStudentListStoreStore();
        store.proxy.extraParams = {
            studentType: "DropSuspend"
        }; // for Drop and Suspend student
        store.load();

        win.show();
        win.center();
    },
    addReactivateStudentBtnOk: function(btn) {
        var record = Util.getRecord(btn, "Please select a record");
        var name = record.data.first_name + " " + record.data.last_name;

        this.formReactivateStudent.loadRecord(record);
        this.formReactivateStudent.down("textfield[name=student_name]").setValue(name); // setttng name to textfield
        btn.up("window").close();
    },
    saveReactivate: function(btn) {

        var me = this;
        rec = btn.up("window").down("form").getRecord();
        console.log(rec);
        value = btn.up("window").down("form").getValues();
        console.log(value)

        Util.ajax("SdnStudentMovement/create", {
            student_id: value.student_id,
            admission_id: value.admission_id,
            status_type: 'R', //rec.get('status'),  // reactivate means active again
            reason_type_id: value.reason_type_id,
            start_date: value.start_date,
            end_date: "",
            description: value.description,
            campus_id: value.campus_id
        }, me.closeWinOnSuccess(btn));

        setTimeout(me.getStudentStatusLogStoreStore().load(), 2000);

    },

    addDropStudentDblClick: function(grid, rec) {
        this.formDropStudent.loadRecord(rec);
        var name = rec.get("first_name") + " " + rec.get("last_name");
        this.formDropStudent.down("textfield[name=student_name]").setValue(name);
        grid.up("window").close();

    },
    addSuspendStudentDblClick: function(grid, rec) {
        this.formSuspendStudent.loadRecord(rec);
        var name = rec.get("first_name") + " " + rec.get("last_name");
        this.formSuspendStudent.down("textfield[name=student_name]").setValue(name);
        grid.up("window").close();

    },
    addReactivateStudentDblClick: function(grid, rec) {
        this.formReactivateStudent.loadRecord(rec);
        var name = rec.get("first_name") + " " + rec.get("last_name");
        this.formReactivateStudent.down("textfield[name=student_name]").setValue(name);
        grid.up("window").close();

    },

    searchStudentBasic: function(textfield, newVal, oldVal, eOpts) {
        // var obj = eOpts["params"];  // getting object from
        // console.log("hi: ",obj.searchType)
        // debugger;
        // console.log(obj)
        // console.log(eOpts)
        // console.log(eOpts.params)

        var obj = {
            keyword: newVal,
            status: eOpts.params
        }
        var store = this.getStudentListStoreStore();
        setTimeout(function() {
            Util.loadStore(store, obj)
        }, 100); // measure in millisecond (ms)

    },

   searchStatusLog: function(btn) {
        var win = btn.up("window");
        var from_date = win.down("datefield[name=from_date]").getValue();
        var to_date = win.down("datefield[name=to_date]").getValue();
        var status = win.down("combo[name=status_type_id]").getValue();
        console.log(from_date, "***", to_date, "***", status)
        obj = {
            from_date: from_date,
            to_date: to_date,
            status: status
        }
        var store = this.indexGrid.store;     
        Util.loadStore(store, obj)
       
        //setTimeout(this.show(store,obj)  , 1000)
    },

    // show:function(store,obj){
    //     store.load({params:obj});
    //     debugger;
    // }

});