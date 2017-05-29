/**
 * Created by IT on 2/26/2016.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.payment.WinWriteOff',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinWriteOff',
    title:'Write Off Bad Debt',
    modal:true,
    autoScroll:true,
    height:450,
    initComponent: function(){
        Ext.apply(this, {
            items:[
                this.getForm()
            ]
        });
        this.callParent(arguments);
    },

    getForm:function(){

        var panel = {
            xtype:'form',
            bodyPadding:30,
            defaults:{labelWidth:120,width:380},
            items:[
                        {
                            xtype: 'textfield',
                            name: 'invoice_no',
                            fieldLabel: 'Invoice No',
                            readOnly:true

                        }, {
                            xtype: 'textfield',
                            name: 'total_amount',
                            fieldLabel: 'Total Amount',
                            readOnly: true
                        }, {
                            xtype: 'textfield',
                            name: 'unpaid_amount',
                            fieldLabel: 'Unpaid Amount',
                            readOnly: true

                        }, {
                            xtype: 'textarea',
                            fieldLabel: 'Write off Reason',
                            afterLabelTextTpl: required,
                            width:550,
                            height:180,
                            name: 'reason'
                        }]
        };

        return panel;
    },

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