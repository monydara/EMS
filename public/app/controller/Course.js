Ext.define('ExtDesktop.controller.Course', {
    extend: 'Ext.app.Controller',
    stores: [
                'acd.Course',
                
                'acd.Faculty',
                //  sub grid store
                'acd.SubjectCourse',
                'acd.BatchCourse',
                'acd.DegreeCourse',
                'acd.MajorCourse',
                //  store for combo search
                'acd.CmbSubject',
                'acd.CmbBatch',
                'acd.CmbDegree',
                'acd.CmbMajor',
                'Major'
    ],
    views: [
        'module.course.Index',
        'module.course.WinCourse',
        'search.WinSearchSubject'
    ],
    init: function(app) {

        this.control({
            'GridCourse button[action=Create]': {
                click: this.showForm
            },
            'GridCourse button[action=Delete]': {
                click: this.remove
            },
            'GridCourse textfield[name=search]': {
                change: this.search
            },
            'FrmCourse button[action=Cancel]': {
                click: this.close
            },
            'FrmCourse button[action=Save]': {
                click: this.save
            },
            'GridCourse button[action=Edit]': {
                click: this.showFormEdit
            },
            'FrmCourse button[action=Search]': {
                click: this.showSearchSubjectForm
            },

            'FrmSearchSubject textfield[name=search]': {
                change: this.searchCourse
            },
            // event select combobox in grid detail
            'FrmCourse button[action=AddSubjectToCourse]': {
                click: this.addSubjectToCourse
            },
            'FrmCourse button[action=addDegreeToCourse]': {
                click: this.addDegreeToCourse
            },
            'FrmCourse button[action=AddBatch]': {
                click: this.addBatchToCourse
            },
            'FrmCourse button[action=AddMajorToCourse]': {
                click: this.showFormMajorList
                // click: this.addMajorToCourse
            },

            // event on grid view load record
            "courseWinMajor grid":{
                itemdblclick: this.addMajorToCourse
            },
            "courseWinMajor textfield[name=search]":{
                change : this.filterMajor
            },

            "courseWinMajor button[action=Ok]":{
                click : this.addMajorToCourseByButton
            }
        });

    },
    remove:function(btn){
        var rec = Util.getRecord(btn , "Please select Course for delete");
        if (rec) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to delete this Course?', function(text) {
                if (text == 'yes') {
                    store =btn.up("grid").getStore();
                    store.remove(rec);
                    store.sync();
                }
            });
        };
    },
    search:function(field, value){
        var store= field.up("grid").store;
        var params = {
            search: value
        };
        Util.loadStore(store , params );


    },
    addMajorToCourseByButton:function(btn){
        var win = btn.up('window');
        var grid = win.down("grid");
        var textField = win.down("textfield[name=search]");
        var rec = Util.getRecord(textField,"Please select major for add to course");
        if (rec) {
            this.addMajorToCourse(grid , rec);
        };

    },
    filterMajor:function(field, value){
        var grid = field.up('grid');
        var value =  field.getValue();
        var params = {
                string:value
            };

        Util.loadStore( grid.store , params );

    },
    showFormMajorList:function(btn){

        var win = Ext.create('ExtDesktop.view.module.course.WinMajor');
        win.show();
        win.center();
    },
    searchCourse: function(field, value) {

        var store = field.up('grid').getStore();
        store.proxy.extraParams.search = value;
        store.loadPage(1);

    },
    removeSubjectRecord: function(grid, rowIndex) {
        var store = grid.getStore();
        var rec = store.getAt(rowIndex);

        if (rec.get('id') > 0) {
            rec.set('_destroy', 1);
            this.storeSubjectDetail.add(rec);
        }

        store.remove(rec);
    },
    removeMajorRecord: function(grid, rowIndex) {
        var store = grid.getStore();
        var rec = store.getAt(rowIndex);

        if (rec.get('id') > 0) {
            rec.set('_destroy', true);
            // this.storeMajorDetail.add(rec);
        }

        store.remove(rec);
    },
    removeBatchRecord: function(grid, rowIndex) {
        var store = grid.getStore();
        var rec = store.getAt(rowIndex);

        if (rec.get('id') > 0) {
            rec.set('_destroy', 1);
            this.storeBatchDetail.add(rec);
        }

        store.remove(rec);
    },
    removeDegreeRecord: function(grid, rowIndex) {
        var store = grid.getStore();
        var rec = store.getAt(rowIndex);

        if (rec.get('id') > 0) {
            rec.set('_destroy', 1);
            this.storeDegreeDetail.add(rec);
        }

        store.remove(rec);
    },
    addBatchToCourse: function(btn) {

        // var record = records[0];
        var combo = btn.up('grid').down('combo[name=comboBatch]');
        var id = combo.getValue();
        var comboStore = combo.store;
        if (id > 0) {
            var record = comboStore.getById(id);
            var store = btn.up('grid').store;
            var is_exist = false ;
            this.storeBatchDetail.each(function(rec){
                if (rec.get('name') == record.get("name")) { is_exist = true ;};
            });

            if (is_exist) {
                Ext.Msg.alert("Warning", "Items Already Exist In List");
                return 0 ;
            };
            var model = Ext.create('ExtDesktop.model.acd.BatchCourse', {
                batch_id: record.get('id'),
                code: record.get('code'),
                name: record.get('name')

            });

            this.storeBatchDetail.add(model);
            store.add(model);
        };
    },
    addMajorToCourse: function(grid , record) {

        var store = this.getAcdMajorCourseStore();
        var is_exist = false ;
        store.each(function(rec){
            if (rec.get('name') == record.get("name")) { is_exist = true ;};
        });

        if (is_exist) {
            Ext.Msg.alert("Warning", "Items Already Exist In List");
            return 0 ;
        };
        var model = Ext.create('ExtDesktop.model.acd.MajorCourse', {
            major_id: record.get('id'),
            code: record.get('code'),
            name: record.get('name')
        });

        store.add(model);
        grid.up("window").close();

    },
    addDegreeToCourse: function(btn) {
        var combo = btn.up('grid').down('combo[name=comboDegree]');
        var id = combo.getValue();
        var comboStore = combo.store;
        if (id > 0) {
            var record = comboStore.getById(id);
            var store = btn.up('grid').store;
            var is_exist = false ;
            this.storeDegreeDetail.each(function(rec){
                if (rec.get('name') == record.get("name")) { is_exist = true ;};
            });

            if (is_exist) {
                Ext.Msg.alert("Warning", "Items Already Exist In List");
                return 0 ;
            };
            var model = Ext.create('ExtDesktop.model.acd.DegreeCourse', {
                degree_id: record.get('id'),
                name: record.get('name'),
                abbr: record.get('abbr')

            });

            this.storeDegreeDetail.add(model);
            store.add(model);
        }
    },
    addSubjectToCourse: function(btn) {
        var combo = btn.up('grid').down('combo[name=comboSubject]');
        var id = combo.getValue();
        var comboStore = combo.store;
        if (id > 0) {
            var record = comboStore.getById(id);
            var store = btn.up('grid').store;
            var is_exist = false ;
            this.storeSubjectDetail.each(function(rec){
                if (rec.get('name') == record.get("name")) { is_exist = true ;};
            });

            if (is_exist) {
                Ext.Msg.alert("Warning", "Items Already Exist In List");
                return 0 ;
            };
            var model = Ext.create('ExtDesktop.model.acd.SubjectCourse', {
                acd_subject_id: record.get('id'),
                code: record.get('code'),
                name: record.get('name')

            });

            this.storeSubjectDetail.add(model);
            store.add(model);
        }
    },

    showSearchSubjectForm: function(btn) {
        var me = this;
        var nextFn = this.addSubjectToCourseGrids;
        var win = Ext.create('ExtDesktop.view.search.WinSearchSubject', {
            nextFn: nextFn,
            btn: btn
        });
        win.show();
    },
    addSubjectToCourseGrids: function(rec, btn, grid) {
        btn.up("grid").store.add(rec);
        grid.up('window').close();

    },

    save: function(btn) {

        var store = this.getAcdCourseStore();
        var me = this;
        var win = btn.up('window'),
            form = win.down('form'),
            record = form.getRecord(),
            values = form.getValues(),
            model = Ext.create('ExtDesktop.model.Course');

        if (values.course_type == "WU") {
            store = me.getAcdFacultyStore();
        };

        if (form.getForm().isValid()) {

            values['acd_course_major_attributes'] = Util.getItemStore(this.getAcdMajorCourseStore());
            if (record) {
                record.set(values);
            } else {
                model.set(values);
                store.add(model);
            }
            Util.storeSync(store , win)
        } else {
            me.msg("Please Entry Require field");
        }


    },
    afterSave: function(obj, win) {


        win.close();
    },
    showForm: function(btn) {
        var win = Ext.create('ExtDesktop.view.module.course.WinCourse');
        this.getAcdMajorCourseStore().removeAll();
        win.show();
        win.down('textfield[name=code]').focus(200, true);
        win.down('textfield[name=course_type]').setValue('TC');
    },
    close: function(button) {
        var win = button.up('window');
        win.close();
    },

    showFormEdit: function(btn) {
        var record = Util.getRecord(btn , "Please select record for edit ");

        if (record) {
            var win = Ext.create('ExtDesktop.view.module.course.WinCourse');
            var form = win.down('form');
            var id = record.get('id');
            form.loadRecord(record);
            this.getAcdMajorCourseStore().load({
                params:{
                    course_id: id
                }
            });

            win.show();
            win.center();
        };




    },


});
