Ext.define("ExtDesktop.service.acd.classEnrollment.service",{
	checkAdminssionExist:function(store , studentId){
		var result = false ; 
		store.each(function(rec ){
		  console.log(rec.get("student_id") , "===");
        	if (rec.get("student_id") == studentId) {
				result = true ; 
			} 
		})
		return result ;
	}, 
	mapModelEnrollment:function(data ,classId ){
        var model = Ext.create("ExtDesktop.model.sdn.StudentListEnrollment",{
            class_id: classId , 
            student_id : data.student_id , 
            admission_id: data.id , 
            enroll_date:new Date() , 
            student_no:data.student_no, 
            admission_no:data.admission_no , 
            student_name:data.student_name , 
            status:data.status           
        });         
         return model ;
    },
    mapModelEnrollmentWU:function(data ,classId ){
        console.log(data);
	  	var model = Ext.create("ExtDesktop.model.sdn.StudentListEnrollmentWU",{
            class_id: classId , 
            student_id : data.student_id , 
            admission_id: data.id , 
            enroll_date:new Date() , 
            student_no:data.student_no, 
            admission_no:data.admission_no , 
            name:data.name , 
            status:data.status           
        });         
		 return model ;
	},
	visibleButton:function(btn , isVisible){
         var fm = btn.up("TCClassMembers");
        var status = fm.down("hiddenfield[name=status]").getValue();
        fm.down("button[action=Add]").setDisabled(isVisible);
        fm.down("button[action=Remove]").setDisabled(isVisible);
        fm.down("button[action=Refresh]").setDisabled(isVisible);
        fm.down("button[action=Save]").setDisabled(isVisible);
    },
    visibleButtonWU:function(btn , isVisible){
         var fm = btn.up("WUClassMembers");
        var status = fm.down("hiddenfield[name=status]").getValue();
        fm.down("button[action=Add]").setDisabled(isVisible);
        fm.down("button[action=Remove]").setDisabled(isVisible);
        fm.down("button[action=Refresh]").setDisabled(isVisible);
        fm.down("button[action=Save]").setDisabled(isVisible);
    },
    renderStatus:function(status){
        var fullName = "" ;
        switch(status) {
            case "S":
                fullName = "Started";
                break;
            case "F":
                fullName = "Finished"
                break;
            case "C": 
                fullName = "Cancelled";
                break;
            case "P":
                fullName = "Pendding";
                break;
        }

        return fullName;
    }

});