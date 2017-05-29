Ext.define('ExtDesktop.view.module.major.WinMajor', {
	extend: 'Ext.window.Window',
	alias: 'widget.FmMajor',
	title: 'Major',
	modal:'true',
	layout:'fit',
	items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:450,height:30},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:[
                           	{
                           	 xtype:'textfield',
                           	 name:'code',
                             emptyText:'Enter Major Code',
                             fieldLabel:'Major Code'
                           	},
                           	{
                              	xtype:'textfield',
                              	name:'name',
                                emptyText:'Enter Major Name',
                                fieldLabel:'Major Name'
                               
                            },{
                                xtype:'textfield',
                                name:'khr_name',
                                fieldLabel:'ជំនាញ',
                                emptyText:'ឈ្មោះជំនាញ'
                            }
                          
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

