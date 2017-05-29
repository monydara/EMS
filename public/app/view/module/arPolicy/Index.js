Ext.define('ExtDesktop.view.module.arPolicy.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.arPolicyIndex',
    collapsible: false,
    title: 'A/R Policy',
    closable: true,
    bodyPadding: 10,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                this.getGrid(),
                this.getGridDetail()
                // this.getForm()

            ]
        });
        me.callParent(arguments);
    },


    getGrid: function() {

        var grid = {
            xtype: 'grid',
            height: 250,
            title: 'AR Policy',
            name:'ARPolicy',
            border: true,
            tools: [{
                        xtype: 'textfield',
                        name:'searchARpolicy',
                        emptyText: '-- Search -- '
                    }, {
                        xtype: 'button',
                        iconCls: 'icon-add',
                        action: 'addAR'
                    }, {
                        xtype: 'button',
                        iconCls: 'icon-edit',
                        action:'EditAR'
                    }, {
                        xtype: 'button',
                        iconCls: 'icon-delete',
                        action:'DeleteAR'
            }],
            store: 'acc.CreditControl',
            columns: [
                        {
                            header: 'No',
                            width: 50,
                            xtype: 'rownumberer',
                            align: 'center'
                        }, {
                            header: 'Name',
                            width: 200,
                            dataIndex: 'policy_name'
                        }, {
                            header: 'Due Days',
                            dataIndex: 'due_days',
                            width: 200 ,
                        }, {
                            header: 'Description',
                            flex: 1,
                            dataIndex: 'description'
                        }, {
                            header: 'Status',
                            dataIndex: 'is_active',
                            renderer:function(value , rawData){
                                if (value) {
                                    return "<span style='color:green;font-weight:bold' > Active</span>" ;
                                }else{
                                    return "<span style='color:red;font-weight:bold'> Deactive</span>" ;

                                };
                            }
                        },


            ]
        };

        return grid;


    },
    getGridDetail: function() {

        var grid = {
                    xtype: 'grid',
                    title: 'Invoice Rule',
                    border: true,

                    height: 230,
                    style: 'margin-top:10px',
                    tools: [{
                        xtype: 'textfield',
                        name:'invoiceRule',
                        emptyText: '-- Search -- '
                    }, {
                        xtype: 'button',
                        iconCls: 'icon-add',
                        action:'addInvoiceRule',
                    }, {
                        xtype: 'button',
                        action:'editInvoiceRule' ,
                        iconCls: 'icon-edit',

                    }, {
                        xtype: 'button',
                        action:'deleteInvoiceRule',
                        iconCls: 'icon-delete'
                    }],
                    store:'acc.InvoiceRule',
                    columns: [
                        {
                            header: 'No',
                            width: 50,
                            xtype: 'rownumberer',
                            align: 'center'
                        }, {
                            header: 'Rule Name',
                            width: 200,
                            dataIndex: 'rule_name'
                        }, {
                            header: 'Day From Bill',
                            width: 150,
                            dataIndex: 'from_days'

                        },{
                            header: 'Day To Bill',
                            width: 150,
                            dataIndex: 'to_days'
                        }, {
                            header: 'Alert',
                            width: 100,
                            dataIndex: 'alert_type_id',
                            renderer:function(value ,raw){
                                switch(value) {
                                    case 1:
                                        return "None";
                                        break;
                                    case 2:
                                        return "Call";
                                        break;
                                    case 3:
                                        return "SMS";
                                        break;
                                    case 4:
                                        return "Email";
                                        break;
                                }

                            }

                        }, {
                            header: 'Action',
                            dataIndex: 'action_type_id',
                            renderer:function(value , raw){
                                switch(value) {
                                    case 1:
                                        return "None";
                                        break;
                                    case 2:
                                        return "Warning";
                                        break;
                                    case 3:
                                        return "Penalty";
                                        break;
                                    case 4:
                                        return "Lock";
                                        break;
                                }
                            }
                        },{
                            header: 'Charge/day',
                            width: 150,
                            dataIndex: 'charge_per_day'
                        }, {
                            header: 'Create Date',
                            dataIndex: 'created_at',
                            width:150
                        }, {
                            header: 'Status',
                            flex: 1,
                            dataIndex: 'is_active',
                            align:'center',
                            renderer:function(value ,raw){
                                if (value) {
                                    return "<span style='color:green'><b> Active </b></span> ";
                                } else{
                                    return "<span style='color:red'><b> Deactive </b></span> ";

                                };
                            }
                        },


                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'acc.InvoiceRule',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return grid;


    },

});