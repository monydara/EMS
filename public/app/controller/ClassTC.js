Ext.define('ExtDesktop.controller.ClassTC', {
    extend: 'Ext.app.Controller',
    stores: [
        'acd.ClassTC',
        'acd.ClassTCDetail',
        //combo store
        'combo.DegreeTC',
        'combo.CourseTC',
        'combo.AcademicYear',
        'combo.CourseLevel',
        'combo.Room',
        'combo.Term',
        'combo.TuitionTime',
        'combo.ClassShift',
        'combo.Subject',
        'combo.Lecturer'
    ],
    views: [
        'module.classTC.Index',
        'module.classTC.WinClass',
        'module.classTC.WinSubject'
    ],
    init: function(app) {
        this.control({
           'GridClassTC button[action=Create]':{
        	   	click: this.showForm
           },

           'FrmClassTC button[action=cancel]':{
                click: this.close
           },
           'GridClassTC button[action=Edit]': {
               click:this.showFormEdit
           },
           'GridClassTC textfield[name=search]': {
               change : this.search
           },
           'FrmClassTC button[action=save]':{
        	   click:this.save
           },

            'FrmClassTC combo[name=degree_id]':{
                select : this.filterCourseByDegree
            },
           'FrmClassTC combo[name=course_id]':{
                select : this.filterCourseLevel
           },

           'FrmClassTC button[action=addSubject]':{
                click : this.showFormAddSubject
           },

           'WinAddSubject button[action=cancel]':{
                click : this.close
           },

           'WinAddSubject button[action=save]':{
                click : this.addSubject
           },

        });

    },
    search:function(field){
        var value = field.getValue();
        var store = field.up('grid').getStore();
        Util.loadStore(store, {text : value});
    },
    removeSubject:function(grid, rowIndex){
         Ext.MessageBox.confirm('Remove Subject?', 'Are you sure to <b>remove this subject </b>?',
            function(btn ){

                if (btn == 'yes') {
                    remove()
                };
            });


        function remove(){

            var store =grid.getStore();
            var rec = store.getAt(rowIndex);
            var id = rec.get('id') ;
            if (id > 0 ) {
                // remove subject in server side
                Util.ajax('AcdClassTc/removeSubject',{id:id});

            }
            store.remove(rec);
        }


    },
    editSubject:function(grid, rowIndex){
        var win = Ext.create('ExtDesktop.view.module.classTC.WinSubject');
        var store =grid.getStore();
        var rec = store.getAt(rowIndex);
        win.down('form').loadRecord(rec);
        win.show();
        win.center();
    },
    addSubject:function(btn){
        var win = btn.up('window');
        var form = win.down('form');
        var values = form.getValues(),
        record = form.getRecord();
        var model = Ext.create('ExtDesktop.model.acd.ClassTcDetail');
        var store = this.getAcdClassTCDetailStore();


        values.subject = form.down('combo[name=subject_id]').getRawValue();
        values.lecturer = form.down('combo[name=lecture_id]').getRawValue();
        values.is_deleted= false;

        if (form.getForm().isValid()) {
            if (record) {
                record.set(values);
            } else{
                model.set(values);
                store.add(model);
            };
            win.close();
        } else{

        };

        // console.log(values);
    },
    showFormAddSubject:function(){
        var win = Ext.create('ExtDesktop.view.module.classTC.WinSubject');
        win.show();
        win.center();
    },

    filterCourseLevel:function(field,record){

        if (record) {
            var rec = record[0];
            field.up('form').down('combo[name=course_level_id]').setValue('');

            this.filterCourseLevelAndSubject(rec.get('id'));

        };
    },

    filterCourseByDegree:function(field,record){
        if (record) {
            var rec = record[0];
            field.up('form').down('combo[name=course_id]').setValue('');

            var id =rec.get('id');

            this.getComboCourseTCStore().load({
                params:{
                    degree_id: id
                }
            });

        }
    },
    filterCourseLevelAndSubject:function(id){
         this.getComboCourseLevelStore().load({
                params:{
                    course_id: id
                }
            });

           /* this.getComboSubjectStore().load({
                params:{
                    course_id : id
                }
            });*/
    },
    save: function(btn){
    	var win = btn.up('window'),
        form = win.down('form'),
        values = form.getValues(),
        record = form.getRecord(),
        store = this.getAcdClassTCStore();

        if(form.getForm().isValid()){

            values['acd_class_tc_detail_attributes']=Util.getValueFromStoreDetail(this.getAcdClassTCDetailStore());
            if (record) {
                record.set(values);
            } else{
                var model = Ext.create('ExtDesktop.model.ClassTC');
                model.set(values);
                store.add(model);

            };
            Util.storeSync(store , win)

        }else{
            Util.msg("Please entry require field before press Save button");
        }
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.classTC.WinClass');
         this.getAcdClassTCDetailStore().removeAll();
         win.show();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},

	showFormEdit:function(btn){
        record = Util.getRecord(btn , "Please select class for edit")
        if (record) {
            win=Ext.create('ExtDesktop.view.module.classTC.WinClass')
            form=win.down('form')
            this.filterCourseLevelEditForm(form,record);
            form.loadRecord(record)

            win.show()
            win.center()
        }
	},

    filterCourseLevelEditForm:function(form,record){
        if (record) {
            form.down('combo[name=course_level_id]').setValue('');
            this.filterCourseLevelAndSubject(record.get('id'));
        };
    }

});

