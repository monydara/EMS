Ext.define('ExtDesktop.view.search.WinSearchSubject', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.FrmSearchSubject',
	title		: 'Filter Subject',
	modal		: true,
	resizable	: false,
	height		: 550,
	layout		: 'fit',
	width		: 780,
	autoShow	: false,
	initComponent: function() {
        var me = this;	     
        var fn = this.nextFn;
        var btn = this.btn;
        Ext.applyIf(me,{
        	items:[this.gridSearch(fn,btn)]
        });
        me.callParent(arguments);
	},
	gridSearch:function(fn,btn){
		var grid={
				xtype:'grid',
		              tbar:[{
		    	                xtype:'textfield',
		    	                name:'search',
		    	                emptyText:'Enter search keyword here...',
		    	                width: 450
		               }],
		               autoScroll:true,
                       store: 'Subject',
                       border:false,
                       name:'GridSearchSubject',
                       columnLines :  true ,
                       height: '100%',
		               columns: [
		                         {		
		                        	  xtype:'rownumberer',
		                              text:'No.',
		                              align:'center',
		                              width:50
		                          },{
		                                sortable: true,
		                                dataIndex: 'code',
		                                text: 'CODE',
		                                width: 120
		                            },{
		                                dataIndex: 'name',
		                                text: 'SUBJECT',
		                                flex: 1  
		                            },{
		                                dataIndex: 'subject_type',
		                                text: 'SUBJECT TYPE',
		                                width: 200,
		                                renderer: function(obj){
		                                	return obj.name;
		                            }
					                },{
					                	xtype:'actioncolumn',
					                	header:'Action',
					                	align:'center',
					                	items:[
					                	       {
					                	    	   icon:'resources/images/icons/Ok.png',
					                	    	   handler: function(grid, rowIndex, colIndex) {
		    			        	                    var rec = grid.getStore().getAt(rowIndex);
		    			        	                    fn(rec,btn,grid);		    			        	                    
		    			        	                }
					                	       }
					                	       ]
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

		     }
		return grid;
	}
	
	
});