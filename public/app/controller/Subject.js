Ext.define('ExtDesktop.controller.Subject', {
    extend: 'Ext.app.Controller',
    stores: ['Subject','SubjectType'],
    views: [
                'module.subject.Index',
                'module.subject.WinSubject'
    ],
    refs: [{
            ref : 'GridSubject' , 
	        selector : 'GridSubject'
        },{
            ref : 'FrmSubject' , 
	        selector : 'FrmSubject'
        }
    ],
    init: function(app) {
        this.control({
           'GridSubject button[action=Create]':{
            click: this.showForm
            },
            'GridSubject textfield[name=search]':{
	    	  change: this.search
	        },
           'FrmSubject button[action=cancel]':{
                click: this.close
           },
           'GridSubject button[action=Edit]': {
               click:this.showFormEdit
           },
           'GridSubject button[action=Delete]': {
                click:Util.deleteRecord
            },
           'FrmSubject button[action=save]':{
        	   click :this.save
           }
        });
    },
    search: function(field){
        var store = field.up('grid').getStore();
        var value =field.getValue();

        Util.loadStore(store, {search : value});
    },
    save: function(btn){
    	model="Subject";
    	var store= this.getSubjectStore();
    	Util.save(btn, store, model);
    },

    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.subject.WinSubject');  
         win.show();
         win.down('textfield[name=code]').focus(200,false);
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.subject.WinSubject','Please select record to edit!');
	}
	

});

