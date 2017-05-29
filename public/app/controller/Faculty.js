Ext.define('ExtDesktop.controller.Faculty', {
    extend: 'Ext.app.Controller',
    stores: [
        'acd.Faculty','acd.MajorCourse',
         'acd.CmbSubject',
        'acd.CmbBatch',
        'acd.CmbDegree',
        'acd.CmbMajor'
    ],
    views: [
        'module.faculty.Index',
        'module.course.WinCourse'
    ],
    init: function(app) {

        this.control({
            'GridFaculty button[action=Create]':{
                click : this.showForm
            }  ,
            'GridFaculty button[action=Edit]': {
                click:this.showFormEdit
            },
            'GridFaculty button[action=Delete]': {
                click:this.remove
            },
            'GridFaculty textfield[name=search]':{
                change:this.searchFaculty
            }

        });

    },
    searchFaculty:function(field){
        var value =field.getValue();
        var store = field.up('grid').getStore();
        Util.loadStore(store , { search:value ,course_type:"WU"} )
    },
    remove:function(btn){
        var rec = Util.getRecord(btn , "Please select course for delete");
        if (rec) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to delete this Faculty?', function(text) {
                if (text == 'yes') {
                    store =btn.up("grid").getStore();
                    store.remove(rec);
                    store.sync();
                }
            });
        };
    },
    showForm:function(btn){

        var win = Ext.create('ExtDesktop.view.module.course.WinCourse');

        var ctrl = ExtDesktop.app.getController("Course");
        ctrl.getAcdMajorCourseStore().removeAll();

        win.show();
        win.setTitle("Faculty Maintenance")
        win.down('textfield[name=code]').focus(200, true);
        win.down('textfield[name=course_type]').setValue('WU');

    },

    showFormEdit:function(btn){
        var record = Util.getRecord(btn , "Please select Faculty for edit ");
        if (record ) {
            win=Ext.create('ExtDesktop.view.module.course.WinCourse')
            form=win.down('form')
            win.setTitle("Faculty Maintenance")
            id = record.get('id')

            form.loadRecord(record)
            ctrl = ExtDesktop.app.getController("Course")
            ctrl.getAcdMajorCourseStore().load({
                params:{
                    course_id: id
                }
            })
            win.show()
            win.center()
        }


    },
});

