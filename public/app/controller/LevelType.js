/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.LevelType', {
    extend: 'Ext.app.Controller',
    models: ['LevelType'],
    stores: ['LevelType'],
    views: [
		        'module.levelType.Index',
		        'module.levelType.WinLevelType'
    ],

    init: function(application) {
        this.control({
            "GridLevelType button[action=Create]": {
                click:this.showForm
            },
            "GridLevelType button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridLevelType button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "FrmLevelType button[action=Save]": {
                click:this.save
            },
            "FrmLevelType button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.levelType.WinLevelType');  
      win.show();
    },
    save: function(btn){
        console.log('test');
        var store = this.getLevelTypeStore();
        var model = "LevelType";
        Util.save(btn,store,model);
    },
    showFormEdit:function(btn){
        var store= this.getLevelTypeStore();
        store.load();
        Util.selectGrid(btn,'ExtDesktop.view.module.levelType.WinLevelType','Please select item to edit!');
    }

});