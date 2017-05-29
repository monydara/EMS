Ext.define('ExtDesktop.controller.Payment', {
    extend: 'Ext.app.Controller',
    stores: [
        "acc.FinanceTranS",
        "acc.AccountMasterBrow",
        "acc.Invoice",
        "acc.PaymentMethodS",
        "acc.Currency"
    ],
    views: [
        'module.payment.Index',
        'module.payment.WinPayment',
        'module.payment.WinSelectStudent',

    ],
    init: function(app) {
        this.control({
            'GridPayment button[action=Paid]':{
                click: this.showWinPayment
            },

            'WinPayment button[action=Cancel]':{
                click: this.close
            },
            'WinSelectStudent button[action=Cancel]':{
                click: this.close
            },
            'WinPayment button[action=SelectStudent]':{
                click: this.showWinSelectStudent
            },
            "WinSelectStudent grid":{
                itemdblclick: this.loadStudentToFormPayment
            },
            "WinPayment button[action=PopulateStudent]":{
                click: this.loadInvoiceList
            },
            "WinPayment combo[name=currency_code]":{
                select: this.loadCurrency
            },
            "WinPayment button[action=Save]":{
                click: this.saveFinanceTransaction
            },


        });
    },
    tmpWinPayment : null , 
    tmpGrid : null , 
    setTotalAmount:function(grid ){
        Util.ajax("/AccFinanceTrans/get_total_amount",{} , this.afterAjaxSetTotalAmount , grid )
    },
    afterAjaxSetTotalAmount:function(obj , grid){
        grid.down("textfield[name=amount_khr]").setValue(obj.total_amount_khr);
        grid.down("textfield[name=amount_usd]").setValue(obj.total_amount_usd);
    },
    saveFinanceTransaction:function(btn){
        var store = this.getAccFinanceTranSStore();
        Util.save(btn , store , "acc.FinanceTranM" );
        var me = this ;
        setTimeout(function() {

            me.setTotalAmount(me.tmpGrid);
        }, 2000);
    },
    loadCurrency:function(field, records){
        var win = field.up("window");
        var rec = records[0];
        win.down("textfield[name=exchange_rate]").setValue(rec.get("ccy_rate"));
    },
    loadInvoiceList:function(btn){
        var win = btn.up("window");
        var admission_no = win.down("textfield[name=admission_no]").getValue();
        var  store =this.getAccInvoiceStore();

        store.load({
            params:{
                admission_no : admission_no
            },
            callback :function(records, operation, success) {
               
                 var amount =0 ; 
                 records.forEach(function(rec){
                    amount+=Number(rec.get("total_amount"))
                 })
                 win.down("textfield[name=total_amount]").setValue(amount);
            }
        });


    },
    loadStudentToFormPayment:function(grid , rec ){
        var tmpWin = this.tmpWinPayment;
        var win = grid.up("window");
        win.close();
        tmpWin.down("textfield[name=student_no]").setValue(rec.get("student_no"));
        tmpWin.down("textfield[name=admission_no]").setValue(rec.get("admission_no"));
        tmpWin.down("hiddenfield[name=account_id]").setValue(rec.get("id"));
    },  
    close: function(button) {
        var win = button.up('window');
        win.close();
    },
    showWinPayment:function(btn ){
        this.tmpGrid = btn.up("grid");
        var win=Ext.create('ExtDesktop.view.module.payment.WinPayment');
        win.show();
        win.center();
        this.tmpWinPayment = win ;
        var store = this.getAccInvoiceStore();
        store.removeAll();
    },
    showWinSelectStudent:function(){
        var win=Ext.create('ExtDesktop.view.module.payment.WinSelectStudent');
        win.show();
        win.center();
    },


});
