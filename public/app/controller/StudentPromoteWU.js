Ext.define('ExtDesktop.controller.StudentPromoteWU', {
    extend: 'Ext.app.Controller',
    stores: ['acd.ClassWU', 
        "sdn.StudentListEnrollmentWU"
    ],
    views: [
        'module.studentPromoteWU.Index',
        'module.studentPromoteWU.WinSelectPromoteClassWU',
    ],
    init: function(app) {
        
        this.control({

           'FmStudentPromoteWU button[action=SelectPromoteFromClass]':{
               click: this.showWinSelectClass
           },
           'FmStudentPromoteWU button[action=SelectPromoteToClass]':{
               click: this.showWinSelectClass
           }, 
           "FmStudentPromoteWU button[action=PopulatePromoteToClass]":{
                click: this.populateClass
           }, 
           "FmStudentPromoteWU button[action=Promote]":{
                click: this.promoteStudent
           },
           "FmStudentPromoteWU button[action=Depromote]":{
                click: this.depromoteStudent
           },


           "WinSelectPromoteClassWU grid":{
                itemdblclick: this.selectClass
           }
        });
    },
    tmpClass:null ,
    depromoteStudent:function(btn){

        var grid = btn.up("FmStudentPromoteWU").down("grid[name=secondary]");
        var gridPrimary = btn.up("FmStudentPromoteWU").down("grid[name=primary]");
        var row = grid.getSelectionModel().getSelection();
        var me = this ;
        var classId = btn.up("FmStudentPromoteWU").down("form[name=primary]").down("hiddenfield[name=class_id]").getValue();
        
        if (row.length) {

            if(classId > 0 ){
                row.forEach(function(r){
                    var data = r.getData();
                    me.updateAdmission(data.admission_id , classId);
                    grid.getStore().remove(r);
                    gridPrimary.getStore().add(r);
                })
             }else{
                Util.msg("Please select class for promote");
            }
            
        } else {
            Util.msg("Please select admission");
        }
    },
    promoteStudent:function(btn){
        
        var grid = btn.up("FmStudentPromoteWU").down("grid[name=primary]");
        var gridSecondary = btn.up("FmStudentPromoteWU").down("grid[name=secondary]");
        var row = grid.getSelectionModel().getSelection();
        var me = this ;
        var classId = btn.up("FmStudentPromoteWU").down("form[name=secondary]").down("hiddenfield[name=class_id]").getValue();
        
        
        if (row.length) {
            if(classId > 0 ){

                row.forEach(function(r){
                    var data = r.getData();
                    me.updateAdmission(data.admission_id , classId);
                    grid.getStore().remove(r);
                    gridSecondary.getStore().add(r);
                    
                })
            }else{
                Util.msg("Please select class for promote");
            }
            
        } else {
            Util.msg("Please select admission");
        }
    },
    updateAdmission:function(admissionId , classId ){
        if (classId > 0 ) {

            Util.ajax("SdnAdmission/promote_student" , { admission_id: admissionId , class_id:classId , class_type:"WU" })
        } else{
            Util.msg("Please select class for promote");
        };
    },
    populateClass:function(btn){

        var classCode = btn.up("form").down("textfield[name=class_code]").getValue();
        // load class 

        var isTheSame = false ;
        
        var pclassId = this.tmpClass.up("FmStudentPromoteWU").down("form[name=primary]").down("hiddenfield[name=class_id]").getValue();
        var sclassId = this.tmpClass.up("FmStudentPromoteWU").down("form[name=secondary]").down("hiddenfield[name=class_id]").getValue();

        if (Number(pclassId) == Number(sclassId)) { 
            isTheSame = true ;
        } 
        

        if(classCode && isTheSame == false ){

            Util.ajax("AcdClassWu/get_class" , 
                {class_code:classCode },
                 this.afterAjaxPopulateClass ,
                 {btn:btn ,gridName:btn.gridName }
                );
            
        }else{
            Util.msg("Can not promote in the same class")
        }
        // load admission in class
    },
    afterAjaxPopulateClass:function(obj , params){
        
        params.btn.up("form").getForm().setValues(obj.data[0]);
        var store = params.btn.up("FmStudentPromoteWU").down("grid[name="+params.gridName+"]").getStore();
        store.load({
            params:{
                class_id: obj.data[0].id        
            }
        });
        
    },
    selectClass:function(grid , rec){
        var win = grid.up("window");
        //check conditon if the same class

        this.tmpClass.down("hiddenfield[name=class_id]").setValue(rec.get("id"))
        this.tmpClass.down("textfield[name=class_code]").setValue(rec.get("class_code"))
        win.close();
    },
    showWinSelectClass:function(btn){
        this.tmpClass = btn.up("form[name="+btn.formName+"]");
        var win = Ext.create('ExtDesktop.view.module.studentPromoteWU.WinSelectPromoteClassWU');
        win.show();
        win.center();
    }

});

