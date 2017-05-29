Ext.define('ExtDesktop.controller.Shift', {
    extend: 'Ext.app.Controller',
    stores: ['Shift'],
    views: [
                'module.shift.Index'
    ],
    refs: [
	        {
	            ref : 'GridShift' , 
	            selector : 'GridShift'
	        },{
	        	ref : 'FrmShift' , 
	        	selector : 'FrmShift'
	        }
	        
    ],
    init: function(app) {
        
        this.control({
        
           'GridShift':{
                itemdblclick: this.showdEdit
           },

           'GridShift button[action=Create]':{
        	   click: this.showCreate
           	},
           /*'FrmShift button[action=Cancel]':{
                click: this.close
           },*/
           'GridShift button[action=Edit]': {
               click:this.showEdit
           },

           'GridShift button[action=Delete]': {
               //click:this.showDelete
               click:Util.deleteRecord
           },
           'FrmShift button[action=Save]':{
               click:this.save
           }
          
        });
        
    },

  save:function(btn){
      var store = this.getShiftStore();
      var modelName ='Shift';
      Util.save(btn,store,modelName) ;
   
  },

 showEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.shift.WinShift','Please select item to edit!');
      var grid = btn.up("gridpanel");   
      grid.selModel.deselectAll(); 
  },

  showdEdit:function(grid,rec){
      var win = Ext.create("ExtDesktop.view.module.shift.WinShift"); // create obje
          win.down('form').getForm().loadRecord(rec);
  },

  showCreate: function(btn){
    //var win = Ext.create("ExtDesktop.view.module.shift.WinShift");
    //alert('this button create.');
      var model = Ext.create('ExtDesktop.view.module.shift.WinShift');      
  },

  showDelete:function(btn){
    Util.deleteRecord(btn);
    //Ext.Msg.alert('Delete','No record selected , Please ! select which record that you want to delete.');
  },

  close: function(button){
		 var win= button.up('window');
		 win.close();
	}

});

