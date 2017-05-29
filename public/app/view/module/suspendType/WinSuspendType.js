Ext.define('ExtDesktop.view.module.suspendType.WinSuspendType', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmSuspendType',
	title: 'Suspend Type',
	modal:'true',
	height:300,
	width:500,
	items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:450, allowBlank:false},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:[
                           	{
                                 xtype:'textfield',
                                 name:'code',
                                 emptyText:'Suspend type code',
                                 maxLength: 6,
                                 fieldLabel:'Code'
                           	},{
                                xtype:     'textfield',
                                name:      'name',
                                maxLength:  50 ,
                                emptyText:  'Suspend type',
                                fieldLabel: 'Suspend type'
                            },{
                              	xtype:'textfield',
                              	name:'description',
                                maxLength:250,
                                allowBlank:true,
                                emptyText:'Description',
                                fieldLabel:'Description'
                            }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	]
        	
});

