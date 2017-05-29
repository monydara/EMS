Ext.define('ExtDesktop.controller.Campus', {
    extend: 'Ext.app.Controller',
    stores: [
        'Campus'
    ],
    views: [
                'module.campus.Index',
                'module.campus.WinCampus'
    ],
    refs: [
        {
            ref : 'GridCampus' , 
	        selector : 'GridCampus'
        },
        {
            ref : 'FrmCampus' , 
	        selector : 'FrmCampus'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridCampus button[action=Create]':{
        	   click: this.showFormCampus
           },
           'GridCampus button[action=Edit]':{
        	   click: this.editCampus
           },
           'GridCampus button[action=Close]':{
        	   click: this.closeCampus
           },
           'FrmCampus button[action=cancel]':{
                click: this.close
           },
           'GridCampus button[action=Delete]':{
               click: this.deleteCampus
           },
           'GridCampus button[action=Reopen]':{
               click: this.openCampus
           },
           'FrmCampus button[action=save]':{
               click: this.save
          },

           
        });
        
    },
//    validate:function(values){
//    	if(values.abbr)
//    },
    save:function(btn){
    	 var win = btn.up('window'),
         form   = win.down('form'),
         record = form.getRecord(),
         values = form.getValues();
    	 var stor= this.getCampusStore();
         var model=Ext.create('ExtDesktop.model.Campus');
         if(form.getForm().isValid()){
        	 if(!record){
                 model.set(values);
                 stor.add(model);
	         }else{
	                 record.set(values);			
	         }
        	 stor.sync();
	         if(win){
	             win.close();
	         }
	         Ext.MessageBox.show(
	         {
                 title : 'Saved', 
                 msg :  'Record Save Succeed.', 
                 icon : Ext.MessageBox.INFO, 
                 buttons : Ext.Msg.OK
	         });
         }else{
        	 Ext.MessageBox.show(
			 {
					title : 'Error', 
					msg :  'Please input required (*) fields!', 
					icon : Ext.MessageBox.ERROR, 
					buttons : Ext.Msg.OK
			});
         }
    },
    showFormCampus: function(btn){
         var win=Ext.create('ExtDesktop.view.module.campus.WinCampus');
         win.show();
         win.center();
    },
    editCampus:function(btn){
    	var fileName='ExtDesktop.view.module.campus.WinCampus';
    	var win=Ext.create(fileName);
    		console.log(win);
    		win.down('textfield[name=code]').setReadOnly(true);
    	Util.selectGrid(btn,fileName,'Please select campus from list!');
    },
    closeCampus:function(field,value){
    	var me=this;
    	var store=field.up('grid').store;
    	var grid =field.up("gridpanel"); 
        var row =grid.getSelectionModel().getSelection();
        if(row.length){
        	var record=row[0];
        	var campusId=record.data.campusId;
        	Ext.Msg.show({
                title : 'Close',
                msg : 'Do you want to close this campus?',
                width : 300,
                closable : false,
                buttons : Ext.Msg.YESNO,
                buttonText : 
                {
                    yes : 'Yes',
                    no : 'No',
                },
                multiline : false,
                fn : function(buttonValue, inputText, showConfig){
    	            	if(buttonValue=='yes'){
    	            		Util.ajax('campus/close.action',{campusId:campusId},me.closeCampusSuccess,store);
    	            	}
                },
                icon : Ext.Msg.QUESTION
            });
        }
    },
    
    closeCampusSuccess:function(obj,store){
    		Ext.MessageBox.show(
   	         {
                    title : 'Close Campus', 
                    msg :  'The Campus has been closed!', 
                    icon : Ext.MessageBox.INFO, 
                    buttons : Ext.Msg.OK
   	         });
    		setTimeout(function(){
    			store.load();
    			
    		},1000);
    },
    
    openCampus:function(field,value){
    	var me=this;
    	var store=field.up('grid').store;
    	var grid =field.up("gridpanel"); 
        var row =grid.getSelectionModel().getSelection();
        if(row.length){
        	var record=row[0];
        	var campusId=record.data.campusId;
        	Ext.Msg.show({
                title : 'Close',
                msg : 'Do you want to re-open this campus?',
                width : 300,
                closable : false,
                buttons : Ext.Msg.YESNO,
                buttonText : 
                {
                    yes : 'Yes',
                    no : 'No',
                },
                multiline : false,
                fn : function(buttonValue, inputText, showConfig){
    	            	if(buttonValue=='yes'){
    	            		Util.ajax('campus/open.action',{campusId:campusId},me.openCampusSuccess,store);
    	            	}
                },
                icon : Ext.Msg.QUESTION
            });
        }
    },
    
    openCampusSuccess:function(obj,store){
		Ext.MessageBox.show(
	         {
                title : 'Open Campus', 
                msg :  'The Campus has been open!', 
                icon : Ext.MessageBox.INFO, 
                buttons : Ext.Msg.OK
	         });
		setTimeout(function(){
			store.load();
			
		},1000);
    },

    deleteCampus:function(field,value){
    	var me=this;
    	var store=field.up('grid').store;
    	var grid =field.up("gridpanel"); 
        var row =grid.getSelectionModel().getSelection();
        if(row.length){
        	var record=row[0];
        	var campusId=record.data.campusId;
        	Ext.Msg.show({
                title : 'Close',
                msg : 'Do you want to delete this campus?',
                width : 300,
                closable : false,
                buttons : Ext.Msg.YESNO,
                buttonText : 
                {
                    yes : 'Yes',
                    no : 'No',
                },
                multiline : false,
                fn : function(buttonValue, inputText, showConfig){
    	            	if(buttonValue=='yes'){
    	            		Util.ajax('campus/delete.action',{campusId:campusId},me.deleteCampusSuccess,store);
    	            	}
                },
                icon : Ext.Msg.QUESTION
            });
        }
    },
    
    deleteCampusSuccess:function(obj,store){
		
    	Ext.MessageBox.show(
	    {
	        title : 'Delete Campus', 
	        msg :  'The Campus has been deleted!', 
	        icon : Ext.MessageBox.INFO, 
	        buttons : Ext.Msg.OK
	    });
		
		setTimeout(function(){
			store.load();
		},1000);
		
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
});
