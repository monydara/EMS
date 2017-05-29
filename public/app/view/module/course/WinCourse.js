Ext.define('ExtDesktop.view.module.course.WinCourse', {
	extend		: 'Ext.window.Window' ,
	alias		: 'widget.FrmCourse' ,
	title		: 'Course',
	modal		: true,
	resizable	: false,
	// height		: 550,
	layout		: 'fit',
	width		: 780,
	autoShow	: false,
	initComponent: function() {
        var me = this;
        Ext.applyIf(me,{
            items:[
                    {
                    	xtype:'panel',
                    	border: false,
                    	items:[
                    		this.formCourse(),
                    		{
                    			xtype:'panel',
                    			plan:false,
                    			items:[this.gridMajor()]
                    		}
                    	]
                    }
                  ],
            buttons:[
                     {text:'Save',action:'Save',iconCls:'icon-save'},
                     {text:'Cancel',action:'Cancel',iconCls:'icon-cancel'}
           ]
        });
        me.callParent(arguments);
	},


	formCourse:function(){
		var form={
	                xtype:'form',
	                bodyPadding:20,
	                defaults:{
	                	width:350,
	                	labelWidth:90,
	                	style:'margin-left:10px',
	                	height:30

	                },
	                layout:{
	                	type:'table',
	                	columns:2
	                },

	                items:[
	                		{
	                			xtype:'textfield',
	                			hidden:true,
	                			name:'course_type'
	                		},
	                       	{
		                       	 xtype:'textfield',
		                       	 name:'code',
		                       	 allowBlank: false,
		                       	 // labelWidth:50 ,
		                         emptyText:'Enter course code',
		                         fieldLabel:'Code',
                                 maxLength: 6
	                       	},{
	                          	xtype:'textfield',
	                          	name:'abbr',
		                       	 // labelWidth:50 ,

	                          	allowBlank: false,
	                            emptyText:'Enter abbreviation',
	                            fieldLabel:'Abbr',
                                maxLength: 3

	                        },{
	                          	xtype:'textfield',
	                          	name:'name',
	                          	// style:'margin-left:20px',
	                          	allowBlank: false,
		                       	// labelWidth:80 ,
		                       	//  width:350,

	                          	emptyText:'Enter course',
	                            fieldLabel:'Course name',
                                maxLength: 100

	                        },{
	                        	xtype:'textfield',
	                        	name:'khr_name',
	                        	fieldLabel:'ឈ្មោះវគ្គសិក្សា',
	                        	maxLength: 255
	                        },{
	                        	xtype:'numberfield',
	                        	name:'credit',
	                        	maxLength:11,
	                        	minValue: 0 ,
	                        	value: 0 ,
	                        	fieldLabel:'Credit',
	                        },{
	                        	xtype:'panel',
	                        	layout:'hbox',
	                        	items:[
	                        		{
	                        			xtype:'radiofield',
	                        			name:'status',
	                        			inputValue:'A',
	                        			labelWidth:90,
	                        			checked:true ,
	                        			fieldLabel:'Status',
	                        			boxLabel:'<span style="color:blue"><b>Active</b></span>'
	                        		},{
	                        			xtype:'radiofield',
	                        			name:'status',
	                        			inputValue:'C',
	                        			style:'margin-left:10px',
	                        			boxLabel:'<span style="color:red"><b>Close</b></span>',
	                        		}
	                        	]
	                        },{
	                        	xtype:'textarea',
	                        	name:'description',
	                        	fieldLabel:'Description',
	                        	colspan:2 ,
	                        	width: 710,
	                        	height: 70
	                        }

	                    ]
	            	}//end form

			return form;
	},

	gridMajor:function(){

		var grid={
				 xtype	: 'grid',
				 title	: 'Major',
				 store	: 'acd.MajorCourse',
				 name	: 'GridCourseMajor',
	             border:false,
	             height:200,
	             stateId: 'stateGrid',
	             collapsible: false,
	             columnLines :true ,
	             tools:[
	               {
	                	xtype:'button',
	                	action:'AddMajorToCourse',
	                	iconCls:'icon-add'
	                }
	             ],
	             columns:[
                  	{text:'ID',hidden:true,dataIndex:'subjectId'},
                  	{text:'CODE',dataIndex:'code',width:80},
                  	{text:'Major',dataIndex:'name',flex:1},
                  	{xtype:'actioncolumn',header:'Action',
                	align:'center',
                	items:[
            	       {
            	    	    icon:'resources/images/icons/delete.png',
            	    	    tooltip:'Delete Item',
            	    	    handler:function(grid, rowIndex, colIndex){

            	    	   		var ctrl = ExtDesktop.app.getController('Course');
            	    	   		ctrl.removeMajorRecord(grid,rowIndex);

            	    	    }
            	       }

                	]}


	            ],
	            viewConfig: {
					getRowClass: function(record, id) {
						return record.get("_destroy") == true ? "hidden" : "row-error";
					},
					 enableTextSelection: true
				}
			}
		return grid;
	}
});

