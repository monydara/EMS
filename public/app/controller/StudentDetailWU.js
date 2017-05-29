Ext.define('ExtDesktop.controller.StudentDetailWU', {
    extend: 'Ext.app.Controller',
     stores: [
              'admissionWU.Admission'
    ],
    views: [
            'module.studentDetail.Index',               
    ],
    init: function(app) {
        
        this.control({
        	'studentDetailGrid textfield[name=filter]':{
        		change: this.searchString
        	},
        	'studentDetailGrd button[action=AdvanceSearch]':{
        		click: this.showAdvanceSearch
        	},
        	'studentDetailGrid button[action=Search]':{
        		click: this.searchAdvance
        	}
        	
        	
        });
        
    },
    searchAdvance: function(btn){
    	var values = btn.up('form').getValues();
    	var store = btn.up('grid').getStore();
    	Util.loadStore(store,values); 
    },
    showAdvanceSearch:function(btn){
    	var form = btn.up('grid').down('form');
    	if(form.isHidden() ){
    		form.show();
    	}else{
    		form.hide();
    	}
    	
    	
    },
    searchString: function(field,value){
    	var grid = field.up('grid');
    	var store = grid.getStore();
    	var searchString =grid .down('textfield[name=filter]').getValue();
    	
    	Util.loadStore(store,{ filter:searchString}); 
    	
    }
    
        
});

