Ext.define('ExtDesktop.controller.DiscountItemC', {
    extend: 'Ext.app.Controller',
    stores: [
        'DiscountItemS',
        'DiscountItemDetailS',
        'DiscountTypeS',

        'Course',
        "acc.DiscountCourse",

    ],
    model: [
        'DiscountItemM'
    ],
    views: [
        'module.discountItemC.Index',
        'module.discountItemC.FmdiscountItem',
        'module.discountItemC.FmSearchCourse',
        'search.WinSearchAllCourse',
    ],

    init: function(app) {
        this.control({

            'griddiscountItem button[action=Edit]': {
                click: this.showFormEdit
            },
            'griddiscountItem grid': {
                itemdblclick: function(field) {
                    this.showForm(field.up('griddiscountItem').down('button[action=Edit]'), view = true);
                }
            },
            'griddiscountItem button[action=Create]': {
                click: this.showForm
            },
            'fmdiscountItem button[action=Save]': {
                click: this.save
            },
            'fmdiscountItem button[action=Cancel]': {
                click: this.closeForm
            },
            'fmdiscountItem button[action=AddCourse]': {
                click: this.showFormAddCourse
            },
            'fmdiscountItem button[action=RemoveCourse]': {
                click: this.removeCourse
            },


            'WinSearchCourse textfield[name=search]': {
                change: this.filterCourse
            },
            'WinSearchCourse grid': {
                itemdblclick: this.addCourseToGridDiscountDetail
            },
            'WinSearchCourse button[action=Ok]': {
                click: this.clickAddCourseToGridDiscountDetail
            },
            'WinSearchCourse button[action=Cancel]': {
                click: Util.closeWindow
            }
        });
    },
    gridDiscount: null,
    storeDiscountItemDetail: Ext.create('ExtDesktop.store.DiscountItemDetailS'),
    mainForm: null,
    removeCourse: function(btn) {

        var record = Util.getRecord(btn);
        var store = this.getAccDiscountCourseStore();
        if (record) {

            Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this course?', function(btn) {
                if (btn == 'yes') {
                    if (record.get('id') > 0) {
                        record.set("_destroy", true);
                    } else {
                        store.remove(record);
                    };
                }
            });
        };
    },
    clickAddCourseToGridDiscountDetail: function(btn) {
        var win = btn.up('window'),
            grid = win.down('grid'),
            field = grid.down('textfield[name=search]'),
            me = this;
        var record = Util.getRecord(field, "Please Select Record");
        if (record) {
            me.addCourseToGridDiscountDetail(grid, record);
        };

    },
    addCourseToGridDiscountDetail: function(grid, record) {
        var win = grid.up('window');

        var store = this.getAccDiscountCourseStore();
        var model = Ext.create('ExtDesktop.model.acc.DiscountCourse', {
            "course_id": record.get('id'),
            "code": record.get('code'),
            'abbr': record.get('abbr'),
            'name': record.get('name'),
            'course_type': record.get('course_type'),
        });
        store.add(model);
        win.close();

    },
    filterCourse: function(field, value) {
        var store = this.getCourseStore();
        Util.loadStore(store, {
            search: value
        });

    },
    showFormAddCourse: function(btn) {
        this.mainForm = btn.up('window');
        var win = Ext.create("ExtDesktop.view.module.chargeItemC.FmSearchCourse");
        win.show();
        win.center();
    },

    showForm: function(btn) {
        this.gridDiscount = btn.up('grid');
        var win = Ext.create('ExtDesktop.view.module.discountItemC.FmdiscountItem');
        this.getDiscountItemDetailSStore().removeAll();
        this.getAccDiscountCourseStore().removeAll();
        win.show();
        win.center();
    },
    showFormEdit: function(btn) {
        var grid = btn.up("gridpanel");
        this.gridDiscount = btn.up('grid');

        var row = grid.getSelectionModel().getSelection();
        if (row.length) {
            var win = Ext.create('ExtDesktop.view.module.discountItemC.FmdiscountItem');
            var form = win.down('form');
            var record = row[0];

            storeDiscountItemDetail: Ext.create('ExtDesktop.store.DiscountItemDetailS');

            //Load Details Store before form load
            this.getDiscountItemDetailSStore().load({
                params: {
                    id: record.data.id
                }
            });

            this.getAccDiscountCourseStore().load({
                params:{
                    discount_item_id : record.get("id")
                }
            });
            form.loadRecord(record);
            win.show();
            win.center();
        } else {
            //this.msg('Please Select Record Before Select Edit');
            Ext.MessageBox.show({
                title: 'Selection',
                msg: 'Please Select Record Before Select Edit!',
                icon: Ext.MessageBox.INFO,
                buttons: Ext.Msg.OK
            });
        }
    },
    closeForm: function(btn) {
        btn.up('window').close();
    },
    save: function(btn) {
        model = "DiscountItemM";
        var store = this.getDiscountItemSStore();

        var me = this;
        var win = btn.up('window'),
            form = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();
        delete values['name'];

        var model = Ext.create('ExtDesktop.model.' + model);
        if (form.getForm().isValid()) {

            var storeDetail = this.getDiscountItemDetailSStore();
            var courseDetailStore = this.getAccDiscountCourseStore();
            values['acc_discount_item_details_attributes'] = Util.getItemStore(storeDetail);
            values['acc_discount_course_attributes'] = Util.getItemStore(courseDetailStore);

            if (!record) {
                
                model.set(values);
                store.add(model);
            } else {
                record.set(values);
            }
            store.sync();
            me.gridDiscount.selModel.deselectAll();
            if (win) {
                win.close();
            }

            Ext.MessageBox.show({
                title: 'Saved',
                msg: 'Record Save Succeed.',
                icon: Ext.MessageBox.INFO,
                buttons: Ext.Msg.OK
            });
            this.getDiscountItemSStore().load();
        } else {
            //me.msg("Please Entry Require field");	
            Ext.MessageBox.show({
                title: 'Required',
                msg: 'Please Entry Require field!',
                icon: Ext.MessageBox.INFO,
                buttons: Ext.Msg.OK
            });
        }

        function setValueToDetailStore(storeName, nameSubStore) {
            var storeDetail = me[storeName];
            var data = Ext.pluck(storeDetail.data.items, 'data');
            values[nameSubStore] = data;
        }
    },

});