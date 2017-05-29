var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.levelTC.WinLevel', {
	extend		: 'Ext.window.Window' ,
	alias		: 'widget.FrmWinLevel' ,
	title		: 'TC Level',
	modal		: true,
	resizable	: false,
	layout		: 'fit',
	
	initComponent: function() {
        var me = this;	     
        Ext.applyIf(me,{
            items:[ 
                    {
                    	xtype:'panel',
                    	border: false,
                    	items:[this.formCourse()]
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
	                defaults:{width:450,height:30},
	                fieldDefaults: {
	                    labelWidth: 125
	                },
	                items:[
	                	{
	                		xtype:'hiddenfield',
	                		name:'course_id'
	                	},
	                		{
	                        	xtype:'textfield',
	                        	name:'code',
	                        	fieldLabel:'Code',
                                afterLabelTextTpl: required,
                                allowBlank:false,
	                        	emptyText:'Enter level Code'
	                        },
	                       	{
	                          	xtype:'textfield',
	                          	name:'name',
	                          	allowBlank: false,
	                          	emptyText:'Enter level',
                                afterLabelTextTpl: required,
	                            fieldLabel:'Level Name'
	                        },{
							    xtype:'combo',
                                name:'level_type_id',
							    fieldLabel:'Level Type',
							    emptyText:'Select....',
							    valueField:'id',
                                displayField:'name',
                                allowBlank:false,
                                queryMode:'local',
                                afterLabelTextTpl: required,
							    store:'LevelType'
	                        },{
                                xtype:'numberfield',
                                name:'sequence',
                                afterLabelTextTpl: required,
                                fieldLabel:'Sequence',
                                value:1
                        }

                    ]
	            	}//end form
            
			return form;
	}
});

