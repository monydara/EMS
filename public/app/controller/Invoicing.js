Ext.define('ExtDesktop.controller.Invoicing', {
    extend: 'Ext.app.Controller',
    stores: [
        "combo.GroupAccount",
        "acc.BatchProcess", 
        "acc.GroupAccountAdmission",
        "acc.Invoice"
    ],
    views: [
        'module.invoicing.Index',
        'module.invoicing.WinBatchInvoice',
        'module.invoicing.WinProcessInvoice',
    ],
    init: function(app) {
        this.control({
            'BatchProcess button[action=Create]': {
                click: this.showWinBatchProcess
            },
            'BatchProcess button[action=Edit]': {
                click: this.showWinEditBatchProcess
            },
            'BatchProcess button[action=Invoice]': {
                click: this.showWinProcessInvoice
            },
            "WinBatchInvoice combo[name=group_account_id]":{
                select: this.filterAdmission
            },
            "WinBatchInvoice button[action=Save]":{
                click: this.saveBatch
            },
            "WinProcessInvoice button[action=Process]":{
                click : this.processInvoice
            },
             "WinProcessInvoice button[action=Print]":{
                click : this.printBatchInvoice
            },
            "WinProcessInvoice button[action=Save]":{
                click : this.saveProcessInvoice
            }
        });
    },
    
    showWinEditBatchProcess:function(btn){
        var rec = Util.getRecord(btn , "Please select batch Process for edit" );
        if (rec) {
            if (rec.get("status") == "N") {
                var win = Ext.create('ExtDesktop.view.module.invoicing.WinBatchInvoice');
                win.down("grid").getStore().removeAll();

                win.show();
                win.center();
                win.down("textfield").focus(true ,300)
                
            }else{
                Util.msg("Batch Process can edit in status new only ")
            }
        }
    },
    printBatchInvoice:function(btn){
        var win = btn.up("window"); 
        var form =win.down("form"); 
        var rec = form.getForm().getRecord(); 
        window.open("AccInvoices/print_batch_invoice?id="+rec.get("id"));

    },
    saveProcessInvoice:function(btn){
        var me = this; 
        Ext.MessageBox.confirm('Confirm', 'Are you sure to save this batch invoice?', function(text) {
            if (text == 'yes') {
                me.startProcessInvoice(btn, true);
            }
        });
    },
    processInvoice:function(btn){
        var me = this; 
        me.startProcessInvoice(btn, false);
        btn.setDisabled(true);
            
    },

    startProcessInvoice:function(btn , isSave){
        var win = btn.up("window"); 
        var form =win.down("form"); 
        var rec = form.getForm().getRecord(); 
        var values = form.getForm().getValues();
        var store = this.getAccInvoiceStore();
        if (isSave == true) {
            var model = Ext.create("ExtDesktop.model.acc.Invoice",values);
            
            store.add(model)
            Util.storeSync(store);
            
        }else{
            
            Util.ajax("/AccInvoices/process_invoice_simulator", values , this.afterProcessInvoice,{store:store , win:win })
        }
        
        
    },
    afterProcessInvoice:function(data ,obj ){
        data.data.forEach( function(values) {            
            var model = Ext.create("ExtDesktop.model.acc.Invoice",values);
                
            obj.store.add(model)
        });
        obj.win.down("textfield[name=total_invoice]").setValue(data.total_invoice);
    },  
    saveBatch:function(btn){

        var store = this.getAccBatchProcessStore(); 
        Util.save(btn , store , "acc.BatchProcess");
    },
    filterAdmission:function(field , records){
        var rec = records[0];
        var grid = field.up("window").down("grid"); 
        var store = grid.getStore();
        store.proxy.extraParams.group_account_id = rec.get("id");
        store.load();

    },
    showWinProcessInvoice: function(btn) {
        var rec = Util.getRecord(btn , "Please select batch process for issue invoice");
        if (rec) {            
            var win = Ext.create('ExtDesktop.view.module.invoicing.WinProcessInvoice');
            win.show();
            win.center();
            win.down("form").getForm().loadRecord(rec);
            win.down("hiddenfield[name=billing_process_id]").setValue(rec.get("id"));
            win.down("hiddenfield[name=group_account_id]").setValue(rec.get("group_account_id"));
            var store = this.getAccInvoiceStore();
            store.proxy.extraParams.billing_process_id = rec.get("id");
            store.load();

            if(rec.get("status") != "N"){
                win.down("button[action=Process]").setDisabled(true);
            }
        }
    },

    showWinBatchProcess: function() {
        var win = Ext.create('ExtDesktop.view.module.invoicing.WinBatchInvoice');
        win.down("grid").getStore().removeAll();

        win.show();
        win.center();
        win.down("textfield").focus(true ,300)
    }

});