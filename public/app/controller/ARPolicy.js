Ext.define('ExtDesktop.controller.ArPolicy', {
    extend: 'Ext.app.Controller',
    stores: [
      "acc.CreditControl" , 
      "acc.InvoiceRule"
    ],
    views: [
          'module.cashDrawerManager.Index',
          'module.arPolicy.WinAR', 
          'module.arPolicy.WinInvoiceRule'
                
    ],  
    init: function(app) {
        
        this.control({
          'arPolicyIndex grid[name=ARPolicy]':{
                itemclick: this.loadDetailStore
          },
          // add AR Rule
          'arPolicyIndex button[action=addAR]':{
              click : this.showFormAddAR
          },
          'arPolicyIndex textfield[name=searchARpolicy]':{
              change : this.searchARpolicy
          },
          'arPolicyIndex button[action=DeleteAR]':{
              click : this.delteARPolicy
          },
          'arPolicyIndex button[action=EditAR]':{
              click : this.showFormEditAR
          },
          // add Invoice Rule
          'arPolicyIndex button[action=addInvoiceRule]':{
              click : this.showFormAddInvoiceRule
          },

          //event on AR form 
          'arPolicyWinAR button[action=Save]':{
              click : this.saveAR
          },
          'arPolicyWinAR button[action=Cancel]':{
              click : Util.closeWindow
          }, 
          // event on Invoice Rule
          "arPolicyWinInvoiceRule button[action=Cancel]":{
            click : Util.closeWindowe
          },
          "arPolicyWinInvoiceRule button[action=Save]":{
            click : this.saveInvoiceRule
          },
          "arPolicyIndex button[action=deleteInvoiceRule]":{
            click : this.deletInvoiceRule
          },
          'arPolicyIndex textfield[name=invoiceRule]':{
              change : this.searchInvoiceRule
          },
          'arPolicyIndex button[action=editInvoiceRule]':{
              click : this.editInvoiceRule
          }
        });        
          
    },
    gridArPolicy:null ,
    gridInvoiceRule:null ,

    editInvoiceRule:function(btn){
         this.gridArPolicy = btn.up("grid");
        var record = Util.getRecord(btn,"Please Select Invoice Rule To Edit");
        if (record) {
            var win = Ext.create("ExtDesktop.view.module.arPolicy.WinInvoiceRule");
            win.show();
            win.center();
            win.down('form').getForm().loadRecord(record);
            var values ={};
            values.is_active = record.get("is_active")  == true ? "T": "F";
            win.down('form').getForm().setValues(values);
        };
    },
    searchInvoiceRule:function(field , value){
        var store = this.getAccInvoiceRuleStore();
        store.load({
          params:{
            text:value
          }
        });
    },
    deletInvoiceRule:function(btn){
        var record = Util.getRecord(btn , "Please select invoice rule for delete");
        var store = this.getAccInvoiceRuleStore();
        if (record) {
             Ext.MessageBox.confirm('Confirm', 'Are you sure you want to delete this record?', function(btn) {
                if (btn == 'yes') {
                  record.set("is_del", true );
                  store.sync();
                  store.load();
                }
            });
        };
    },
    saveInvoiceRule:function(btn){
         var win = btn.up('window');
        var form = win.down('form'), 
        values = form.getValues(),
        record = form.getRecord();
        var store = this.getAccInvoiceRuleStore();
        
        values.is_active = values.is_active == "T" ? true:false;
       
        if (record) {
            record.set(values);
            //this.gridInvoiceRule.selModel.deselectAll()
        }else{
            var model = Ext.create("ExtDesktop.model.acc.InvoiceRule");
            model.set(values);
            store.add(model);
        };
     
        store.sync({
          success: function(batch, options) {
              win.close();
              Ext.MessageBox.show({
                title: 'Saved',
                msg: 'Record Save Succeed.',
                icon: Ext.MessageBox.INFO,
                buttons: Ext.Msg.OK
              });
              store.load({
                 params:{
                    ar_policy_id: values.credit_control_id
                  }
              });
          },
          failure: function(batch, options) {
              win.close();
              store.rejectChanges();
              console.log(batch.proxy.reader.rawData);
              var msg = batch.proxy.reader.rawData.message;
              Ext.MessageBox.show({
                title: 'Error',
                msg: msg,
                icon: Ext.MessageBox.ERROR,
                buttons: Ext.Msg.OK
              });
          },
          callback: function(batch, options) {

          },
          scope: this
        });
    },
    showFormAddInvoiceRule:function(btn){
      var field = btn.up("arPolicyIndex").down("textfield[name=searchARpolicy]");
      var record =Util.getRecord(field , "Select AR Policy before select detail  ");
      if (record) {
          var win = Ext.create("ExtDesktop.view.module.arPolicy.WinInvoiceRule");
          this.gridInvoiceRule =btn.up("grid");
          win.down("hiddenfield[name=credit_control_id]").setValue(record.get('id'));
          win.show();
          win.center();
      };
    },
    searchARpolicy:function(field , value){
        var store = this.getAccCreditControlStore();
        Util.loadStore(store , { text:value});
    },
    delteARPolicy:function(btn ){
        var store = this.getAccCreditControlStore();

        var record =Util.getRecord(btn,"Please select record to delete");
        if (record) {
          Ext.MessageBox.confirm('Confirm', 'Are you sure you want to delete this record?', function(btn) {
            if (btn == 'yes') {
              record.set("is_del", true );
              store.sync();
              store.load();
            }
          });
        };
    },
    showFormEditAR:function(btn){
        this.gridArPolicy = btn.up("grid");
        var record = Util.getRecord(btn,"Please Select AR Policy To Edit");
        if (record) {
            var win = Ext.create("ExtDesktop.view.module.arPolicy.WinAR");
            win.show();
            win.center();
            win.down('form').getForm().loadRecord(record);
            var values ={};
            values.is_active = record.get("is_active")  == true ? "T": "F";
            win.down('form').getForm().setValues(values);
        };
    },
    showFormAddAR:function(btn){
        this.gridArPolicy = btn.up("grid");

        var win = Ext.create("ExtDesktop.view.module.arPolicy.WinAR");
        win.show();
        win.center();
        win.down('textfield[name=policy_name]').focus( true , 300);
        
    },
    saveAR:function(btn ){
        var win = btn.up('window');
        var form = win.down('form'), 
        values = form.getValues(),
        record = form.getRecord();
        var store = this.getAccCreditControlStore();
        
        values.is_active = values.is_active == "T" ? true:false;
       
        if (record) {
            record.set(values);
        }else{
            var model = Ext.create("ExtDesktop.model.CreditControl");
            model.set(values);
            store.add(model);
        };
        this.gridArPolicy.selModel.deselectAll()
     
        store.sync({
          success: function(batch, options) {
              win.close();
              Ext.MessageBox.show({
                title: 'Saved',
                msg: 'Record Save Succeed.',
                icon: Ext.MessageBox.INFO,
                buttons: Ext.Msg.OK
              });
              store.load();
          },
          failure: function(batch, options) {
              win.close();
              store.rejectChanges();
              console.log(batch.proxy.reader.rawData);
              var msg = batch.proxy.reader.rawData.message;
              Ext.MessageBox.show({
                title: 'Error',
                msg: msg,
                icon: Ext.MessageBox.ERROR,
                buttons: Ext.Msg.OK
              });
          },
          callback: function(batch, options) {

          },
          scope: this
        });
    },
    loadDetailStore:function( grid, record , index){
        var id = record.get("id");
        var store = this.getAccInvoiceRuleStore() ;
        if (id > 0) {
            store.proxy.extraParams.ar_policy_id = id ;
            store.load();
        } ;
        
    }

    
	

});

