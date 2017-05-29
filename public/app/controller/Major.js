Ext.define('ExtDesktop.controller.Major', {
    extend: 'Ext.app.Controller',
    stores: ['Major','Course'],
    views: [
                'module.major.Index',
                'module.major.WinMajor'
    ],

    init: function(app) {    
        this.control({
           'GridMajor button[action=Create]':{
            click: this.showForm
       },
           'FmMajor button[action=cancel]':{
                click: this.close
           },
           'FmMajor button[action=save]':{
               click: this.save
           },

            'GridMajor button[action=Edit]': {
                click:this.showFormEdit
            },
            'GridMajor button[action=Delete]': {
                click:Util.deleteRecord
            }
        });
    },

    save: function(btn){

    	var store= this.getMajorStore();
        Util.save(btn,store,'Major');
    },

    showForm: function(btn){
    	var win = Ext.create('ExtDesktop.view.module.major.WinMajor');  
        win.show();
    },

    close: function(button){
         var win    = button.up('window');
         win.close();
    },

    showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.major.WinMajor','Please Select Item To Edit');  
	}
});