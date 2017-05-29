Ext.define('ExtDesktop.controller.Class', {
    extend: 'Ext.app.Controller',
    stores: [
        'acd.ClassWU',
        'acd.ClassWUDetail',
        //combo store
        'combo.DegreeWU',
        'combo.CourseWU',
        'combo.AcademicYear',
        'combo.Standard',
        'combo.Division',
        'combo.Subject',
        'combo.Lecturer',

        'combo.DivisionStandardDegree',
        'combo.CourseLevel',
        'combo.Room',
        'combo.Term',
        'combo.TuitionTime',
        'combo.ClassShift',
    ],
    views: [
        'module.class.Index',
        'module.class.WinClass'
    ],
    init: function(app) {

        this.control({
            'GridClass button[action=Create]': {
                click: this.showForm
            },
            'GridClass textfield[name=search]': {
                change: this.search
            },
            'FrmClass button[action=cancel]': {
                click: this.close
            },
            'GridClass button[action=Edit]': {
                click: this.showFormEdit
            },
            'FrmClass button[action=save]': {
                click: this.save
            },
            'FrmClass button[action=addSubject]': {
                click: this.showFormSubject
            },
            'WinAddSubjectWU button[action=save]': {
                click: this.addSubject
            },
            'WinAddSubjectWU button[action=cancel]': {
                click: this.close
            },
            'FrmClass radiofield[name=is_gpa]': {
                change: this.setCreditEnable
            },
            'FrmClass combo[name=degree_id]': {
                select: this.filterStandardAndCourse
            },
            // 'FrmClass combo[name=standard_id]': {
            //     change: this.filterDivision
            // },
            'FrmClass combo[name=course_id]': {
                change: this.filterSubject
            },

        });

    },
    search: function(field) {
        var value = field.getValue();
        var store = field.up('grid').getStore();
        Util.loadStore(store, {
            text: value
        });
    },
    editSubject: function(grid, rowIndex) {
        var win = Ext.create('ExtDesktop.view.module.class.WinSubject');
        var form = win.down('form');
        var rec = grid.getStore().getAt(rowIndex);
        form.loadRecord(rec);
        win.show();
        win.center();
    },
    removeSubject: function(grid, rowIndex) {
        var rec = grid.getStore().getAt(rowIndex);

        Ext.MessageBox.confirm('Confirm', 'Are you sure to Remove this subject?', function(btn) {
            if (btn == 'yes') {
                rec.set("is_deleted", true);
                grid.refreshView()
            }
        })

    },
    filterSubject: function(field, value) {
        this.getComboSubjectStore().load({
            params: {
                course_id: value
            }
        });
    },
    // filterDivision: function(field, value) {
    //     if (value) {
    //         // var id = record[0].get('id');
    //         var degree_id = field.up('form').down("combo[name=degree_id]").getValue();
    //         if (degree_id && value) {
    //             this.getComboDivisionStandardDegreeStore().load({
    //                 params: {
    //                     standard_id: value,
    //                     degree_id: degree_id
    //                 }
    //             })
    //         };
    //     };
    // },
    filterStandardAndCourse: function(field, record) {
        if (record) {
            var id = record[0].get('id');

            this.getComboStandardStore().load({
                params: {
                    degree_id: id
                }
            });
            this.getComboCourseWUStore().load({
                params: {
                    degree_id: id
                }
            });

            this.getComboDivisionStore().removeAll();
            var form = field.up('form');
            form.down('combo[name=standard_id]').setValue('');
            form.down('combo[name=division_id]').setValue('');
        };

    },
    setCreditEnable: function(field, value) {
        console.log(value);
        if (value) {
            var form = field.up('form'),
                creditField = form.down('numberfield[name=credit]');
            var is_gpa = field.inputValue == "true" ? true : false;

            creditField.setDisabled(!is_gpa);

        };

    },
    addSubject: function(btn) {
        var win = btn.up('window');
        var form = win.down('form');
        var values = form.getValues(),
            record = form.getRecord();
        //var model = Ext.create('ExtDesktop.model.acd.ClassWUDetail');
        //var store = this.getAcdClassWUDetailStore();


        values.subject = form.down('combo[name=subject_id]').getRawValue();
        values.lecturer = form.down('combo[name=lecturer_id]').getRawValue();
        values.division = form.down('combo[name=division_id]').getRawValue();
        values.is_deleted = false;

        if (form.getForm().isValid()) {
            if (record) {
                record.set(values);
            } else {
                model.set(values);
               // store.add(model);
            };

            win.close();
        } else {

        };
    },
    showFormSubject: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.class.WinSubject');
        win.show();
        win.center();
    },

    save: function(btn) {
        var win = btn.up('window'),
            form = win.down('form'),
            values = form.getValues(),
            record = form.getRecord(),
            store = this.getAcdClassWUStore();

        if (form.getForm().isValid()) {

            //values['acd_class_wu_detail_attributes'] = Util.getValueFromStoreDetail(this.getAcdClassWUDetailStore());
            values.is_gpa = values.is_gpa == "true" ? true : false;
            if (record) {
                record.set(values);
            } else {
                var model = Ext.create('ExtDesktop.model.acd.ClassWU');
                model.set(values);
                store.add(model);

            };
            // store.sync();
            Util.storeSync(store , win)
        } else {
            Util.msg("Please entry require field before press Save button");
        }
    },
    showForm: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.class.WinClass');
        win.show();
    },
    close: function(button) {
        var win = button.up('window');
       // this.getAcdClassWUDetailStore().removeAll();
        win.close();
    },

    showFormEdit: function(btn) {
        var rec = Util.getRecord(btn);
        if (rec) {

            // this.getAcdClassWUDetailStore().load({
            //     params: {
            //         class_id: rec.get("id")
            //     }
            // });
            var win = Ext.create('ExtDesktop.view.module.class.WinClass');

            win.down('form').loadRecord(rec);

            var values = {};
            values.is_gpa = rec.get("is_gpa") ? 'true' : 'false';
            win.down("form").getForm().setValues(values);



            win.show();
        };
        // Util.selectGrid(btn, 'ExtDesktop.view.module.class.WinClass', 'Please select item to edit');
    },


});
