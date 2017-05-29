Ext.define('ExtDesktop.view.module.currency.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCurrency',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'acc.Currency',
    title:'Currency List',
    closable:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[

                '->',{
                    xtype:'button',
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add',
                    width: 80
                },{
                    xtype:'button',
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit',
                    width: 80
                },{
                    xtype:'button',
                    text:'Close',
                    action:'Close',
                    iconCls:'icon-delete',
                    width: 80
                }
            ],
            columns: [
                      	{
                          xtype:'rownumberer',
                          text:'No.',
                          align:'center',
                          width:50
                      	},{
                            sortable: true,
                            dataIndex: 'ccy_code',
                            text: 'Currency Code',
                            align:'center',
                            width: 160
                        },{
                            dataIndex: 'ccy_name',
                            text: 'Currency Name',
                            flex: 1
                        },{
                            dataIndex:'ccy_rate',
                            text:'Rate',
                            width: 160,
                            align:'right'
                        },{
                               dataIndex:'status',
                               text:'Status',
                                width: 160,
                                align:'center',
                                renderer: function(value, raw, record) {
                                    var data = record.data;
                                    var status = data.status == "O" ? "Open" : "Closed";
                                    return status;
                                }
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'acc.Currency',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});
