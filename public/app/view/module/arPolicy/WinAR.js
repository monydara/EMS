Ext.define('ExtDesktop.view.module.arPolicy.WinAR', {
    extend: 'Ext.window.Window',
    alias: 'widget.arPolicyWinAR',
    title: 'Invoice Rule Form',
    modal: true,

    items: [{
        xtype: 'form',
        bodyPadding: 20,
        defaults: {
            width: 400
        },
        items: [

            {
                xtype: 'textfield',
                name: 'policy_name',
                fieldLabel: 'Policy Name'
            }, {
                xtype: 'numberfield',
                minValue: 0,
                name: 'due_days',
                fieldLabel: 'Due Day'
            }, {
                xtype: 'container',
                layout: 'hbox',
                items: [{
                        xtype: 'radiofield',
                        fieldLabel: 'Status',
                        name: 'is_active',
                        boxLabel: 'Active',
                        inputValue: 'T',
                        checked: true
                    }, {
                        xtype: 'radiofield',
                        boxLabel: 'Deactive',
                        inputValue: 'F',
                        name: 'is_active',
                        style: 'margin-left:10px'
                    }

                ]
            }, {
                xtype: 'textarea',
                name: 'description',
                fieldLabel: 'Description'
            }

        ],
    }],

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