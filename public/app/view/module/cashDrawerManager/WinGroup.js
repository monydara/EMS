Ext.define('ExtDesktop.view.module.cashDrawerManager.WinGroup', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmGroup',
	title: 'Group',
	modal:'true',
	items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:450},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:[
								  {
									  	 xtype:'textfield',
									  	name:'group_name',
									    emptyText:'-- Group name --',
									    fieldLabel:'Group Name'
								  },{
									  xtype:'textareafield',
									  name:'description',
									  fieldLabel:'Description'
								  },{
								  	xtype:'container',
								  	// title:'Status',
								  	defaultType:'radiofield',
								  	layout:'hbox',
								  	defaults:{
								  		name:'is_active'
								  	},
								  	items:[
								  		{
								  			boxLabel:'<span style="color:green,font-wieght:bold"> Active </span>',
								  			fieldLabel:'Status',
								  		
								  			style:'color:green,font-wieght:bold',
								  			inputValue:1,
								  			checked:true
								  		},{
								  		
								  			boxLabel:'<span style="color:red,font-wieght:bold" > Deactive</span>',
								  			style:'margin-left:30px',
								  			inputValue: 0
								  		}

								  	]

								  }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

