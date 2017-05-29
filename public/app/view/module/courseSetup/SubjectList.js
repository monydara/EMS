Ext.define('ExtDesktop.view.module.courseSetup.SubjectList', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridSubject',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Subject',
    closable:true,
    columnLines:true,

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[ 
                {
	                xtype:'textfield',
	                name:'keyword',
	                emptyText:'Enter search keyword here...',
                    height: 35,
	                width: 200
            	}, '->' ,
                {
                    xtype:'button',
                    action:'addSubject',
                    text:'Ok',
                    width:40,
                    height:35,
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
                            width: 100
                        },{
                            dataIndex: 'name',
                            text: 'Subject',
                            flex: 1  
                        }/*,{
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
                        }*/
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