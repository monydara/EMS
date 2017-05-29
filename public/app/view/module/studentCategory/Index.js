Ext.define('ExtDesktop.view.module.studentCategory.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCategory',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'StudentCategory',
    title:'Category List',
    closable:true,
    columnLines:true,

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                    '->',
                    { xtype:'button', text:'Create', action:'Create', iconCls:'icon-add', width: 80},
                    { xtype:'button', text:'Edit', action:'Edit', iconCls:'icon-edit', width: 80},
                    { xtype:'button', text:'Delete', action:'Delete', iconCls:'icon-delete', width: 80}
            ],
            columns: [
                        {
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true

                        },{
                        	 sortable: true,
                             dataIndex: 'code',
                             text: 'Code',
                             width: 120
                        },{
                            sortable: true,
                            dataIndex: 'name',
                            text: 'Name',
                            width: 200
                        },{
                            dataIndex: 'description',
                            text: 'Description',
                            flex: 1  
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'StudentCategory',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});