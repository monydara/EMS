var acc_plan_master_id = 0;

Ext.define('ExtDesktop.controller.TuitionFeeTC', {
    extend: 'Ext.app.Controller',
    models: [
        'acc.PlanMasterM',
        'acc.FeePlanM'
    ],
    stores: [
       'acc.PlanMasterTC',
       'acc.FeePlanTC',
       'Batch',
       "combo.DegreeTC",
       'combo.CourseTC'
    ],
    views: [
        'module.tuitionFeeTC.Index',
        'module.tuitionFeeTC.WinPlanMaster',
    ],
    init: function(app) {

        this.control({
            "tuitionTC button[action=Create]": {
                click:this.showFormPlanMaster
            },
            "tuitionTC button[action=Edit]": {
                click:this.showFormEdit

            },
            "tuitionTC textfield[name=SearchMaster]": {
                change :this.filterMaster

            },
            "winPlanMasterTC button[action=Save]": {
                click:this.saveMaster
            },
            "winPlanMasterTC button[action=Cancel]": {
                click:Util.closeWindow
            },
            "tuitionTC button[action=CreateFeePlan]": {
                click:this.showFormFeePlan
            },
            "tuitionTC button[action=EditFeePlan]": {
                click:this.showFormFeePlanEdit

            },
// function for win fee plan
            "winFeePlanTC combo[name=degree_id]": {
                select : this.filterCourse
            },
            "winFeePlanTC button[action=Save]": {
                click:this.saveFeePlan
            },
            "winFeePlanTC button[action=Cancel]": {
                click:Util.closeWindow
            },
            'tuitionTC grid[name=gridPlanMaster]':{
              itemclick:this.loadStoreDetail
            },
            'tuitionTC button[action=CopyPlanFee]':{
                click :this.showFormCopyFeePlan
            },
            'tuitionTC textfield[name=searchFeePlan]':{
                change :this.filterFeePlan
            },
        });

    },
    acc_plan_master_id: 0 ,
    gridFeePlan:null ,
    filterMaster:function(field ,value){
        var store = field.up('grid').store;
        Util.loadStore( store , { text: value , type:'TC' });
        var store_detail = this.getAccFeePlanTCStore();
        store_detail.removeAll();
    },
    filterFeePlan:function(field , value){
        var store =this.getAccFeePlanTCStore();
        Util.loadStore(store , { text:value , acc_plan_master_id: this.acc_plan_master_id });
        // store.load({
        //     params:{
        //         text: value
        //     }
        // });

    },
    showFormCopyFeePlan:function(btn){
        var rec = Util.getRecord(btn , "Please select fee plan for copy ");
        var grid = btn.up('grid');
        if (rec) {
            var win = Ext.create("ExtDesktop.view.module.tuitionFeeTC.WinFeePlan",{FeePlanGrid:grid});

            win.show();
            win.down('form').getForm().setValues(rec.data);
        };
    },

    filterCourse: function(field, obj) {
        if (obj) {
            var rec = obj[0].data;
            var comboCourse = field.up('window').down('combo[name=course_id]');

            comboCourse.store.proxy.extraParams.degree_id = rec.id;

            comboCourse.store.load();
            comboCourse.setValue('');
        };
    },
    loadStoreDetail:function(field,record){

        this.acc_plan_master_id = record.data.id;
        var feePlanGrid = field.up('tuitionTC').down('grid[name=gridFeePlan]'),
        feePlanGridStore = this.getAccFeePlanTCStore();
        feePlanGridStore.proxy.extraParams = {acc_plan_master_id : record.data.id };
        feePlanGridStore.load();
        // feePlanGridStore.load({
        //     params:{
        //         acc_plan_master_id:record.data.id
        //     }
        // })
    },
	showFormPlanMaster:function(btn){
        var grid =btn.up("grid");
        console.log(grid);
        var win = Ext.create('ExtDesktop.view.module.tuitionFeeTC.WinPlanMaster',{PlanMasterGrid:grid});
        win.show();
    },
    showFormEdit:function(btn){
        var grid =btn.up("grid");
            var row =grid.getSelectionModel().getSelection();
            if(row.length){
                    var win=Ext.create('ExtDesktop.view.module.tuitionFeeTC.WinPlanMaster',{PlanMasterGrid:grid, actionButton:btn});
                    var form=win.down('form');
                    var record = row[0];
                    form.loadRecord(record);
                    win.show();
                    win.center();
            }else{
                    Util.msg('Please Select Item To Edit');
            }
    },
    showFormNewCopy:function(btn){
        var grid =btn.up("grid");
            var row =grid.getSelectionModel().getSelection();
            if(row.length){
                    var win=Ext.create('ExtDesktop.view.module.tuitionFeeTC.winPlanMasterTC',{PlanMasterGrid:grid, actionButton:btn});
                    var form=win.down('form');
                    var record = row[0];
                    form.loadRecord(record);
                    win.show();
                    win.center();
            }else{
                    Util.msg('Please Select Item To Edit');
            }
    },
    saveMaster: function(btn){
        var store= this.getAccPlanMasterTCStore(),
        win = btn.up('window'),
        //Util.save(btn,store,'acc.PlanMasterM');
        //var win = btn.up('window')
        form   = win.down('form'),
        record = form.getRecord(),
        values = form.getValues();


        var model=Ext.create('ExtDesktop.model.acc.PlanMasterM');
        if(form.getForm().isValid()){

                if(!record){
                    console.log('Add New Values ');
                    model.set(values);
                    store.add(model);
                    store.sync();
                }else{

                    var actButton = win.actionButton;
                    if(actButton.action == 'Edit'){
                        console.log("record edit");
                        record.set(values);
                        store.sync();
                    }else{
                        model.set(values);
                        store.add(model);
                        var iRecord=0;
                        store.sync({callback:function(pStore,pOperation){
                        iRecord = pStore.proxy.reader.rawData.data.id;
                            console.log("Inside callback:"+iRecord);
                            Util.ajax("acc_fee_plans/copy",{acc_plan_master_id : record.get('id'),new_acc_plan_master_id:iRecord});
                        }});
                        console.log("Outsite callback:"+iRecord);
                        //console.log(store.data.items[c-1].data.id);
                        //Copy fee plan which belong to master plan
                    }
                }

                if(win){
                    win.close();
                }

                Ext.MessageBox.show(
                {
                    title : 'Saved',
                    msg :  'Record Save Succeed.',
                    icon : Ext.MessageBox.INFO,
                    buttons : Ext.Msg.OK
                });

        }else{
                Util.msg("Incorrect Data Entry!");
        }
        setTimeout(function(){
            store.load();
        },1000);


        //Clear selection
        var grid =win.PlanMasterGrid;
        grid.selModel.deselectAll();
    },
    showFormFeePlan:function(btn){
        var grid =btn.up("grid");
        var me = this ;
        if (me.acc_plan_master_id > 0){
            var win = Ext.create('ExtDesktop.view.module.tuitionFeeTC.WinFeePlan',{FeePlanGrid:grid});
            win.show();
            win.down('hiddenfield[name=acc_plan_master_id]').setValue(me.acc_plan_master_id);
        }else{
            console.log("============== this is show id in browser");

        }
    },
    showFormFeePlanEdit:function(btn){
            var grid =btn.up("gridpanel");
            var row =grid.getSelectionModel().getSelection();
            if(row.length){
                    var win=Ext.create('ExtDesktop.view.module.tuitionFeeTC.WinFeePlan',{FeePlanGrid:grid});
                    var form=win.down('form');
                    var record = row[0];
                    console.log(record);
                    form.loadRecord(record);
                    win.show();
                    win.center();
            }else{
                    Util.msg('Please Select Item To Edit');
            }
    },
    saveFeePlan: function(btn){

        var store= this.getAccFeePlanTCStore();
        win = btn.up('window');
        Util.save(btn,store,'acc.FeePlanM');
        var me = this ;
        setTimeout(function(){
            me.getAccFeePlanTCStore().load({
                params:{
                     acc_plan_master_id:me.acc_plan_master_id
                }
            });
        },2000);
        var grid =win.FeePlanGrid;
        grid.selModel.deselectAll();
        // grid.getSelectionModel().select(0, true);
    }

});

