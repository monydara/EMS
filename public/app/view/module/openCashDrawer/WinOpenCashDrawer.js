Ext.define('ExtDesktop.view.module.openCashDrawer.WinOpenCashDrawer', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinOpenCashDrawer',
    title: 'Open Cash Drawer',
    modal: true,
    items:[
            {
                xtype:'form',
                defaults:{width:350,labelWidth:140},
                bodyPadding:20,
                items:[
                    {
                        xtype:'combo',
                        fieldLabel:'Drawer Name',
                        name:'acc_cash_drawer_id',
                        allowBlank:false,
                        store:'combo.CashDrawer',
                        valueField:'id',
                        displayField:'drawer_name'
                    },{
                        xtype:'numberfield',
                        fieldLabel:'Open Amount($)',
                        name:'open_amount',
                        value:0.0
                    },{
                        xtype:'numberfield',
                        fieldLabel:'Open Amount(R)',
                        name:'open_amount_khr',
                        value:0.0
                    }
                ]
            }
    ],
    buttons:[
    {
        text:'Save',
        iconCls:'icon-save',
        action:'Save'
    },{
        text:'Cancel',
        iconCls:'icon-cancel',
        action:'Cancel'
    }
    ]
});