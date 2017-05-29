Ext.define('ExtDesktop.controller.EmployeeLevel', {
    extend: 'Ext.app.Controller',
    stores: ['EmployeeLevel'],
    views: [
                'module.employeeLevel.Index',
                'module.employeeLevel.WinEmployeeLevel'
           ],
    refs: [
	        {
	            ref : 'GridEmployeeLevel' , 
	            selector : 'GridEmployeeLevel'
	        },{
	            ref : 'FrmEmployeeLevel' , 
	            selector : 'FrmEmployeeLevel'
	        }
    ],
    init: function(app) {
        
        this.control({
            'GridEmployeeLevel button[action=Create]':{
        	   click: this.showForm
           	},
           	'GridEmployeeLevel button[action=Edit]':{
         	   click: this.showEdit
            },
           	'FrmEmployeeLevel button[action=Cancel]':{
                click: this.closeForm
            },
            'FrmEmployeeLevel button[action=Save]': {
                click: this.saveData
            },
            'GridEmployeeLevel button[action=Delete]':{
               click: this.showDelete
            },
       
        });
        
    },
   
    showEdit:function(btn){
    	Util.selectGrid(btn,'ExtDesktop.view.module.employeeLevel.WinEmployeeLevel','Please select item to edit!');
        //Clear selection
        var grid = btn.up('grid');
        grid.selModel.deselectAll();
    },
    showForm:function(btn){
    	var win=Ext.create('ExtDesktop.view.module.employeeLevel.WinEmployeeLevel');
        win.show();
        win.center();
    },

    closeForm:function(btn){
    	 var win = btn.up('window');
		 win.close();
    },
    saveData:function(btn){
        var store= this.getEmployeeLevelStore();
        Util.save(btn,store,'EmployeeLevel');
    },
    showDelete:function(btn){
        var record = Util.getRecord(btn , "Please Select Record to delete!"); 
        if (record) {
        Util.deleteRecord(btn);
        }
    }
     
    
});

