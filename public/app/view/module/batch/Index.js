Ext.define('ExtDesktop.view.module.batch.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridBatch',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Batch',
    title:'Batch List',
    closable:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                    '->',
                    {
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
                          xtype :'rownumberer',
                          text  :'No.',
                          align :'center',
                          width :50
                      },{
                            sortable    : true,
                            dataIndex   : 'code',
                            text        : 'Code',
                            width       : 120
                      },{
                            dataIndex   : 'name',
                            text        : 'Batch',
                            flex        : 1
                      },{
                            dataIndex   :'khr_name',
                            text        :'ជំនាន់',
                            flex        :1
                      }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Batch',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});