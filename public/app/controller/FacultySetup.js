Ext.define('ExtDesktop.controller.FacultySetup', {
    extend: 'Ext.app.Controller',
    stores: [
        'acd.Faculty',
        'combo.DegreeWU',
        'Standard',
        'Division',
        'Subject',
        // grid store
        "acd.DegreeCourse",
        "acd.FacultyStandard", 
        "acd.StandardDivision", 
        "acd.SubjectDetail"
    ],
    views: [
        'module.facultySetup.Index',
        'module.facultySetup.WinFacultyList',
        'module.facultySetup.WinStandardList',
        'module.facultySetup.WinDivisionList',
        'module.facultySetup.WinSubjectList',
        'module.facultySetup.WinAssignSubjects',
        'module.facultySetup.WinSubjectDetail',

    ],
    init: function(app) {
        this.service = Ext.create("ExtDesktop.service.acd.faculty.service");

        this.control({
            // === degree event
            "FmFacultySetup button[action=Populate]": {
                click: this.populateDegree
            },
            
            'WinSubjectDetail button[action=SelectSubject]': {
                click: this.showSubjectList
            },
            'FmFacultySetup button[action=AssignSubjects]': {
                click: this.showWinAssignSubjecs
            },
            'WinAssignSubjects button[action=AddSubjectDetail]': {
                click: this.showWinSubjectDetail
            },

            // grid faculty
            "FmFacultySetup #facultyList":{
                itemclick: this.loadStandardList
            },
            'FmFacultySetup button[action=AddFaculty]': {
                click: this.showFacultyList
            },
            "FmFacultySetup button[action=RemoveFaculty]":{
                click : this.RemoveFaculty
            },
            "WinFacultyList grid":{
                itemdblclick: this.addFaclty
            },

            // grid standard
            "WinStandardList grid":{
                itemdblclick: this.addStandard
            },
            'FmFacultySetup button[action=AddStandard]': {
                click: this.showStandardList
            },
            'FmFacultySetup button[action=DeleteStandard]': {
                click: this.deleteStandard
            },
            "FmFacultySetup grid[name=standardList]":{
                itemclick : this.loadDivision
            }, 
            // grid division 
            'FmFacultySetup button[action=AddDivision]': {
                click: this.showDivisionList
            },
            'FmFacultySetup button[action=DeleteDivision]': {
                click: this.deleteDivision
            },
            "WinDivisionList grid":{
                itemdblclick: this.addDivision
            },
            // win subject 

            "WinSubjectList textfield[name=filter]":{
                change : this.filterSubject
            }, 
            "WinSubjectList grid":{
                itemdblclick : this.loadSubjectToForm
            },
            "WinSubjectDetail button[action=SaveSubjectDetail]":{
                click : this.saveSubject 
            },
            "WinAssignSubjects button[action=DeleteSubjectDetail]":{
                click : this.deleteSubjectDetail 
            },
            "WinSubjectDetail button[action=Cancel]":{
                click : Util.closeWindow
            }
        });
    },
    showFormEditSubjectDeail:function(grid , rowIndex ){
        var store = grid.getStore();
        var rec =store.getAt(rowIndex);
        var win = this.showWindows(grid, 'ExtDesktop.view.module.facultySetup.WinSubjectDetail');
        win.down("form").getForm().loadRecord(rec);
    },

    deleteSubjectDetail:function(btn){
        var r = Util.getRecord(btn , "Please select Subject for remove ");
        var store = this.getAcdSubjectDetailStore(); 
        if (r) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this Subject?', function(btn) {
                if (btn == 'yes') {
                    store.remove(r);
                    store.sync();
                }
            });
        } 

    },
    saveSubject:function(btn){
        var store = this.getAcdSubjectDetailStore(); 

        Util.save(btn, store, "acd.SubjectDetail")
    },
    loadSubjectToForm:function(g , r ){
        var me = this ; 
        
        this.service.loadSubjectToForm(g , r  , me )

    }, 
    filterSubject:function(f , v ){
        var s = f.up("grid").getStore();
        Util.loadStore(s , { search: v })
    }, 
    deleteDivision:function(btn ){
        var r = Util.getRecord(btn , "Please select Division");
        var s = this.getAcdStandardDivisionStore();
        if (r) {
            this.service.deelteDivision(r , s); 
        } ;
    },
    addDivision:function(g ,r ){
    
        var s = this.getAcdStandardDivisionStore();
        this.service.addDivision(g,r,s);

    }, 
    loadDivision:function(g , r){
        var service = this.service ;
        service.standardId = r.get("standard_id");

        var s = this.getAcdStandardDivisionStore();
        s.proxy.extraParams = {
            degree_id : service.degreeId ,
            course_id : service.courseId, 
            standard_id : service.standardId 
        }
        s.load();
    },
    deleteStandard:function(btn){
        var r = Util.getRecord(btn , "Please select Faculty for delete");
        var s = this.getAcdFacultyStandardStore();
        this.service.removeStandard( r , s )
    },
    addStandard:function(g , r){
        var degreeId = this.service.degreeId ;
        var courseId = this.service.courseId ;
        if (degreeId > 0 && courseId> 0  ){
            var s = this.getAcdFacultyStandardStore();
            this.service.addStandard(g,r,s);
        }else{
            Util.msg("Please select course");
        }
    },
    RemoveFaculty:function(btn){
        var r = Util.getRecord(btn , "Please select Faculty for delete");
        var s = this.getAcdDegreeCourseStore();
        this.service.removeFaculty( r , s )
    },
    addFaclty:function(g , rec ){
        var degreeId = this.service.degreeId ;

        if (degreeId > 0 ){
            var s = this.getAcdDegreeCourseStore();
            this.service.addFaclty(g,rec,s);
        }else{
            Util.msg("Please select degree");
        }
    },
    loadStandardList:function(g , rec){
        var service = this.service ;
        service.courseId = rec.get("course_id");
        var s = this.getAcdFacultyStandardStore();
        s.proxy.extraParams = {
            degree_id : service.degreeId ,
            course_id : service.courseId
        }
        s.load();

    },
    populateDegree: function(btn) {
        this.service.populateDegree(this, btn);
        this.service.resetTmpId();
        this.service.degreeId =this.service.getDegreeId(btn);
        this.getAcdFacultyStandardStore().removeAll();
        this.getAcdStandardDivisionStore().removeAll();

    },

    showWinSubjectDetail: function(btn) {
   
        var win = this.showWindows(btn, 'ExtDesktop.view.module.facultySetup.WinSubjectDetail');
        var se = this.service ; 
        win.down("hiddenfield[name=division_id]").setValue(se.divisionId);
        win.down("hiddenfield[name=standard_id]").setValue(se.standardId);
        win.down("hiddenfield[name=course_id]").setValue(se.courseId);
        win.down("hiddenfield[name=degree_id]").setValue(se.degreeId);
    },

    showFacultyList: function(btn) {
        var degreeId = this.service.getDegreeId(btn);
        if (degreeId> 0 ) {
            this.showWindows(btn, 'ExtDesktop.view.module.facultySetup.WinFacultyList');
        }else{
            Util.msg("Please select degree for add ");
        };
    },
    showStandardList: function(btn) {
        this.showWindows(btn, 'ExtDesktop.view.module.facultySetup.WinStandardList');
    },
    showDivisionList: function(btn) {
        var se = this.service ; 
        if (se.degreeId > 0 && se.courseId > 0 && se.standardId > 0 ) {

            this.showWindows(btn, 'ExtDesktop.view.module.facultySetup.WinDivisionList');

        } else{
            Util.msg("Please select degree , faculty and standard");
        };
    },
    showSubjectList: function(btn) {
        this.service.tmpWin = btn.up("window"); 

       var win = Ext.create("ExtDesktop.view.module.facultySetup.WinSubjectList");
       win.show();
       win.center();
    },
    showWinAssignSubjecs: function(btn) {
        var r = Util.getRecord(btn , "Please select Division for add Subject" );
        var me = this ;
        if (r) {
             me.service.showWinAssignSubjecs(r , me); 
            // this.showWindows(btn, 'ExtDesktop.view.module.facultySetup.WinAssignSubjects');
        } 
    },

    close: function(button) {
        var win = button.up('window');
        win.close();
    },

    showWindows: function(btn, winUrlFile) {
        var win = Ext.create(winUrlFile);
        win.show()
        win.center()
        return win ;
    }

});
