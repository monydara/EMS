/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Occupation', {
    extend: 'Ext.app.Controller',
    models: [
        'Occupation'
    ],
    stores: [
        'Occupation',

    ],
    views: [
        'module.occupation.Index',
        'module.occupation.Win'
    ],

    init: function(application) {
        this.control({
            "GridOccupation button[action=Create]": {
                click:this.showForm
            },
            "GridOccupation button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridOccupation button[action=Delete]": {
                click:Util.deleteRecord
            },

            "WinOccupation button[action=Save]": {
                click:this.save
            },
            "WinOccupation button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },

    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.occupation.Win');
      win.show();
    },
    save: function(btn){
        var store= this.getOccupationStore();
        Util.save(btn,store,'Occupation');
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.occupation.Win','Please Select Item To Edit');
    }

});
