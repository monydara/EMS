Ext.define('ExtDesktop.view.module.keyAccount.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridKeyAccount',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'KeyAccount',
    title:'Key Account List',
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
                            text:'Delete',
                            action:'Delete',
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
                                dataIndex: 'id',
                                text: 'ID',
                                hidden: true
                        },{
                                sortable: true,
                                dataIndex: 'code',
                                text: 'Code',
                                width: 120
                        },{
                                dataIndex: 'name',
                                text: 'Key Account Name',
                                flex: 1
                        },{
                                dataIndex: 'refer_type',
                                text: 'Refer To',
                                flex: 1,
                                hidden:true

                        },{
                                dataIndex:'refer_type_desc',
                                header:'Refer to',
                                width: 160
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			            store: 'KeyAccount',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});