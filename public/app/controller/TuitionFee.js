var acc_plan_master_id = 0;

Ext.define('ExtDesktop.controller.TuitionFee', {
    extend: 'Ext.app.Controller',
    models: [
        "acc.FeePlan"
    ],
    stores: [

        "acc.FeeCatalogue",
        "acc.FeePlanTC",
        "acc.FeePlanWU",
        "acc.FeeCatDetailWU",
        "acc.FeeCatDetailTC",

        "acd.Term",
        "combo.TuitionTime",
        "Batch",
        "combo.CycleType",
        // "combo.PlanFee",
        "acc.Currency",
        "combo.Batch",
        "combo.DegreeTC",
        "combo.CourseTC",
        "combo.DegreeWU",
        "combo.CourseWU",
        "combo.Term",


    ],
    views: [
        'module.tuitionFee.WinFeeCatalogue',
        "module.tuitionFee.WinPlanDetail",
        // == module TC 
        "module.tuitionFee.GridPlanTC",
        "module.tuitionFee.GridPlanTcDetail",
        "module.tuitionFee.WinPlanTC",

        // == module WU
        "module.tuitionFee.GridPlanWU",
        "module.tuitionFee.GridPlanWuDetail",
        "module.tuitionFee.WinPlanWU",
        "module.tuitionFee.WinPlanWUCopy"

    ],
    init: function(app) {

        this.control({

            "IndexFeeCatalogue textfield[name=Search]": {
                change: this.filterFeeCatalogue
            },
            "IndexFeeCatalogue button[action=Create]": {
                click: this.createCatalogue
            },
            "IndexFeeCatalogue button[action=Edit]": {
                click: this.editCatalogue
            },
            "IndexFeeCatalogue button[action=Delete]": {
                click: this.deleteCatalogue
            },
            "IndexFeeCatalogue button[action=Detail]": {
                click: this.showPlanDetail
            },
            "IndexFeeCatalogue button[action=Copy]": {
                click: this.createWithCopy
            },

            "winFeeCatalogue button[action=Cancel]": {
                click: Util.closeWindow
            },
            "winFeeCatalogue button[action=Save]": {
                click: this.saveCatalogue
            },
            // =========== win plan detail 

            "winPlanDetail button[action=Cancel]": {
                click: Util.closeWindow
            },
            "winPlanDetail button[action=Save]": {
                click: this.savePlanDetail
            },
            "winPlanDetail button[action=addPlanDetailWU]": {
                click: this.addPlanDetailWU
            },
            "winPlanDetail button[action=addPlanDetailTC]": {
                click: this.addPlanDetailTC
            },
            //===== even on plan TC 
            "tuitionFeeGridPlanTC button[action=Create]": {
                click: this.showFormTc
            },
            "tuitionFeeGridPlanTC button[action=Edit]": {
                click: this.showFormTcEdit
            },
            "tuitionFeeGridPlanTC button[action=Copy]": {
                click: this.showFormTcCopy
            },
            "tuitionFeeGridPlanTC combo[name=tuition_time_id]": {
                select: this.filterPlanTC
            },
            "tuitionFeeGridPlanTC": {
                itemclick: this.loadPlanTCDetail
            },
            "tuitionFeeGridPlanTC button[action=Active]": {
                click: this.activePlan
            },
            "tuitionFeeGridPlanTC button[action=Deactive]": {
                click: this.deactivePlan
            },
            "tuitionFeeGridPlanTC button[action=Delete]": {
                click: this.deletePlan
            },
            //===== even on plan WU 
            "tuitionFeeGridPlanWU button[action=Create]": {
                click: this.showFormWU
            },
            "tuitionFeeGridPlanWU button[action=Copy]": {
                click: this.showFormWUCopy
            },
            "tuitionFeeGridPlanWU button[action=Edit]": {
                click: this.showFormWUEdit
            },
            "tuitionFeeGridPlanWU combo[name=batch_id]": {
                select: this.filterPlanWU
            },
            "tuitionFeeGridPlanWU": {
                itemclick: this.loadPlanWUDetail
            },
            "tuitionFeeGridPlanWU button[action=Active]": {
                click: this.activePlan
            },
            "tuitionFeeGridPlanWU button[action=Deactive]": {
                click: this.deactivePlan
            },
            "tuitionFeeGridPlanWU button[action=Delete]": {
                click: this.deletePlan
            },
            // == even on grid tc deatil 
            "tuitionFeeGridPlanTcDetail button[action=Create]": {
                click: this.addPlanTcDetail
            },
            "tuitionFeeGridPlanTcDetail button[action=Active]": {
                click: this.activePlanDetail
            },
            "tuitionFeeGridPlanTcDetail button[action=Deactive]": {
                click: this.deactivePlanDetail
            },
            "tuitionFeeGridPlanTcDetail button[action=Delete]": {
                click: this.deletePlanDetail
            },  
            // == even on grid wu deatil 
            "tuitionFeeGridPlanWuDetail button[action=Create]": {
                click: this.addPlanWuDetail
            },
            "tuitionFeeGridPlanWuDetail button[action=Active]": {
                click: this.activePlanDetail
            },
            "tuitionFeeGridPlanWuDetail button[action=Deactive]": {
                click: this.deactivePlanDetail
            },
            "tuitionFeeGridPlanWuDetail button[action=Delete]": {
                click: this.deletePlanDetail
            },
            // == even on window tc master 
            'tuitionFeeWinPlanTC combo[name=degree_id]': {
                select: ExtDesktop.app.getController("Admission").filterCourse
            },
            "tuitionFeeWinPlanTC button[action=Save]": {
                click: this.saveTCPlan
            },
            // == even on window WU master
            'tuitionFeeWinPlanWU combo[name=degree_id]': {
                select: ExtDesktop.app.getController("AdmissionWU").filterCourse
            },
            "tuitionFeeWinPlanWU button[action=Save]": {
                click: this.saveWUPlan
            },

        });


    },
    tmpPlanId: null,
    filterCourse: function(field, record) {
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
    deletePlanDetail:function(btn){
         var store = btn.up("grid").getStore();
        var rec = Util.getRecord(btn, "Please select plan detail for delete");
        if (rec) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to deactive this plan detail?', function(btn) {
                if (btn == 'yes') {
                   store.remove(rec);
                    Util.storeSync(store);
                }
            });
        }
    },
    deactivePlanDetail:function(btn){
        var store = btn.up("grid").getStore();
        var rec = Util.getRecord(btn, "Please select plan detail for deactive account");
        if (rec.get("is_active") == true) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to deactive this plan detail?', function(btn) {
                if (btn == 'yes') {
                    rec.set("is_active", false);
                    Util.storeSync(store);
                }
            });
        } else {
            Util.msg("This record is already deactive");
        }
    },
    activePlanDetail: function(btn) {
        var store = btn.up("grid").getStore();
        var rec = Util.getRecord(btn, "Please select plan detail for active account");
        if (rec.get("is_active") == false) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure to active this plan detail?', function(btn) {
                if (btn == 'yes') {
                    rec.set("is_active", true);
                    Util.storeSync(store);
                }
            });
        } else {
            Util.msg("This record is already active");
        }
    },
    addPlanWuDetail: function(btn) {
        var me = this;
        var store = this.getAccFeeCatDetailWUStore();
        var model = Ext.create("ExtDesktop.model.acc.FeeCatDetailTC", {
            plan_id: me.tmpPlanId,
            fee_amount: 0,
            is_active: true,
            is_deleted: false

        });
        if (me.tmpPlanId > 0) {

            store.add(model);
        } else {
            Util.msg("Please select plan before add plan detail");
        }
    },
    addPlanTcDetail: function(btn) {
        var me = this;
        var store = this.getAccFeeCatDetailTCStore();
        var model = Ext.create("ExtDesktop.model.acc.FeeCatDetailTC", {
            plan_id: me.tmpPlanId,
            fee_amount: 0,
            is_active: true,
            is_deleted: false

        });
        if (me.tmpPlanId > 0) {

            store.add(model);
        } else {
            Util.msg("Please select plan before add plan detail");
        }
    },
    deletePlan: function(btn) {
        var rec = Util.getRecord(btn, "Please select record for delete");
        var store = btn.up("grid").getStore();
        if (rec) {
            Ext.MessageBox.confirm('Confirm', 'Are you sure deactive this plan?', function(btn) {
                if (btn == 'yes') {
                    rec.set("is_delleted", true);
                    Util.storeSync(store);
                    // store.sync();
                }
            });
        }
    },
    deactivePlan: function(btn) {
        var store = btn.up("grid").getStore();
        var rec = Util.getRecord(btn, "Please select record for active plan");
        if (rec) {
            if (rec.get("is_active") == true) {
                Ext.MessageBox.confirm('Confirm', 'Are you sure deactive this plan?', function(btn) {
                    if (btn == 'yes') {
                        rec.set("is_active", false);
                        Util.storeSync(store);
                    }
                });
            } else {
                Util.msg("This record is already deactive");
            }
        }
    },
    activePlan: function(btn) {
        var store = btn.up("grid").getStore();
        var rec = Util.getRecord(btn, "Please select record for active plan");
        if (rec) {

            if (rec.get("is_active") == false) {
                Ext.MessageBox.confirm('Confirm', 'Are you sure to active this plan?', function(btn) {
                    if (btn == 'yes') {
                        rec.set("is_active", true);
                        Util.storeSync(store);
                    }
                });
            } else {
                Util.msg("This record is already deactive");
            }
        }
    },

    loadPlanTCDetail: function(grid, rec, b, c) {
        var planId = rec.get("id");
        var store = this.getAccFeeCatDetailTCStore();
        this.tmpPlanId = planId;
        store.proxy.extraParams.plan_id = planId;
        store.load();
    },
    loadPlanWUDetail: function(grid, rec, b, c) {
        var planId = rec.get("id");
        var store = this.getAccFeeCatDetailWUStore();
        this.tmpPlanId = planId;
        store.proxy.extraParams.plan_id = planId;
        store.load();
    },
    filterPlanTC: function(combo, records) {
        var rec = records[0];
        var store = this.getAccFeePlanTCStore();
        store.proxy.extraParams.tuition_time_id = rec.get("id");
        store.load()
    },
    filterPlanWU: function(combo, records) {
        var rec = records[0];
        var store = this.getAccFeePlanWUStore();
        store.proxy.extraParams.batch_id = rec.get("id");
        store.load()
    },
    saveTCPlan: function(btn) {
        var store = this.getAccFeePlanTCStore();
        Util.save(btn, store, "acc.FeePlan");
    },
    saveWUPlan: function(btn) {
        
        var store = this.getAccFeePlanWUStore();
        Util.save(btn, store, "acc.FeePlan");
    },
    showFormTc: function(btn) {
        var grid = btn.up("grid");
        var tuitionTimeField = grid.down("combo[name=tuition_time_id]");
        var tuitionTimeId = tuitionTimeField.getValue();
        if (tuitionTimeId > 0) {

            var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanTC");
            win.show();
            win.center();
            // === set value to from 

            var tuitionTimeName = tuitionTimeField.getRawValue();
            var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
            win.down("hiddenfield[name=tuition_time_id]").setValue(tuitionTimeId);
            win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
            win.down("textfield[name=tuition_time_name]").setValue(tuitionTimeName);
            win.down("textfield[name=plan_code]").focus(300, true);

        } else {
            Util.msg("Please select term for add plan ");
        }
    },
    showFormTcEdit: function(btn) {
        var rec = Util.getRecord(btn , "Please select plan for edit ");
        if (rec) {            
            var grid = btn.up("grid");
            var tuitionTimeField = grid.down("combo[name=tuition_time_id]");
            var tuitionTimeId = tuitionTimeField.getValue();
            if (tuitionTimeId > 0) {

                var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanTC");
                win.show();
                win.center();
                win.down("form").getForm().loadRecord(rec);
                // === set value to from 

                var tuitionTimeName = tuitionTimeField.getRawValue();
                var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
                win.down("hiddenfield[name=tuition_time_id]").setValue(tuitionTimeId);
                win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
                win.down("textfield[name=tuition_time_name]").setValue(tuitionTimeName);
                win.down("textfield[name=plan_code]").focus(300, true);

            } else {
                Util.msg("Please select term for add plan ");
            }
        }
    },
    showFormTcCopy: function(btn) {
        var rec = Util.getRecord(btn , "Please select plan for Copy");
        if (rec) {            
            var grid = btn.up("grid");
            var tuitionTimeField = grid.down("combo[name=tuition_time_id]");
            var tuitionTimeId = tuitionTimeField.getValue();
            if (tuitionTimeId > 0) {

                var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanTCCopy");
                win.show();
                win.center();
                
                // === set value to from 

                win.down("form").getForm().setValues(rec.getData());
                win.down("hiddenfield[name=copy_id]").setValue(rec.get("id"));

                var tuitionTimeName = tuitionTimeField.getRawValue();
                var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
                win.down("hiddenfield[name=tuition_time_id]").setValue(tuitionTimeId);
                win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
                win.down("textfield[name=tuition_time_name]").setValue(tuitionTimeName);
                win.down("textfield[name=plan_code]").focus(300, true);

            } else {
                Util.msg("Please select term for add plan ");
            }
        }
    },
    showFormWU: function(btn) {
        var grid = btn.up("grid");
        var batchField = grid.down("combo[name=batch_id]");
        var batchId = batchField.getValue();
        if (batchId > 0) {

            var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanWU");
            win.show();
            win.center();
            // === set value to from 

            var batchName = batchField.getRawValue();
            var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
            win.down("hiddenfield[name=batch_id]").setValue(batchId);
            win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
            win.down("textfield[name=batch_name]").setValue(batchName);
            win.down("textfield[name=plan_code]").focus(300, true);

        } else {
            Util.msg("Please select batch for add plan ");
        }
    },
    showFormWUEdit: function(btn) {
        var rec= Util.getRecord(btn , "Please select plan for edit");
        if (rec) {            
            var grid = btn.up("grid");
            var batchField = grid.down("combo[name=batch_id]");
            var batchId = batchField.getValue();
            if (batchId > 0) {

                var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanWU");
                win.show();
                win.center();
                // === set value to from 
                win.down("form").getForm().loadRecord(rec);

                var batchName = batchField.getRawValue();
                var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
                win.down("hiddenfield[name=batch_id]").setValue(batchId);
                win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
                win.down("textfield[name=batch_name]").setValue(batchName);
                win.down("textfield[name=plan_code]").focus(300, true);

            } else {
                Util.msg("Please select batch for add plan ");
            }
        }
    },
    showFormWUCopy: function(btn) {
        var rec= Util.getRecord(btn , "Please select plan for copy");
        if (rec) {            
            var grid = btn.up("grid");
            var batchField = grid.down("combo[name=batch_id]");
            var batchId = batchField.getValue();
            if (batchId > 0) {

                var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanWUCopy");
                win.show();
                win.center();
                // === set value to from 
                win.down("form").getForm().setValues(rec.getData());
                win.down("hiddenfield[name=copy_id]").setValue(rec.get("id"));

                var batchName = batchField.getRawValue();
                var catalogueId = grid.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
                win.down("hiddenfield[name=batch_id]").setValue(batchId);
                win.down("hiddenfield[name=plan_cat_id]").setValue(catalogueId);
                win.down("textfield[name=batch_name]").setValue(batchName);
                win.down("textfield[name=plan_code]").focus(300, true);

            } else {
                Util.msg("Please select batch for add plan ");
            }
        }
    },
    createWithCopy: function(btn) {
        var rec = Util.getRecord(btn, "Please select fee cataloge for copy");
        if (rec) {
            var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinFeeCatalogue");
            win.down("form").getForm().setValues(rec.data);
            win.down("hiddenfield[name=catalogue_id]").setValue(rec.get("id"));
            win.show();
            win.center();
        }
    },
    filterFeeCatalogue: function(field, value) {
        var store = field.up("grid").getStore();
        Util.loadStore(store, {
            text: value
        })
    },

    addPlanDetailTC: function(btn) {
        var store = this.getAccFeeCatDetailTCStore();
        var model = Ext.create("ExtDesktop.model.acc.FeeCatDetailTC");
        var catId = btn.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
        model.set("plan_cat_id", catId);
        store.add(model);
    },
    addPlanDetailWU: function(btn) {
        var store = this.getAccFeeCatDetailWUStore();
        var model = Ext.create("ExtDesktop.model.acc.FeeCatDetailWU");
        var catId = btn.up("window").down("hiddenfield[name=plan_cat_id]").getValue();
        model.set("plan_cat_id", catId);
        store.add(model);

    },
    savePlanDetail: function(btn) {
        var win = btn.up("window");
        var storeWU = this.getAccFeeCatDetailWUStore();
        var storeTC = this.getAccFeeCatDetailTCStore();
        Util.storeSync(storeWU)
        Util.storeSync(storeTC)

    },
    showPlanDetail: function(btn) {
        var rec = Util.getRecord(btn, "Please select catalogue for show plan detail");
        if (rec) {

            var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinPlanDetail");
            win.show();
            win.center();
            var catId = rec.get("id");
            win.down("hiddenfield[name=plan_cat_id]").setValue(catId);
            var planTC = this.getAccFeePlanTCStore();
            var planWU = this.getAccFeePlanWUStore();

            // var storeWU = this.getAccFeeCatDetailWUStore();
            // var storeTC = this.getAccFeeCatDetailTCStore();
            planTC.proxy.extraParams.plan_cat_id = catId;
            planWU.proxy.extraParams.plan_cat_id = catId;
            planTC.removeAll();
            planWU.removeAll();
            this.getAccFeeCatDetailWUStore().removeAll();
            this.getAccFeeCatDetailTCStore().removeAll();
        
        };

    },
    deleteCatalogue: function(btn) {

        Util.deleteRecord(btn);
    },
    createCatalogue: function(btn) {
        var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinFeeCatalogue");
        win.show();
        win.center();
    },
    editCatalogue: function(btn) {
        var rec = Util.getRecord(btn, "Please select catalogue for edit");
        if (rec) {
            var win = Ext.create("ExtDesktop.view.module.tuitionFee.WinFeeCatalogue");
            win.down("form").getForm().loadRecord(rec);
            win.show();
            win.center();
        };

    },
    saveCatalogue: function(btn) {

        var store = this.getAccFeeCatalogueStore();
        Util.save(btn, store, "acc.FeeCatalogue")

    }


});