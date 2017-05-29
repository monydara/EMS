Ext.define('ExtDesktop.controller.Batch', {
    extend: 'Ext.app.Controller',
    stores: [
        'Batch'
    ],
    views: [
        'module.batch.Index',
        'module.batch.WinBatch'
    ],
    refs: [
        {
            ref : 'GridBatch' , 
	    selector : 'GridBatch'
        },
        {
            ref : 'FrmBatch' , 
	    selector : 'FrmBatch'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridBatch button[action=Create]':{
	    	click: this.showForm
	   },
           'FrmBatch button[action=cancel]':{
                click: this.close
           },
           'GridBatch button[action=Edit]': {
               click:this.showFormEdit
           },
           'FrmBatch button[action=save]':{
        	   click:this.save
           },
           "GridBatch button[action=Delete]": {
                click:Util.deleteRecord
           }
           
        });
        
    },
    save:function(btn){
    	  var store= this.getBatchStore();
          Util.save(btn,store,'Batch');
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.batch.WinBatch');  
         win.show();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.batch.WinBatch','Please Select Item To Edit');  
	}

});

