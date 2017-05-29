Ext.define('ExtDesktop.controller.ClassEnrollmentWU', {
    extend: 'Ext.app.Controller',
    stores: [
            'acd.WUClassEnrollment',
            'sdn.StudentListEnrollmentWU',
            'acd.ClassWU',
            "admissionWU.AdmissionList"
    ],
    views: [
        'module.classEnrollmentWU.Index',
        'module.classEnrollmentWU.WinSelectClass',
        'module.classEnrollmentWU.WinSelectMember'
    ],
    init: function(app) {
        this.service = Ext.create("ExtDesktop.service.acd.classEnrollment.service");

        this.control({
            'WUClassMembers button[action=SelectClass]': {
                click: this.showClassList
            },
            'WUClassMembers button[action=Refresh]': {
                click: this.refreshMember
            },
            "WUClassMembers button[action=Remove]":{
                click : this.removeMember
            },
            'WUClassMembers button[action=Add]': {
                click: this.showAdmissionList
            }, 
            'WUClassMembers button[action=Populate]': {
                click: this.populateClassWu
            }, 
            "WinSelectClassWU grid":{
                itemdblclick: this.loadClass
            }, 
            "WUClassMembers button[action=Unlock]":{
                click: this.unlockButton
            }, 
           "WinSelectMemberWU grid":{
                itemdblclick: this.loadMember
           },
           "WUClassMembers button[action=]":{
                itemdblclick: this.loadMember
           },
            "WUClassMembers button[action=Save]":{
                click : this.save
            },
            "WinSelectMemberWU textfield[name=filter]":{
                change: this.loadAdmissionStore
            }


        });

    },
    tmpfmMember: null ,
    loadAdmissionStore:function(field , value){
        var grid = field.up("grid");
        var store = grid.getStore();

        Util.loadStore(store , 
            { 
                search: value
            }
        );
    },
    save:function(btn){
        var store =this.getSdnStudentListEnrollmentWUStore(); 
        Util.storeSync(store)
    },

    refreshMember:function(btn){
        var store =this.getSdnStudentListEnrollmentWUStore(); 
        store.load();

    },
    loadMember:function(grid , rec ){

        var win = grid.up("window");
        var store =this.getSdnStudentListEnrollmentWUStore();
        var classId = this.tmpfmMember.down("textfield[name=class_id]").getValue() ; 
        var data = rec.getData();
        if (classId > 0 ) {
           if( this.service.checkAdminssionExist(store , data.student_id) == true ){
                Util.msg("This student already exist in the class ");
           }else{
                var model =   this.service.mapModelEnrollmentWU(data ,classId )
                store.add(model);
                win.close();
           };
                   
           
        } else{
            Util.msg("Please click on populate class before add member");
        };
    
    },
    removeMember:function(btn){
        var rec = Util.getRecord(btn , "Please select member in class ");
        if (rec) {
            var store =this.getSdnStudentListEnrollmentWUStore(); 
            if (rec.get("id")) {
                rec.set("is_del", true )
            } else{                
                store.remove(rec);
            };
        } 
    },
    unlockButton:function(btn){


        var fm = btn.up("WUClassMembers");
        var status = fm.down("hiddenfield[name=status]").getValue();
        if (status == "S") {
          this.service.visibleButtonWU( btn , false );
        } else{
            Util.msg("The class not available to unlock  ")
        };
    },
    populateClassWu:function(btn){
        var fm =  btn.up("WUClassMembers");
        var classCode =fm.down("textfield[name=class_code]").getValue();
        if (classCode == "") {
            Util.msg("Please select class");
        } else{
            var store =this.getSdnStudentListEnrollmentWUStore();
            this.service.visibleButtonWU( btn , true );
            Util.ajax("AcdClassWu/get_class" , {class_code:classCode }, this.afterAjaxPopulateWU , {fm:fm ,store:store , service:this.service});
        };
    },
    afterAjaxPopulateWU:function(obj , params ){
        var data = obj.data[0];
        params.fm.down("form").getForm().setValues(data );
        params.fm.down("textfield[name=class_id]").setValue(data.id);
        params.fm.down("hiddenfield[name=status]").setValue(data.status);
        params.fm.down("textfield[name=status]").setValue(params.service.renderStatus( data.status));
        params.store.proxy.extraParams.class_id =data.id;
        params.store.load();
        
        
    },
    loadClass:function(grid , rec ){
        var win = grid.up("window");
        this.tmpfmMember.down("textfield[name=class_name]").setValue(rec.get("class_name"));
        this.tmpfmMember.down("textfield[name=class_code]").setValue(rec.get("class_code"));
        win.close(); 

    },
    showAdmissionList:function(){
        var win = Ext.create('ExtDesktop.view.module.classEnrollmentWU.WinSelectMember')
        win.show()
        win.center()
    },

    showClassList:function(btn){
        this.tmpfmMember = btn.up("WUClassMembers");
        var win = Ext.create('ExtDesktop.view.module.classEnrollmentWU.WinSelectClass')
        win.show()
        win.center()
    }


});

