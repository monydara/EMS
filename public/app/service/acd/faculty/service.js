Ext.define("ExtDesktop.service.acd.faculty.service",{
    loadSubjectToForm:function(g , r  , me){
        var w  = g.up("window") ; 
        var ow =this.tmpWin ;  
        ow.down("textfield[name=subject_id]").setValue(r.get("id"))
        ow.down("textfield[name=name]").setValue(r.get("name"))
        ow.down("numberfield[name=total_credits]").setValue(r.get("credit"));

        ow.down("numberfield[name=total_sessions]").setValue(r.get("sessions"));
        
        ow.down("numberfield[name=total_credits]").focus(300 , true);
        
        w.close();
    },
    deelteDivision:function(r , s ){
         var id = r.get("id");
        var me = this;
        Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this Division?', function(btn) {
            if (btn == 'yes') {
                Util.ajax("/CourseRelate/remove_division",{ id:id }, me.reloadStore , s );
            }
        });
    },
    showWinAssignSubjecs:function(r , me){
        var win = Ext.create('ExtDesktop.view.module.facultySetup.WinAssignSubjects');
        this.divisionId = r.get("division_id");
        var s = me.getAcdSubjectDetailStore(); 
        var se = this ; 

        s.proxy.extraParams={
            degree_id : se.degreeId , 
            course_id : se.courseId , 
            standard_id : se.standardId , 
            division_id : se.divisionId 

        }
        s.load();

        win.down("form").getForm().loadRecord(r);
        win.show();
        win.center();
    },
    addStandard:function(g,r,s){
        var win = g.up("window");
        win.close();
        var data = {
            degree_id:this.degreeId ,
            course_id: this.courseId ,
            standard_id: r.get("id")
        }
        Util.ajax("/CourseRelate/add_standard",data, this.reloadStore , s );
    },
    removeStandard:function( r , s ){
        var id = r.get("id");
        var me = this;
        Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this standard?', function(btn) {
            if (btn == 'yes') {
                Util.ajax("/CourseRelate/remove_standard",{ id:id }, me.reloadStore , s );
            }
        });
    },
    populateDegree:function(ctrl, btn){
        var degree_id = this.getDegreeId(btn);
        if (degree_id > 0 ) {
            // load faculty list
            var store = ctrl.getAcdDegreeCourseStore();
            store.proxy.extraParams.degree_id = degree_id;
            store.load();
        }else{

            Util.msg("Please select degree Before populate");
        };
    },
    getDegreeId:function(btn){
         var fm = btn.up("FmFacultySetup");
        var degree_id = fm.down("combo[name=degree_id]").getValue();
        return degree_id;
    },
    addFaclty:function(g , r, s){
        var win = g.up("window");

        win.close();
        var data = {
            degree_id:this.degreeId ,
            course_id: r.get("id")
        }
        Util.ajax("/CourseRelate/add_faculty",data, this.reloadStore , s );
    },
    addDivision:function(g,r,s){
        var win = g.up("window");
        win.close();
        var data = {
            degree_id:this.degreeId ,
            standard_id: this.standardId, 
            course_id: this.courseId , 
            division_id: r.get("id")
        }
        Util.ajax("/CourseRelate/add_faculty_division",data, this.reloadStore , s );
    },
    reloadStore:function(o,s ){
        s.load();
    },
    removeFaculty:function( r , s ){
        var id = r.get("id");
        var me = this;
        Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this faculty?', function(btn) {
            if (btn == 'yes') {
                Util.ajax("/CourseRelate/remove_faculty",{ id:id }, me.reloadStore , s );
            }
        });
    },
    showSubjectList:function(r , ctrl){
        var win = Ext.create('ExtDesktop.view.module.facultySetup.WinSubjectList');
        this.divisionId = r.get("division_id")  ; 
        win.show();
        win.center();


    },

    // set tmp form
    degreeId:null ,
    courseId:null,
    standardId:null ,
    divisionId:null ,
    resetTmpId:function(){
        this.degreeId = null ;
        this.courseId = null ;
        this.standardId = null ;
        this.divisionId = null ;
    },


});
