Ext.define('ExtDesktop.view.module.subject.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridSubject',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Subject',
    title:'Subject List',
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
                            dataIndex: 'subjectId',
                            text: 'ID',
                            hidden: true
                        },{
                            sortable: true,
                            dataIndex: 'code',
                            text: 'Code',
                            width: 80
                        },{
                            dataIndex: 'name',
                            text: 'Subject',
                            flex: 1  
                        },{
                            dataIndex:'khr_name',
                            text:'មុខវិជ្ជា',
                            flex: 1
                        },{
                            dataIndex: 'subject_type',
                            text: 'Subject Type',
                            width: 160
                        },{
                            dataIndex: 'credit',
                            text: 'Credit(s)',
                            align: 'right',
                            width: 120
                        },{
                            dataIndex: 'sessions',
                            text: 'Total Sessions',
                            align: 'right',
                            width: 120
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
			          store: 'Subject',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});