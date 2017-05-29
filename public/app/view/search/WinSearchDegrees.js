Ext.define('ExtDesktop.view.search.WinSearchDegrees', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchDegrees',
	title		: 'Select Degree',
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
		               autoScroll:true,
                       store: 'Degree',
                       border:false,
                       name:'GridSearchDegree',
                       columnLines :  true ,
                       height: '100%',
		               columns: [
                                   {text:'ID',hidden:true,dataIndex:'degreeId'},
                                   {xtype:'rownumberer',text  :'No.',align :'center',width :50},
                                    {text:'Abbreviate',dataIndex:'abbr',width:100},
                                   {text:'Degree',dataIndex:'name',flex:1},
                                    {text:'Degree Type',dataIndex:'degree_type',width:100}
					   ],
		                viewConfig: {
		                    enableTextSelection: true
		                },
		                bbar: Ext.create('Ext.PagingToolbar', {
		    			            store: 'Degree',
		    			            displayInfo: true,
		    			            displayMsg: 'View {0} - {1} of {2}',
		    			            emptyMsg: "View 0"
		    		    })

		     }
		return grid;
	}
});