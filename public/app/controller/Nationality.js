/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Nationality', {
    extend: 'Ext.app.Controller',
    models: [
        'Nationality'
    ],
    stores: [
        'Nationality'
    ],
    views: [
        'module.nationality.Index',
        'module.nationality.Win'
    ],

    init: function(application) {
        this.control({
            "GridNationality button[action=Create]": {
                click:this.showForm
            },
            "GridNationality button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridNationality button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinNationality button[action=Save]": {
                click:this.save
            },
            "WinNationality button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.nationality.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getNationalityStore();
        Util.save(btn,store,'Nationality');
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.nationality.Win','Please Select Item To Edit');  
    }

});