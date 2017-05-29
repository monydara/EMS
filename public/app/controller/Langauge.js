/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Langauge', {
    extend: 'Ext.app.Controller',
    models: [
        'Langauge'
    ],
    stores: [
        'Langauge'
    ],
    views: [
        'module.langauge.Index',
        'module.langauge.Win'
    ],

    init: function(application) {
        this.control({
            "GridLangauge button[action=Create]": {
                click:this.showForm
            },
            "GridLangauge button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridLangauge button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinLangauge button[action=Save]": {
                click:this.save
            },
            "WinLangauge button[action=Cancel]": {
                click:Util.closeWindow
            }
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.langauge.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getLangaugeStore();
        Util.save(btn,store,'Langauge');
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.langauge.Win','Please Select Item To Edit');  
    }

});