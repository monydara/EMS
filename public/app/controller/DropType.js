Ext.define('ExtDesktop.controller.DropType', {
    extend: 'Ext.app.Controller',
    stores: ['sdn.DropType'],
    views: [
                'module.dropType.Index',
                'module.dropType.WinDropType'
    ],
    refs: [
        {
            ref : 'GridDropType' ,
	        selector : 'GridDropType'
        },
        {
            ref : 'FrmDropType' ,
	        selector : 'FrmDropType'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridDropType button[action=Create]':{
	    	click: this.showForm
	   },
           'FrmDropType button[action=cancel]':{
                click: this.close
           },
           'GridDropType button[action=Edit]': {
               click:this.showFormEdit
           },
            "GridDropType button[action=Delete]": {
                click:Util.deleteRecord
            },

           'FrmDropType button[action=save]':{
        	   click:this.save
           }
           
        });
        
    },
    save:function(btn){
    	  var store= this.getSdnDropTypeStore();
          Util.save(btn,store,'sdn.DropType');
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.dropType.WinDropType');
         win.show();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.dropType.WinDropType','Please select item to edit!');
	}

});

