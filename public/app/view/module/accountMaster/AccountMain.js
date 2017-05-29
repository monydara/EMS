Ext.define('ExtDesktop.view.module.account.AccountMain', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.AccountMain',
    //bodyPadding: 10,
    closable: true,
    title: 'Account',
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items: [

                    this.formAccount(),this.tabAccount()

            ]
        })
        me.callParent(arguments);
    },

    formAccount:function(){
        form={
            xtype:'form',
            bodyPadding:10,
            defaultType:'textfield',
            layout:{
                type:'table',
                columns:4
            },
            defaults:{
                width: 300,
                labelWidth:120,
                labelAlign:'right',
                margin:5,
                readOnly: true
            },
            items:[
                {
                    name: 'student_no',
                    fieldLabel: 'Student ID',
                    labelAlign: 'right'
                }, {
                    name: 'sdn_name',
                    fieldLabel: 'Name',
                    labelAlign: 'right'
                },{
                    xtype: 'numberfield',
                    fieldLabel: 'Balance',
                    labelAlign:'right',
                    name: 'balance',
                    readOnly:true
                },{
                    xtype:'button',
                    text:'Edit',
                    iconCls:'icon-edit',
                    action:'EditAccount',
                    width:60
                },{
                    xtype:'combo',
                    fieldLabel:'Key Account',
                    allowBlank:false,
                    name:'key_account_id',
                    store:'combo.KeyAccount',
                    valueField:'id',
                    displayField:'name'
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Credit Control',
                    allowBlank: false,
                    name: 'credit_control_id',
                    store: 'combo.CreditControl',
                    valueField: 'id',
                    displayField: 'policy_name'
                },{
                    name:'vat_number',
                    fieldLabel: 'VAT Number',
                    maxLength:30
                }
            ]
        }  ;

        return form;
    },

    tabAccount:function(){
        tab={
                xtype: 'tabpanel',
                flex:1,
                items:[
                    this.tabPanelAccountFee(),this.tabPanelInvoices()
                ]
        }

        return tab;
    },

    tabPanelAccountFee:function(){
        panel={
                    xtype:'panel',
                    autoScroll:true,
                    title:'Account Fee',
                    bodyPadding:10,
                    defaults: {
                        anchor: '100%'
                    },
                    layout:{
                        type:'table',
                        columns:2
                    },
                    items:[
                        this.tabAccountAcademicGrid(),this.tabFeeCharges()
                    ]
        }
        return panel;
    },
    tabPanelInvoices:function(){
        panel={
                xtype:'panel',
                autoScroll:true,
                title:'Invoices',
                anchor:'100%'
        }
        return panel;
    },
    tabAccountAcademicGrid:function() {
        grid={
                xtype:'grid',
                name:'course',
                autoScroll: true,
                columnLines: true,
                border:true,
                //store:Ext.create("ExtDesktop.store.acc.SubAccount"),
                title: 'Account',
                width:520,
                height:310,
                tbar:[
                    '->',{
                            iconCls:'icon-system',
                            text: 'Create Invoice',
                            action: 'forceBill'
                    }
                ],
                columns:[
                    {
                        header: 'No',
                        xtype: 'rownumberer',
                        width: 50,
                        align: 'center'
                    }, {
                        text: 'Admission No.',
                        width: 120,
                        dataIndex: 'admission_no',
                        align: 'center'
                    }, {
                        text: 'Courses',
                        width: 160,
                        dataIndex: 'Courses'
                    },{
                        text: 'Status',
                        width: 100,
                        dataIndex: 'status',
                        align: 'center',
                        renderer:function(value){
                            switch (value) {
                                case "N":
                                    status = "New";
                                    break;
                                case "A":
                                    status = "Active";
                                    break;
                                case "D":
                                    status = "Drop";
                                    break;
                                case "S":
                                    status = "Suspend";
                                    break;
                                case "C":
                                    status = " Cancel";
                                    break;
                            }
                        }
                    }
                ]

        }
        return grid
    },
    tabFeeCharges:function(){
        tab={
                xtype:'tabpanel',
                items:[
                    {
                        xtype:'panel',title:'Fees'
                    },{
                        xtype:'panel',title:'Misc.'
                    }
                ]
        }
        return tab;
    },
    tabAccountChargeGrid:function(){
        grid={
                xtype:'grid',
                name:'charge',
                autoScroll: true,
                columnLines: true,
                border:true,
                //store:Ext.create("ExtDesktop.store.acc.SubAccount"),
                title: 'Charges',
                margin: '0 0 0 10',
                width:480,
                height:310,
                tbar: [
                    {
                        iconCls: 'icon-add',
                        action: 'addFee',
                        text: 'Add Fee'
                    }, {
                        iconCls: 'icon-add',
                        action: 'addTax',
                        text: 'Add Tax'
                    },{
                        iconCls: 'icon-add',
                        action: 'addMisc',
                        text: 'Add Misc.'
                    }, '->',{
                            iconCls: 'icon-delete',
                            action: 'Remove',
                            text: 'Remove'
                    }
                ],
                columns:[
                    {
                        header: 'No',
                        xtype: 'rownumberer',
                        width: 50,
                        align: 'center'
                    }, {
                        text: 'Item',
                        width: 120,
                        dataIndex: 'item'
                    }, {
                        text: 'Item Type',
                        width: 100,
                        dataIndex: 'item_type'
                    },{
                        text: 'Unit',
                        width: 100,
                        dataIndex: 'item_unit'
                    }, {
                        text: 'Value',
                        width: 100,
                        dataIndex: 'item_value'
                    }
                ]
        }
        return grid;
    }
});
