Ext.define('ExtDesktop.view.module.lead.WinDeposit',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinDeposit',
    title:'Student Deposit',
    height:380,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[{
                xtype:'form',
                defaults:{width:360,style:'margin-left:5px'},
                defaultType:'textfield',
                layout:{
                    type:'table',
                    columns:2
                },
                bodyPadding:20,
                items:[
                    {
                        xtype:'hiddenfield',
                        name:'lead_id'
                    },
                    {
                        name: 'student_name',
                        readOnly: true,
                        colspan:2,
                        fieldLabel: 'Student Name'
                    },{
                        fieldLabel:'Pay Method',
                        xtype:'combo',
                        name:'acc_payment_method_id',
                        store:'acc.PaymentMethodS',
                        valueField:'id',
                        displayField:'name',
                        listeners:Util.firstSelect(),
                        allowBlank: false
                    }, {
                        fieldLabel: 'Ref. Number',
                        name: 'ref_no'
                    },{
                        layout:'hbox',
                        xtype:'panel',
                        items:[
                            {
                                xtype:'checkbox',
                                name:'use_dollar',
                                fieldLabel:'Amount(USD)',
                                checked:true,

                            },{
                                xtype:'numberfield',
                                name:'usd_amount',
                                minValue: 1 ,
                                value: 0 ,
                                width:240,
                                allowBlank: false
                            }
                        ]


                    }, {

                        layout:'hbox',
                        xtype:'panel',
                        items:[
                            {
                                xtype:'checkbox',
                                name:'use_khr',
                                fieldLabel: 'Amount(R)',

                            },{
                                xtype: 'numberfield',
                                name: 'khr_amount',
                                disabled:true ,
                                minValue: 1,
                                value: 0,
                                allowBlank: false
                            }
                        ]

                    },{
                        xtype:'textarea',
                        name: 'remark',
                        colspan:2 ,
                        width: 730 ,
                        height:100 ,
                        fieldLabel:'Remark'
                    }
                ]
            }],
            buttons:[
                {
                    text: 'Paid',
                    iconCls: 'icon-payment',
                    action: 'Paid'
                },{
                    text:'Paid & Print',
                    iconCls:'icon-printer',
                    action:'PaidAndPrint'
                },{
                    text:'Close',
                    iconCls:'icon-cancel',
                    action:'Close'
                }
            ]
        })
        me.callParent(arguments);
    }
});
