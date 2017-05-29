Ext.define('ExtDesktop.controller.CityState', {
    extend: 'Ext.app.Controller',
    stores: ['sdn.CityState'],
    views: [
                'module.cityState.Index',
                'module.cityState.CityState'
           ],
    refs: [
	        {
	            ref : 'GridCityState' , 
	            selector : 'GridCityState'
	        },{
	            ref : 'FrmCityState' , 
	            selector : 'FrmCityState'
	        }
    ],
    init: function(app) {
         this.control({
            'GridCityState button[action=Create]':{
               click: this.showForm
            },
            'GridCityState button[action=Edit]':{
               click: this.showEdit
            },
            'FrmCityState button[action=Cancel]':{
                click: this.closeForm
            },
            'FrmCityState button[action=Save]': {
                click: this.saveData
            },
            'GridCityState button[action=Delete]':{
               click: this.showDelete
            },
       
        });
        
    },
   
    showEdit:function(btn){
        Util.selectGrid(btn,'ExtDesktop.view.module.cityState.CityState','Please select item to edit!');
        //Clear selection
        var grid = btn.up('grid');
        grid.selModel.deselectAll();
    },
    showForm:function(btn){
        var win=Ext.create('ExtDesktop.view.module.cityState.CityState');
        win.show();
        win.center();
    },

    closeForm:function(btn){
         var win = btn.up('window');
         win.close();
    },
    saveData:function(btn){
        var store= this.getSdnCityStateStore();
        Util.save(btn,store,'sdn.CityState');
    },
    showDelete:function(btn){
        var record = Util.getRecord(btn , "Please Select Record to delete!"); 
        if (record) {
        Util.deleteRecord(btn);
          }
    }
     
    
});
