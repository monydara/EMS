Ext.define('ExtDesktop.view.search.WinSearchRoles', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchRoles',
	title		: 'Select Role',
	resizable	: false,
    modal       : true,
	height		: 450,
	layout		: 'fit',
	width		: 600,
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
                       store: 'Roles',
                       border:false,
                       name:'GridSearchRole',
                       columnLines :  true ,
                       height: '100%',
		               columns: [
                                   {text:'ID',hidden:true,dataIndex:'id'},
                                   { xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                   {text:'Code',dataIndex:'code',width:60},
                                   {text:'Name',dataIndex:'name',width:160},
                                   {text:'Description',dataIndex:'description',flex:1}
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

		     }
		return grid;
	}
	
	
});