Ext.define('ExtDesktop.controller.GroupAccount', {
    extend: 'Ext.app.Controller',
    stores: [
        'acc.GroupAccount'
    ],
    views: [
               'module.groupAccount.Index',
               'module.groupAccount.WinGroupAccount'
    ],
    init: function(app) {    
        this.control({
                'GroupAccount button[action=Create]':{
                    click: this.showWinGroupAccount
                },
                'GroupAccount button[action=Edit]':{
                    click: this.showEdit
                },
                'WinGroupAccount button[action=Save]':{
                    click: this.saveData
                },
        });
    },
    showEdit:function(btn){
        Util.selectGrid(btn,'ExtDesktop.view.module.groupAccount.WinGroupAccount','Please select item to edit!');
        var grid = btn.up('grid');
        grid.selModel.deselectAll();
    },

    showWinGroupAccount:function(){
        var win = Ext.create('ExtDesktop.view.module.groupAccount.WinGroupAccount');
        win.show();
        win.center();
    },
    saveData:function(btn){
        var store= this.getAccGroupAccountStore();
        Util.save(btn,store,'acc.GroupAccount');
    },

});