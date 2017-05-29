Ext.define('ExtDesktop.controller.OpenCashDrawer', {
    extend: 'Ext.app.Controller',
    stores: [
                'acc.CashDrawerGroup','combo.CashDrawer','acc.CashTran'
    ],
    views: [
                'module.openCashDrawer.Index',
    ],  
    init: function(app) {
        this.control({
           'GridOpenCashDrawers button[action=OpenDrawer]':{
	     	    click: this.showForm
            },
            'GridOpenCashDrawers button[action=Edit]':{
                 click: this.edit
            },
            'GridOpenCashDrawers button[action=Search]':{
                 click: this.search
            },
           'WinOpenCashDrawer button[action=Cancel]':{
                 click: this.close
            } ,
            'WinOpenCashDrawer button[action=Save]':{
                 click: this.save
            },
         
           
        });
        
    },
    search:function(btn){
        var grid = btn.up('grid');
        var fromDate = grid.down('datefield[name=from_date]').getRawValue();
        var toDate =grid.down('datefield[name=to_date]').getRawValue();
        var store = grid.getStore();

        if (fromDate && toDate) {

            Util.loadStore(store, {
                from_date:fromDate, 
                to_date:toDate
            });

        };

    },
    edit:function(btn){
        var record =Util.getRecord(btn);
        if (record) {
            if (record.get("closed_date") ==  null) {
                 var win = Ext.create('ExtDesktop.view.module.openCashDrawer.WinOpenCashDrawer');
                 win.show();
                 win.center();
                 win.down('form').loadRecord(record);
            }else{
                Util.msg("Cannot edit this record because it already closed");
            };
        };
    },
    save: function(btn){
        var store = this.getAccCashTranStore();
        var model = "CashTran" ;
        Util.save(btn , store , model);

    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.openCashDrawer.WinOpenCashDrawer');
         win.show();
         win.center();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
	}
});

