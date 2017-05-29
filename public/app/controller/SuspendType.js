Ext.define('ExtDesktop.controller.SuspendType', {
    extend: 'Ext.app.Controller',
    stores: ['sdn.SuspendType'],
    views: [
                'module.suspendType.Index',
                'module.suspendType.WinSuspendType'
    ],
    refs: [
        {
            ref : 'GridSuspendType' ,
	        selector : 'GridSuspendType'
        },
        {
            ref : 'FrmSuspendType' ,
	        selector : 'FrmSuspendType'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridSuspendType button[action=Create]':{
	    	click: this.showForm
	   },
           'FrmSuspendType button[action=cancel]':{
                click: this.close
           },
           'GridSuspendType button[action=Edit]': {
               click:this.showFormEdit
           },
           'FrmSuspendType button[action=save]':{
        	   click:this.save
           },
            "GridSuspendType button[action=Delete]": {
                click:Util.deleteRecord
            }

           
        });
        
    },
    save:function(btn){
    	  var store= this.getSdnSuspendTypeStore();
          Util.save(btn,store,'sdn.SuspendType');
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.suspendType.WinSuspendType');
         win.show();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.suspendType.WinSuspendType','Please select item to edit!');
	}

});

