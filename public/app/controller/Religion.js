Ext.define('ExtDesktop.controller.Religion', {
    extend: 'Ext.app.Controller',
    stores: [
        'Religion'
    ],
    models: [
             'Religion'
         ],
    views: [
                'module.religion.Index',
                'module.religion.WinReligion'
    ],
    init: function(app) {    
        this.control({
           'GridReligion button[action=Create]':{
            click: this.showFormReligion
       },
           'FmReligion button[action=cancel]':{
                click: this.close
           },
           'FmReligion button[action=save]':{
               click: this.Save
          },
          'GridReligion button[action=Edit]':{
              click: this.showFormEdit
         },
          
        });
    },
    showFormEdit: function(btn){   
    	
     Util.selectGrid(btn,"ExtDesktop.view.module.religion.WinReligion","Please Select Religion");
    	
    },
    showFormReligion: function(btn){
    	var grid = btn.up('grid');
//    	debugger;
         var win =Ext.create('ExtDesktop.view.module.religion.WinReligion');
         
         win.show();
         
         
    },
    Save: function(btn){
    	
    	var store = this.getReligionStore();
    
    	   Util.save(btn,store,'Religion');
    },
    close: function(button){
         var win    = button.up('window');
         win.close();
    }
});