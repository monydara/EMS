Ext.define('ExtDesktop.view.module.account.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.AccountGrid',
    initComponent: function() {
        var me = this;
        Util.loadStoreInController("Account");
        Ext.applyIf(me, {
            flex: 1,
            title: 'Account List',
            store:'acc.StudentAccount',
            columnLines:true,
            tbar: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'Filter',
                    name: 'filter',
                    emptyText: '-- Type For Search --',
                    labelWidth: 50,
                    width: 350,
                    labelAlign: 'right'
                }, {
                    text: 'Advance',
                    iconCls: 'icon-search',
                    action: 'AdvanceSearch'
                },
                '->',
                {
                    text: 'View',
                    iconCls: 'icon-preview',
                    action: 'viewStudentAccount'
                },{
                    text: 'Setup',
                    iconCls: 'icon-preview',
                    action: 'AccountSetup'
                }
            ],
            columns: [
                {
                    header: 'No',
                    xtype: 'rownumberer',
                    width: 50,
                    align: 'center'
                },{
                    text: 'Student ID',
                    width: 100,
                    dataIndex: 'student_no'
                }, {
                    text: 'Name',
                    width: 220,
                    dataIndex: 'sdn_name'
                }, {
                    text: 'Register Date',
                    width: 120,
                    dataIndex: 'registered_date'
                }, {
                    text: 'Account Type',
                    width: 120,
                    dataIndex: 'account_type',
                    renderer:function(value ){
                        if (value == "N") {
                            return "Normal";
                        }else if(value == "L"){
                            return "Installment";
                        }else if(value == "S"){
                            return "Scholarship"
                        };
                    }
                },{
                    text:'Deposit',
                    dataIndex:'deposit_amount',
                    renderer:Ext.util.Format.usMoney,
                    align:'right'
                }, {
                    text:'Balance',
                    dataIndex:'balance',
                    renderer:Ext.util.Format.usMoney,
                    align:'right'
                },{
                    text: 'Status',
                    width: 120,
                    dataIndex: 'status',
                    align:'center',
                    renderer:function(value ){
                        if (value == "N") {
                            return "New";
                        }else if(value == "C"){
                            return "Completed";
                        }else if(value == "S"){
                            return "Stop"
                        }else{
                            return "Suspend"
                        };
                    }
                },{
                    text: 'Remark',

                    flex: 1,
                    dataIndex: 'remark'
                }],
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'acc.StudentAccount',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });

        me.callParent(arguments);
    }


});
