Ext.define('ExtDesktop.view.module.major.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridMajor',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Major',
    title:'Major List',
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
	                }, {
                        xtype:'button',
                        text:'Edit',
                        action:'Edit',
                        iconCls:'icon-edit',
                        width: 80
                    }, {
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
                            sortable: true,
                            dataIndex: 'code',
                            text: 'Code',
                            width: 200
                        },{
                            dataIndex: 'name',
                            text: 'Major',
                            flex: 1
                        },{
                            dataIndex: 'khr_name',
                            text: 'ឈ្មោះជំនាញ',
                            flex: 1
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          	store: 'Major',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});