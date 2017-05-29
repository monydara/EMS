Ext.define('ExtDesktop.view.search.WinSearchUsers', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchUsers',
	title		: 'Select User',
	resizable	: false,
    modal       : true,
	height		: 450,
	layout		: 'fit',
	width		: 550,
	autoShow	: false,
	initComponent: function() {
        var me = this;
        Ext.applyIf(me,{
        	items:[this.gridSearch()]
        });
        me.callParent(arguments);
	},
	gridSearch:function(){
		var grid={
				      xtype:'grid',
		              tbar:[{
		    	                xtype:'textfield',
		    	                name:'search',
		    	                emptyText:'Enter search keyword here...',
		    	                width: 250
		               }],
		               autoScroll:true,
                       store: 'User',
                       border:false,
                       name:'GridSearchUsers',
                       columnLines :  true ,
                       height: '100%',
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
                                width: 100,
                                dataIndex: 'user_type',
                                text: 'User Type'
                            },{
                                width: 100,
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

		     }
		return grid;
	}
	
	
});