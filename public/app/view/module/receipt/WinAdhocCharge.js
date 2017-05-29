Ext.define('ExtDesktop.view.module.receipt.WinAdhocCharge', {
    extend: 'Ext.window.Window',
    alias: 'widget.winAdhocChargeReciept',
    title: 'AdhocCharge List',
    bodyPadding: 20,
    // layout: 'fit',
    modal: true,

    items: [{
        xtype: 'form',
        defaults: {
            width: 400,
            labelWidth: 120,
        },
        items: [

            {
                xtype: 'combo',
                name: 'item_charge_id',
                fieldLabel: 'Item Charge(<span style="color:red">*</span>)',
                store: 'combo.ChargeItem',
                queryMode: 'remote',
                allowBlank: false,
                editable: false,
                valueField: 'id',
                displayField: 'charge_item'
            }, {
                xtype: 'numberfield',
                name: 'charge_amount',
                readOnly: true,
                fieldLabel: 'Charge Amount'
            }, {
                xtype: 'textarea',
                name: 'description',
                fieldLabel: 'Description',

            }

        ],
    }],

    buttons: [{
            text: 'Ok',
            iconCls: 'icon-ok',
            action: 'Ok'
        }, {
            text: 'Cancel',
            iconCls: 'icon-cancel',
            action: 'Cancel'

        }

    ]

});
