Ext.define('ExtDesktop.controller.CashDrawerManager', {
    extend: 'Ext.app.Controller',
    stores: [
      'acc.CashDrawerGroup',
      'acc.AddMember',
      'acc.CashDrawer',
      'acc.CashTran',
      'acc.Invoice'
    ],
    views: [
                'module.cashDrawerManager.Index',
                'module.cashDrawerManager.WinCashDrawerManager',
                'module.cashDrawerManager.WinGroup',
                'module.cashDrawerManager.WinAddMember'
    ],  
    init: function(app) {
        
        this.control({
           'GridCashDrawerManager button[action=create]':{
  	    	    click: this.showForm
  	       },
           'FrmGroup button[action=cancel]':{
                click: this.close
           },
           
           'FrmGroup button[action=save]':{
        	   click:this.save
           },

           'FrmAddMember button[action=save]':{
              click : this.saveAddMember
           },
           'FrmAddMember button[action=cancel]':{
              click : this.closeWindow
           }, 
           'GridCashDrawerManager grid[name=cashdrawergroup]':{
              itemclick : this.loadCashierMember
           }
           
        });
        
    },
    loadCashierMember:function(grid , record) {
       var store = this.getAccCashDrawerStore();
       store.load({
        params:{
          group_id : record.get('id')
        }
       });
    },
    saveAddMember:function(btn) {
      var win = btn.up('window');
      var grid = win.down('grid');
      var store = grid.getStore();
      var group_id = win.group_id ,
      me = this;
      var data = Ext.pluck(store.data.items, 'data');
      var newResult =new Array();

      data.forEach(function(a){ 
       if(a.is_member){
          newResult.push(a);
       }
        
      });
      // debugger;

      Util.ajax('/acc_cash_drawers/addMember',{ 
        group_id : group_id,
        acc_cash_drawer_attributes : Ext.encode(newResult)
       }, me.afterSaveAddMember , { win : win, ctrl : me } );

      
    },
    afterSaveAddMember:function(obj, params){

      if (obj.success) {
        params.win.close();
      } else{


      };
    },

    removeMember:function(grid, rowIndex, ctrl){ 
        var rec = grid.getStore().getAt(rowIndex);        
        Ext.MessageBox.confirm('Confirm', 'Are sure to <b>Remove '+rec.get('user_name')+'</b>?', function(btn){
       if('yes'==btn){
        Util.ajax('/acc_cash_drawers/removeMember',{AccCashDrawerId:rec.get('id')},ctrl.reloadStoreMember,ctrl); 
        }
      });

     },
    activeMember:function(grid, rowIndex, ctrl){ 
        var rec = grid.getStore().getAt(rowIndex);        
        Ext.MessageBox.confirm('Confirm', 'Are sure to <b>Active '+rec.get('user_name')+'</b>?', function(btn){
       if('yes'==btn){
        Util.ajax('/acc_cash_drawers/activeMember',{AccCashDrawerId:rec.get('id')},ctrl.reloadStoreMember,ctrl); 
        }
      });

     },
     deactiveMember:function(grid, rowIndex, ctrl){ 
        var rec = grid.getStore().getAt(rowIndex);
        
        Ext.MessageBox.confirm('Confirm', 'Are sure to <b>Deactive '+rec.get('user_name')+'</b>?', function(btn){
       if('yes'==btn){
          Util.ajax('/acc_cash_drawers/deactiveMember',{AccCashDrawerId:rec.get('id')},ctrl.reloadStoreMember,ctrl); 
          }
        });

     },
     reloadStoreMember:function(obj , ctrl){
        if (obj.success) {
          var store = ctrl.getAccCashDrawerStore();
          store.load({
              params:{
                group_id : obj.data.cdg_id
              }
            });
        } else{
          Ext.Msg.alert("Fail", obj.message);
        };



     },

    closeWindow: function(btn){
      var win = btn.up('window');
      win.close();

    },
    showFormAddMember:function(grid, rec, ctl){


       var win =Ext.create('ExtDesktop.view.module.cashDrawerManager.WinAddMember');
       ctl.getAccAddMemberStore().load({
          params:{
            group_id: rec.get('id')
          }

       });

       win.setTitle(("Add Member To : "+rec.get('group_name')));
       win.group_id =rec.get('id') ;

      win.show();
    },
    save: function(btn){
    	model="acc.CashDrawerGroup";
    	var stor= this.getAccCashDrawerGroupStore();
        
    	Util.save(btn,stor,model);
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.cashDrawerManager.WinGroup');  
         win.show();
    },
    edit:function(grid, rec , ctl){
        var win = Ext.create('ExtDesktop.view.module.cashDrawerManager.WinGroup');  
        win.down('form').loadRecord(rec);
         win.show();
    },
    delete: function(grid , rec, ctl ){
      var store = grid.getStore();

       Ext.MessageBox.confirm('Confirm', 'Are you sure to <span style="color:red"> <b> Delete </b></span>?', function(btn){
         if(btn=='yes'){
           store.remove(rec);
            store.sync();
           Ext.Msg.alert("Deleted",'Record Has Been Deleted.');
         }
      });
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.class.WinClass','Please Select Item To Edit');  
	},
	

});

