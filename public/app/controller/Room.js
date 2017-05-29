/**
 * Created by Thoeun @ 09-Oct-14.
 */

Ext.define('ExtDesktop.controller.Room', {
    extend: 'Ext.app.Controller',
    models: [
        'RoomM', 
        'Campus'
    ],
    stores: [
             'RoomS'
    ],
    views: [
        'module.holiday.Index',
        'module.holiday.Win'
    ],

    init: function(application) {
        this.control({
            "GridRoom button[action=Create]": {
                click:this.showForm
            },
            "GridRoom textfield[name=search]": {
                change:this.search
            },
            "GridRoom button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridRoom button[action=Delete]": {
                click:Util.deleteRecord
            },
            "WinRoom button[action=Save]": {
                click:this.save
            },
            "WinRoom button[action=Cancel]": {
                click:Util.closeWindow
            }
        });
    },
    search :function(field){
        var value = field.getValue();
        var store = field.up('grid').getStore() ;
        Util.loadStore(store,{
            search: value
        });
    },
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.room.Win');  
      win.show();
      win.down('textfield[name=code]').focus(200, false);
    },
    save: function(btn){
        var store= this.getRoomSStore();
        Util.save(btn,store,"RoomM");
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.room.Win','Please select item to edit');
    },

});