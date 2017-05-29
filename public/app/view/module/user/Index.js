Ext.define('ExtDesktop.view.module.user.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridUser',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'User',
    title:'Users',
    closable:true,
    columnLines :  true ,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                {
                    xtype:'textfield',
                    name:'search',
                    emptyText:'Enter search keyword here...',
                    width: 450
                },'->',
                {
                    xtype:'button',
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add',
                    width: 80
                },
                 {
                    xtype:'button',
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit',
                    width: 80
                }
            ],
            columns: [
                        {
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true

                        },{ xtype :'rownumberer',text  :'No.',align :'center',width :50},{

                                dataIndex: 'user_id',
                                text: 'User ID',
                                width: 100
                        },{
	                            flex:1,
	                            dataIndex: 'user_name',
	                            text: 'User Name'
                        },{
                            width: 120,
                            dataIndex: 'position',
                            text: 'Position'
                            
                        },{
                            width: 120,
                            dataIndex: 'department',
                            text: 'Department'
                            
                        },{
                            width: 120,
                            dataIndex: 'phone',
                            text: 'Phone'
                        },{
                           
                            width: 120,
                            dataIndex: 'email',
                            text: 'Email'
                        },{
                            width: 120,
                            dataIndex: 'home_campus',
                            text: 'Home Campus'
                        },{
                            width: 120,
                            dataIndex: 'user_type',
                            text: 'User Type'
                        },{
                        	width: 120,
                            dataIndex: 'status',
                            text: 'Status'
                        }
            ],
            
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'User',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});