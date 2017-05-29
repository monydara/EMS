Ext.define('ExtDesktop.view.module.prepaid.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridPrepaid',
    store: 'Prepaid',
    title:'Prepaid List',
    closable:true,    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[

                    {  xtype:'textfield',name:'txtSearch',emptyText:'Enter keyword here to search',width:320},
                    {  text:'Advance', action:'OpenWinSearch', iconCls:'icon-search'},
                    {  text:'Re-print', action:'Rollback', iconCls:'icon-printer'   }
            ],
            autoScroll:true,
            columnLines:true,
            columns: [
                        {
                                xtype: 'rownumberer',
                                text: 'No.',
                                align: 'center',
                                width: 35
                        }, {
                                width: 100,
                                dataIndex: 'trn_date',
                                xtype: 'datecolumn',
                                format: 'd-M-Y',
                                align: 'center',
                                text: 'Tran. Date'
                        },{
                                text: 'Receipt No',
                                dataIndex: 'receipt_no',
                                width: 100,
                                align: 'center'
                        }, {
                                text: 'Student Name',
                                dataIndex:'name',
                                flex: 1
                        },{
                                text: 'Degree',
                                dataIndex: 'degree_name',
                                width: 120
                        },{
                                text: 'Course',
                                dataIndex: 'course_name',
                                flex: 1
                        }, {
                                dataIndex: 'currency',
                                text: 'Currency',
                                align:'center',
                                width: 80
                        },{
                                text: 'Tran. Amount',
                                dataIndex: 'trn_amount',
                                align:'right',
                                width: 100
                        },{
                                text: 'Ex. Rate',
                                dataIndex: 'ex_rate',
                                align:'right',
                                width: 80
                        }, {
                                text: 'Amount (USD)',
                                dataIndex: 'lcy_amount',
                                width: 120,
                                align:'right'
                        },{
                                text: 'Maker',
                                dataIndex: 'user_name',
                                width: 120
                        }, {
                                text: 'Status',
                                dataIndex: 'status',
                                width: 80,
                                align: 'center',
                                renderer: function (value) {
                                    if (value == "B") {
                                        return "Booked";
                                    } else if (value == "C") {
                                        return "Committed"
                                    } else if (value == "R") {
                                        return "Rollback";
                                   /* } else if (value == "F") {
                                        return "Refunded";*/
                                    }
                                }
                        },{
                                xtype:'actioncolumn',
                                header:'Action',
                                align:'center',
                                width: 80,
                                items:[
                                    {
                                        iconCls:'icon-refresh',
                                        tooltip:'Rollback Payment',
                                        handler:function(grid , rowIndex){
                                            var ctrl = ExtDesktop.app.getController("Lead");
                                            ctrl.rollbackDeposit(grid , rowIndex);
                                        },
                                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                                            var isDisabled=record.get('status')=="B";
                                            return !isDisabled;
                                        }
                                    }
                                ]
                        }
            ],        
            viewConfig: {
                            enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'Prepaid',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
            
        });
        me.callParent(arguments);
    }

});