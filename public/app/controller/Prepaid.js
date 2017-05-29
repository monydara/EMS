Ext.define('ExtDesktop.controller.Prepaid', {
    extend: 'Ext.app.Controller',
    stores: ['Prepaid','combo.Course','combo.Degree','acc.Currency'],
    views: [
                'module.prepaid.Index',
    ],
    refs: [
        {
            ref : 'GridPrepaid' ,
	        selector : 'GridPrepaid'
        }
    ],
    init: function(app) {
        this.control({
           'GridPrepaid button[action=OpenWinSearch]':{
	    	        click: this.showWinSearch
           },
            'GridPrepaid textfield[name=txtSearch]':{
                    change: this.search
            }

        });
    },

    search:function(field){
        var value = field.getValue();
        var store = field.up('grid').getStore();
        Util.loadStore(store, {text : value});
    },

    showWinSearch:function(btn){
        var win=Ext.create('ExtDesktop.view.module.prepaid.WinSearch');
        win.show();
        win.center();
    }
});

