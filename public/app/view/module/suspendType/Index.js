Ext.define('ExtDesktop.view.module.suspendType.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridSuspendType',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'sdn.SuspendType',
    title:'Suspend Reason',
    closable:true,
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
                                text: 'Suspend Type',
                                width: 160

                        },{
                            dataIndex:'description',
                            header:'Description',
                            flex: 1
                }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			            store: 'sdn.SuspendType',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});