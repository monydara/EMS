Ext.define('ExtDesktop.controller.ChargeItemC', {
    extend: 'Ext.app.Controller',
    stores: [
        'acc.ChargeItemS',
        'acc.ChargeItemTypeS'
    ],
    models: [
             'acc.ChargeItemM'
         ],
    views: [
          'module.chargeItemC.Index',               
          'module.chargeItemC.Win',   
          //'module.receipt.WinSearch'            
    ],  
    init: function(app) {
        
        this.control({
          'GridChargeItem button[action=Create]':{
                click : this.showForm
          },
          'GridChargeItem button[action=Edit]':{
                click : this.showFormEdit
          },
           'winchargeItem button[action=save]':{
               click: this.Save
          },          
          'winchargeItem button[action=Cancel]':{
                click : this.closeForm
          },          
          'GridChargeItem button[action=Delete]':{
                click : this.confirmDelete
          },
          'GridChargeItem textfield[name=search]':{
                change : this.searchBasic
          }

           
        });
        
    },

    showFormAdvanceSearch:function(){
        var win = Ext.create('ExtDesktop.view.module.receipt.WinSearch');
        win.show();
        win.center();

    },
   closeForm:function(btn){
        btn.up('window').close();
   },
   showForm:function(){
        var win = Ext.create('ExtDesktop.view.module.chargeItemC.Win');
        win.show();
        win.center();
   },
    Save: function(btn){ 


      var store = this.getAccChargeItemSStore();
        console.log(store);
        Util.save(btn,store,'acc.ChargeItemM');
        store.load();
    },
   showFormEdit:function(btn){
      var record = Util.getRecord(btn,'Please Select Record Before Select Edit');
      var win = Ext.create('ExtDesktop.view.module.chargeItemC.Win');
      win.down('form').loadRecord(record);
        
        win.show();
        win.center();


       // Util.selectGrid(btn,'ExtDesktop.view.module.chargeItemC.Win','Please Select Record Before Select Edit');
   },

   confirmDelete:function(btn){
       Util.deleteRecord(btn);

   },
   searchBasic:function(textfield,newVal,oldVal){
        console.log(newVal,"***",oldVal);
        var text_search = newVal ;
        var store = this.getAccChargeItemSStore();
        var me =  this;
        setTimeout(function() {
          me.show(text_search,store)
        }, 1000);  // measure in millisecond (ms)

    },

    show:function(text_search,store){
        var obj = {text:text_search}
        Util.loadStore(store,obj) ;
        // if (text_search != ""){   // user input value 
        //      store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
  
        // }else{
        //     store.load();       
        // }
    }
	

});

