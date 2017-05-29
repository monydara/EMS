Ext.define('ExtDesktop.controller.KeyAccount', {
    extend: 'Ext.app.Controller',
    stores: ['KeyAccount'],
    views: [
                'module.keyAccount.Index',
                'module.keyAccount.WinKeyAccount'
    ],
    refs: [
        {
            ref : 'GridKeyAccount' ,
	        selector : 'GridKeyAccount'
        },
        {
            ref : 'FrmKeyAccount' ,
	        selector : 'FrmKeyAccount'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridKeyAccount button[action=Create]':{
	    	click: this.showForm
	   },
           'FrmKeyAccount button[action=cancel]':{
                click: this.close
           },
           'GridKeyAccount button[action=Edit]': {
               click:this.showFormEdit
           },
            "GridKeyAccount button[action=Delete]": {
                click:Util.deleteRecord
            },

           'FrmKeyAccount button[action=save]':{
        	   click:this.save
           }
           
        });
        
    },
    save:function(btn){
    	  var store= this.getKeyAccountStore();
          Util.save(btn,store,'KeyAccount');
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.keyAccount.WinKeyAccount');
         win.show();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
          console.log('edit');
	      Util.selectGrid(btn,'ExtDesktop.view.module.keyAccount.WinKeyAccount','Please select item to edit!');
	}

});

