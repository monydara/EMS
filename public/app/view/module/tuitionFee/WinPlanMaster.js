Ext.define('ExtDesktop.view.module.tuitionFee.WinPlanMaster', {
    extend: 'Ext.window.Window',
    alias: 'widget.winPlanMaster',
    title: 'Form Plan Master',
    modal: true,
    items: [{
            xtype: 'form',
            defaults: {
                width: 400
            },
            modal: true,
            bodyPadding: 20,
            items: [{
                    xtype: 'textfield',
                    name: 'plan_master_name',
                    fieldLabel: 'Name',
                    allowBlank: false
                }, {
                    xtype: 'numberfield',
                    name: 'fiscal_year',
                    fieldLabel: 'Fiscal Year',
                    allowBlank: false
                }, {
                    xtype: 'combo',
                    name: 'acd_batche_id',
                    store: 'Batch',
                    valueField: 'id',
                    displayField: 'name',
                    listeners: Util.firstSelect(),
                    allowBlank: false,
                    fieldLabel: 'Batch'
                }, {
                    xtype: 'datefield',
                    name: 'effective_date',
                    fieldLabel: 'Effective Date',
                    allowBlank: false
                }, {
                    xtype: 'datefield',
                    name: 'expired_date',
                    fieldLabel: 'Exp. Date',
                    allowBlank: false
                }, {
                    xtype: 'numberfield',
                    name: 'khr_rate',
                    decimalPrecision: 4,
                    fieldLabel: 'Ex. Rate(KHR)',
                    allowBlank: false
                }

                , /*{
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                            xtype: 'radiofield',
                            name: 'is_active',
                            inputValue: 1,
                            checked: true,
                            fieldLabel: 'Status',
                            boxLabel: 'Active'
                        }, {
                            xtype: 'radiofield',
                            name: 'is_active',
                            inputValue: 0,
                            boxLabel: 'Deactive',
                            style: 'margin-left:10px'
                        }

                    ]
                },*/ {
                    xtype: 'textarea',
                    name: 'description',
                    fieldLabel: 'Description'
                }
            ]
        }


    ],
    buttons: [{
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            iconCls: 'icon-cancel',
            action: 'Cancel'
        }

    ]

});
