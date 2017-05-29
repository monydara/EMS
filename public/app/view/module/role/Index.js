Ext.define('ExtDesktop.view.module.role.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridRole',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Roles',
    title:'Role List',
    closable:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                    {
                        xtype:'textfield',
                        name:'search',
                        emptyText:'Enter search keyword here...',
                        width: 450
                    },
                    '->',
                    {
                        xtype:'button',
                        text:'Create',
                        action:'Create',
                        iconCls:'icon-add',
                        width: 80
                },
                {
                        xtype: 'button',
                        text: 'Edit',
                        action: 'Edit',
                        iconCls: 'icon-edit',
                        width: 80
                } ,{
                        xtype:'button',
                        text:'Delete',
                        action:'Delete',
                        iconCls:'icon-Delete',
                        width: 80
                }
            ],
            columns: [
                        { 
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{ xtype :'rownumberer',text  :'No.',align :'center',width :50},{
                        	 sortable: true,
                             dataIndex: 'code',
                             text: 'Code',
                             width: 120
                        },{
                            sortable: true,
                            dataIndex: 'name',
                            text: 'Role',
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
			          store: 'Roles',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});