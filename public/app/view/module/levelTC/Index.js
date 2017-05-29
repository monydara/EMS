Ext.define('ExtDesktop.view.module.levelTC.Index', {
    extend		: 'Ext.panel.Panel',
    alias		: 'widget.PanelLevelTC',
    stateId		: 'stateGrid',
    title		: 'Level List',
    closable	: true,
    layout		: 'border',
    defaults	: { collapsible: true, split: true},
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[{
                	   	title: 'Course Title',
                	    region:'west',
                	    margins: '5 0 0 0',
                	    cmargins: '5 5 0 0',
                	    width: 400,
                	    minSize: 100,
                	    maxSize: 250,
                	    layout:'fit',
                	    items:[this.gridCourse()]
                   },{
                	    title: 'Level List',
                	    collapsible: false,
                	    region:'center',
                	    margins: '5 0 0 0',
                	    layout:'fit',
                	    items:[this.gridLevel()]
                   }]
        });
        me.callParent(arguments);
    },

    gridLevel:function(){
    	var grid={
		    			xtype		:	'grid',
						border		:	false,
					    name		:	'GridTCLevel',
					    store		: 	'TCLevel',
					    autoScroll	:	true,
					    columnLines :  	true ,
		                height		: 	'100%',
		                tbar:[
		                      '->',{
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
		                    }
		                ],
		                columns:[{ 
		                       			xtype:'rownumberer',
		                                text:'No.',
		                                align:'center',
		                                width:50
		                            },{ 
							            dataIndex: 'id',
							            text: 'ID',
							            hidden: true
		                       		},{
                                        text:'Code',
                                        dataIndex:'code',
                                        width: 120
                                    },{
		                       			dataIndex: 'name',
		                       			text:'Level',
		                       			flex:1
							        },{
		                       			dataIndex: 'level_type',
		                       			text:'Level Type',
		                       			width: 250
							        },{
                                        dataIndex: 'sequence',
                                        text:'Sequence',
                                        width: 120,
                                        align: 'center'
                        }],
                       viewConfig: {
                           enableTextSelection: true
                       },
                       /*bbar: Ext.create('Ext.PagingToolbar', {
        			            store: 'TCLevel',
          			            displayInfo: true,
           			            displayMsg: 'View {0} - {1} of {2}',
          			            emptyMsg: "View 0"
                       })*/
    	}
    	
    	return grid;
    },
    gridCourse:function(){
    	var grid={
    				xtype	: 'grid',
    				border	: false,
    			    name	: 'GridCourseLevel',
    			 	stateId	: 'stateGrid',
    			    store	: 'CourseTC',
    			    autoScroll: true,
    			    columnLines : true ,
                    height	: '100%',
                    tbar:[{
                        	fieldLabel:'Filter',
                        	labelWidth:40,
        	                xtype:'textfield',
        	                action:'search',        	                
        	                width: 350
                    }],
                    columns:[
							    	{ 
							            dataIndex: 'id',
							            text: 'ID',
							            hidden: true
							        },{
							            sortable: true,
							            dataIndex: 'code',
							            text: 'Code',
							            width: 80
							        },{
                                        dataIndex: 'name',
                                        text: 'Course Title',
                                        flex: 1
							        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
        			            store: 'CourseTC',
        			            displayInfo: true,
        			            displayMsg: 'View {0} - {1} of {2}',
        			            emptyMsg: "View 0"
        			        })
    	}
    	
    	return grid;
    }
   
	
});