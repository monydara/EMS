Ext.define('ExtDesktop.controller.StudentPromote', {
	extend: 'Ext.app.Controller',
	stores: [
		'acd.ClassTC', 
		'sdn.StudentListEnrollment',
	],
	views: [
		'module.studentPromote.Index',
		'module.studentPromote.WinSelectPromoteClass',
	],
	init: function(app) {
		
		this.control({
		   'FmStudentPromote button[action=SelectPromoteFromClass]':{
			   click: this.showWinSelectClass
		   },
		   'FmStudentPromote button[action=SelectPromoteToClass]':{
			   click: this.showWinSelectClass
		   }, 
		   "FmStudentPromote button[action=PopulatePromoteToClass]":{
		   		click: this.populateClass
		   }, 
		   "FmStudentPromote button[action=Promote]":{
		   		click: this.promoteStudent
		   },
		   "FmStudentPromote button[action=Depromote]":{
		   		click: this.depromoteStudent
		   },


		   "WinSelectPromoteClass grid":{
		   		itemdblclick: this.selectClass
		   }
		});
	},
	tmpClass:null ,
	depromoteStudent:function(btn){

		var grid = btn.up("FmStudentPromote").down("grid[name=secondary]");
		var gridPrimary = btn.up("FmStudentPromote").down("grid[name=primary]");
        var row = grid.getSelectionModel().getSelection();
        var me = this ;
        var classId = btn.up("FmStudentPromote").down("form[name=primary]").down("hiddenfield[name=class_id]").getValue();
       	
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
		
		var grid = btn.up("FmStudentPromote").down("grid[name=primary]");
		var gridSecondary = btn.up("FmStudentPromote").down("grid[name=secondary]");
        var row = grid.getSelectionModel().getSelection();
        var me = this ;
        var classId = btn.up("FmStudentPromote").down("form[name=secondary]").down("hiddenfield[name=class_id]").getValue();
       	
        
        if (row.length) {
        	if (classId > 0 ) {

	            row.forEach(function(r){

	            	var data = r.getData();
	            	me.updateAdmission(data.admission_id , classId);
	            	grid.getStore().remove(r);
	             	gridSecondary.getStore().add(r);
	             	
	         	})

        	}else{
        		Util.msg("Please select class for promote");
        	};
            
        } else {
            Util.msg("Please select admission");
        }
	},
	updateAdmission:function(admissionId , classId ){
		if (classId > 0 ) {

			Util.ajax("SdnAdmission/promote_student" , { admission_id: admissionId , class_id:classId , class_type:"TC" })
		} else{
			Util.msg("Please select class for promote");
		};
	},
	populateClass:function(btn){

		var classCode = btn.up("form").down("textfield[name=class_code]").getValue();
		// load class 

		var isTheSame = false ;
		
		var pclassId = this.tmpClass.up("FmStudentPromote").down("form[name=primary]").down("hiddenfield[name=class_id]").getValue();
		var sclassId = this.tmpClass.up("FmStudentPromote").down("form[name=secondary]").down("hiddenfield[name=class_id]").getValue();

		if (Number(pclassId) == Number(sclassId)) { 
			isTheSame = true ;
		} 
		

		if(classCode && isTheSame == false ){

			Util.ajax("AcdClassTc/get_class" , 
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
		var store = params.btn.up("FmStudentPromote").down("grid[name="+params.gridName+"]").getStore();
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
		var win = Ext.create('ExtDesktop.view.module.studentPromote.WinSelectPromoteClass');
		win.show();
		win.center();
	},




});

