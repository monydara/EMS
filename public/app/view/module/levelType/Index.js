Ext.define('ExtDesktop.view.module.levelType.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridLevelType',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'LevelType',
    title:'Level Type List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                  {
				    xtype:'textfield',
				    name:'search',
				    fieldLabel: 'Filter',
				    emptyText:'Enter search keyword here...',
				    width: 450
				 }
				 ,'->',{
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
	                            text: 'CODE',
	                            width: 120
                        },{
	                            dataIndex: 'name',
	                            text: 'LEVEL TYPE NAME',
	                            flex: 1  
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'LevelType',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});