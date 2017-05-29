Ext.define('ExtDesktop.view.search.WinSearchLocations', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchLocations',
	title		: 'Select Location',
	resizable	: false,
    height		: 450,
    layout		: 'fit',
    modal       : true,
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
                       store: 'Campus',
                       border:false,
                       name:'GridSearchLocation',
                       columnLines :  true ,
                       height: '100%',
		               columns: [
                                   {text:'id',hidden:true,dataIndex:'id'},
                                   { xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                   {text:'Code',dataIndex:'campus_code',width:100,align:'center'},
                                   {text:'Name',dataIndex:'campus_name',width:160},
                                   {text:'Abbreviate',dataIndex:'abbr',width:100},
                                   {text:'Address',dataIndex:'address',flex:1}
					     ],
		                viewConfig: {
		                    enableTextSelection: true
		                },
		                bbar: Ext.create('Ext.PagingToolbar', {
		    			          store: 'Campus',
		    			            displayInfo: true,
		    			            displayMsg: 'View {0} - {1} of {2}',
		    			            emptyMsg: "View 0"
		    		    })

		     }
		return grid;
	}
});