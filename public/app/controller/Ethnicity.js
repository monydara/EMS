/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Ethnicity', {
    extend: 'Ext.app.Controller',
    models: [
        'Ethnicity'
    ],
    stores: [
        'Ethnicity'
    ],
    views: [
        'module.ethnicity.Index',
        'module.ethnicity.Win'
    ],

    init: function(application) {
        this.control({
            "GridEthnicity button[action=Create]": {
                click:this.showForm
            },
            "GridEthnicity button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridEthnicity button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinEthnicity button[action=Save]": {
                click:this.save
            },
            "WinEthnicity button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.ethnicity.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getEthnicityStore();
        Util.save(btn,store,'Ethnicity');
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.ethnicity.Win','Please Select Item To Edit');  
    }

});