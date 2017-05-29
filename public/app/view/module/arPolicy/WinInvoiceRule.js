Ext.define('ExtDesktop.view.module.arPolicy.WinInvoiceRule', {
    extend: 'Ext.window.Window',
    alias: 'widget.arPolicyWinInvoiceRule',
    title: 'Invoice Rule Form',
    modal:true,
    items: [

        {
            xtype: 'form',
            bodyPadding: 20,
            defaults: {
                width: 400
            },
            items: [

                {
                    xtype:'hiddenfield',
                    name:'credit_control_id'
                },

                {
                    xtype: 'textfield',
                    fieldLabel: 'Rule Name<span style="color:red">*</span>',
                    name:'rule_name',
                    allowBlank:false
                }, {
                    xtype: 'numberfield',
                    name:'from_days',
                    minValue: 0,
                    allowBlank:false,
                    fieldLabel: 'Day From Bill<span style="color:red">*</span>'
                },{
                    xtype: 'numberfield',
                    minValue: 0,
                    allowBlank:false,
                    name:'to_days',                    
                    fieldLabel: 'Day To Bill<span style="color:red">*</span>'
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Alert',
                    name:'alert_type_id',
                    store:Ext.create("Ext.data.Store",{
                        fields:['id', 'name'],
                        data:[
                            { id:1 , name:'None'},
                            { id:2 , name:'Call'},
                            { id:3 , name:'SMS'},
                            { id:4 , name:'Email'},
                        ]
                    }), 
                    valueField:'id',
                    displayField:'name',
                    editable:false,
                    value:1

                }, {
                    xtype: 'combo',
                    fieldLabel: "Action",
                    value: 'None',
                    name: 'action_type_id',

                    store: Ext.create("Ext.data.Store", {
                        fields: ['id', 'name'],
                        data: [
                            {id: 1, name: 'None'},
                            {id: 2, name: 'Warning'},
                            {id: 3, name: 'Penalty'},
                            {id: 4, name: 'Lock'},
                        ]
                    }),
                    valueField: 'id',
                    displayField: 'name',
                    editable: false,
                    value: 1
                },{
                    xtype: 'numberfield',
                    name:'charge_per_day',
                    minValue: 0,
                    value:0,
                    allowBlank:false,
                    fieldLabel: 'Charge Per Day'
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                            xtype: 'radiofield',
                            fieldLabel: 'Status',
                            boxLabel: 'Active', 
                            name:'is_active', 
                            checked:true,
                            inputValue:'T'
                        }, {
                            xtype: 'radiofield',
                            boxLabel: 'Deactive',
                            name:'is_active',
                            inputValue:'F',
                            style: 'margin-left:10px'
                        }
                    ]
                }, {
                    xtype: 'textarea',
                    name:'description',
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
        },

    ]

});