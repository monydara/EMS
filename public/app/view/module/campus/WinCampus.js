Ext.define('ExtDesktop.view.module.campus.WinCampus', {
	extend: 'Ext.window.Window',
	id:'WinCampus',
	alias: 'widget.FrmCampus',
	title: 'Campus',
	modal:'true',
	resizable:false,
	height:500,
	layout:'fit',
	width:500,
	autoShow: false,
	initComponent: function() {
	        var me = this;
	        Ext.applyIf(me,{
					items:[
				                {
				                    xtype:'form',
				                    bodyPadding:10,
				                    items:[
				                           this.campusInfo(),
				                           this.campusContact()
				                    ]
				                }],
					buttons:[

					         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
					         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
					],
	        });
	        me.callParent(arguments);
	},
	campusInfo:function(){
		var info={
					 xtype:'container',
	         		 //layout:'hbox',
	                 padding:10,
	                 items:[
	                        	{
	                        		defaults:{width: 420},
	                        		fieldDefaults: {labelWidth: 120},
	                        		items:[
	                                   		{xtype:'hidden',name:'campusId'},
	                                   		{xtype: 'textfield',name:'campus_code',fieldLabel:'Campus Code <font style="color:red">*</font>',emptyText:'Campus code...',allowBlank:false},
	                                   		{xtype: 'textfield',name:'campus_name',fieldLabel:'Campus Name <font style="color:red">*</font>',emptyText:'Campus name...',allowBlank:false},
	                                   	]
	                        	},{
	                        		defaults:{width: 420},
	                        		//padding:'0 0 0 10px',
	                        		fieldDefaults: {labelWidth: 120},
	                        		items:[
	                        		       	{xtype: 'textfield',name :'director',emptyText:'Campus\'s Director ... ',fieldLabel:'Director'},
	                        		       	{
	                                   			xtype: 'container',
												layout: 'hbox',
												align: 'middle',
												  items: [
												          { xtype: 'textfield',name:'abbr',
													  		fieldLabel:'Abbreviate <font style="color:red">*</font>',
													  		allowBlank:false,emptyText:'Abbreviate name ... ',
												          },
												          {xtype: 'label',width: 60,margin: '5px 0 0 5px',text:'(2 digits)'}]
	                                   	    }]
	                        	}

	                        ]

			}
		return info;
	},
	campusContact:function(){
			var contact={
							 xtype:'fieldset',
		                     title:'Contact',
                     		 padding:10,
                     		 defaults:{width: 420},
		               		 fieldDefaults: {labelWidth: 120},
							 items:[
		                       		{
										xtype: 'textfield',
										name :'phone',
										emptyText:'Phone ... ',
										fieldLabel:'Phone'
									},{

										xtype: 'textfield',
										name :'email',
										emptyText:'Email ... ',
										fieldLabel:'Email'
									},{
		               		margin:'5px 0 0 0',
		               		xtype:'textarea',
		               		name:'address',
		               		fieldLabel:'Address'
		               	}
								]
			}
			return contact
	}

});
