Ext.define('ExtDesktop.controller.Division', {
    extend: 'Ext.app.Controller',
    stores: [
        'Division'
    ],
    views: [
                'module.division.Index',
                'module.division.WinDivision'
    ],
    init: function(app) {
        
        this.control({
           'GridDivision button[action=Create]':{
    	    	click: this.showForm
    	   },
           'FrmDivision button[action=cancel]':{
                click: this.close
           },
           'FrmDivision button[action=save]':{
               click: this.save
          },
          'FrmDivision button[action=AddDivision]':{
               click: this.addDivisionToGridStandard
          },
           'GridDivision button[action=Edit]': {
               click:this.showFormEdit
           },
        });
        
    },
    addDivisionToGridStandard:function(btn){
        
    },
    save:function(btn){
    	var stor = this.getDivisionStore();
    	Util.save(btn,stor,"Division");
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.division.WinDivision');  
         win.show();
         win.down('textfield[name=code]').focus(200, false);
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.division.WinDivision','Please Select Item To Edit');  
	},
	

});

