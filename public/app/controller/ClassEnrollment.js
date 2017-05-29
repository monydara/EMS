Ext.define('ExtDesktop.controller.ClassEnrollment', {
    extend: 'Ext.app.Controller',
    stores: [
        'acd.TCClassEnrollment',
        'sdn.StudentListEnrollment',
        'combo.CourseLevel',
        'acd.ClassTC',
        "admission.Admission"
    ],
    views: [
        'module.classEnrollment.Index',
        'module.classEnrollment.WinSelectClass',
        'module.classEnrollment.WinSelectMember'
    ],
    init: function(app) {
        this.service = Ext.create("ExtDesktop.service.acd.classEnrollment.service");
        
        this.control({
            'TCClassMembers button[action=SelectClass]': {
                click: this.showClassList
            },
            'TCClassMembers button[action=Add]': {
                click: this.showAdmissionList
            }, 
            "WinSelectClass grid":{
                itemdblclick: this.loadClass
            }, 
            "TCClassMembers button[action=Populate]":{
                click : this.populateClassTc
            }, 
            "WinSelectMember grid":{
                itemdblclick: this.loadMember
            },
            "WinSelectMember textfield[name=filter]":{
                change: this.loadAdmissionStore
            },
            "TCClassMembers button[action=Remove]":{
                click : this.removeMember
            },
            "TCClassMembers button[action=Refresh]":{
                click : this.refreshMember
            },
            "TCClassMembers button[action=Unlock]":{
                click : this.unlockButton
            }, 
            "TCClassMembers button[action=Save]":{
                click : this.save
            }

        });

    },
    tmpfmIndex:null ,
    save:function(btn){
        var store =this.getSdnStudentListEnrollmentStore(); 
        Util.storeSync(store)
    },
    loadAdmissionStore:function(field , value){
        var grid = field.up("grid");
        var store = grid.getStore();

        Util.loadStore(store , 
            { 
                text: value
            }
        );
    },
    unlockButton:function(btn){


        var fm = btn.up("TCClassMembers");
        var status = fm.down("hiddenfield[name=status]").getValue();
        if (status == "S") {
          this.service.visibleButton( btn , false );
        } else{
            Util.msg("The class not available to unlock  ")
        };
    },
    
    refreshMember:function(btn){
        var store =this.getSdnStudentListEnrollmentStore(); 
        store.load();

    },
    removeMember:function(btn){
        var rec = Util.getRecord(btn , "Please select member in class ");
        if (rec) {
            var store =this.getSdnStudentListEnrollmentStore(); 
            if (rec.get("id")) {
                rec.set("is_del", true )
            } else{                
                store.remove(rec);
            };
        } 
    },
    loadMember:function(grid , rec ){

        var win = grid.up("window");
        var store =this.getSdnStudentListEnrollmentStore();
        var classId = this.tmpfmIndex.down("textfield[name=class_id]").getValue() ; 
        var data = rec.getData();
        if (classId > 0 ) {
           if( this.service.checkAdminssionExist(store , data.student_id) == true ){
                Util.msg("This student already exist in the class ");
           }else{
                var model =   this.service.mapModelEnrollment(data ,classId )
                store.add(model);
                win.close();
           };
                   
           
        } else{
            Util.msg("Please click on populate class before add member");
        };
    
    },
    tmpfmMember:null , 
    populateClassTc:function(btn){
        var fm =  btn.up("TCClassMembers");
        var classCode =fm.down("textfield[name=class_code]").getValue();
        if (classCode == "") {
            Util.msg("Please select class");
        } else{
            var store =this.getSdnStudentListEnrollmentStore();
            this.service.visibleButton( btn , true );
            Util.ajax("AcdClassTc/get_class" , {class_code:classCode }, this.afterAjaxPopulateTC , {fm:fm ,store:store});
        };
    },
    afterAjaxPopulateTC:function(obj , params ){
        var data = obj.data[0];
        params.fm.down("form").getForm().setValues(data );
        params.fm.down("textfield[name=class_id]").setValue(data.id);
        params.fm.down("hiddenfield[name=status]").setValue(data.status);
        params.store.proxy.extraParams.class_id =data.id;
        params.store.load();
        
        
    },
    loadClass:function(grid , rec ){
        var win = grid.up("window");
        this.tmpfmMember.down("textfield[name=class_name]").setValue(rec.get("class_name"));
        this.tmpfmMember.down("textfield[name=class_code]").setValue(rec.get("class_code"));
        win.close(); 

    },
    showAdmissionList:function(btn ){
        this.tmpfmIndex = btn.up("TCClassMembers");
        var win = Ext.create('ExtDesktop.view.module.classEnrollment.WinSelectMember')
        win.show()
        win.center()
    },

    showClassList:function(btn){
        var win = Ext.create('ExtDesktop.view.module.classEnrollment.WinSelectClass'); 
        this.tmpfmMember = btn.up("TCClassMembers") ; 
        win.show()
        win.center()
    }
});

