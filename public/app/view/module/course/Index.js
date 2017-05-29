Ext.define('ExtDesktop.view.module.course.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCourse',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'acd.Course',
    title:'Course List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[

                  {
	                xtype:'textfield',
	                name:'search',
	                emptyText:'Enter search keyword here...',
	                width: 450
                  },'->',{
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
                            sortable: true,
                            dataIndex: 'code',
                            text: 'Code',
                            width: 120
                        },{
                            dataIndex: 'name',
                            text: 'Course',
                            flex: 1
                        },{
                            text:'ឈ្មោះវគ្គសិក្សា',
                            dataIndex:'khr_name',
                            flex:1
                        },{
                            sortable: true,
                            dataIndex: 'abbr',
                            text: 'Abbreviation',
                            width: 120
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          	store: 'acd.Course',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});
