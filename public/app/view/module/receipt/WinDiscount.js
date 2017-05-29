Ext.define('ExtDesktop.view.module.receipt.WinDiscount', {
    extend: 'Ext.window.Window',
    alias: 'widget.winDiscountReciept',
    title: 'Discount List',
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
                name: 'fee_charge_id',
                fieldLabel: 'Discount Item(<span style="color:red">*</span>)',
                store: 'combo.DiscountItem',
                valueField: 'id',
                displayField: 'item_name',
                queryMode:'remote',
                editable: false,
                queryMode: 'local',
                allowBlank: false
            }, {
                xtype: 'combo',
                fieldLabel: 'Discount($,%)<span style="color:red">*</span>',
                allowBlank: false,
                name: 'discount_item_detail_id',
                store: 'combo.DiscountItemDetail',
                queryMode:'remote',
                valueField: 'id',
                displayField: 'discount_item',
                queryMode: 'local',
                editable: false,

            }, {
                xtype: 'numberfield',
                fieldLabel: 'Discount Value',
                name: 'custom_discount',
                minValue: 0,

                // name:'discount_amount',
                readOnly: true,
            }, {
                type: 'numberfield',
                fieldLabel: 'Discount Percentag',
                name: 'discount_p'
            }, {
                xtype: 'textarea',
                name: 'description',
                fieldLabel: 'Description'
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