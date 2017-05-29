Ext.define('ExtDesktop.controller.Currency', {
    extend: 'Ext.app.Controller',
    stores: ['acc.Currency'],
    views: [
            'module.currency.Index',
            'module.currency.WinCurrency',

    ],


    init: function(app) {
        this.control({
            'GridCurrency button[action=Create]':{
                click:this.showWinCurrency
            } ,
            'GridCurrency button[action=Edit]':{
                click:this.showEdit
            }
        });
    },
    showEdit:function(btn){
        Util.selectGrid(btn,'ExtDesktop.view.module.currency.WinCurrency','Please select item to edit!');
        var grid = btn.up('grid');
        grid.selModel.deselectAll();
    },

    showWinCurrency:function(btn){
        var win = Ext.create('ExtDesktop.view.module.currency.WinCurrency');
        win.show();
        win.center();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},
	


});

