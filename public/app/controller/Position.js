/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Position', {
    extend: 'Ext.app.Controller',
    models: [
        'Position'
    ],
    stores: [
        'Position'
    ],
    views: [
        'module.position.Index',
        'module.position.Win'
    ],

    init: function(application) {
        this.control({
            "GridPosition button[action=Create]": {
                click:this.showForm
            },
            "GridPosition button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridPosition button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinPosition button[action=Save]": {
                click:this.save
            },
            "WinPosition button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.position.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getPositionStore();
        Util.save(btn,store,'Position');
    },
    
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.position.Win','Please Select Item To Edit');  
    }

});