Ext.define('ExtDesktop.view.module.levelType.WinLevelType', {
	extend: 'Ext.window.Window',
	alias:  'widget.FrmLevelType',
	title:  'Level Type Maintenance',
	modal:  true,
	height: 330,
	width:  500,
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
									     emptyText:'Enter level type code',
									     fieldLabel:'Code(<font color="red">*</font>)',
									     allowBlank: false
								  },{
								        xtype:'textfield',
								        name:'name',
								        emptyText:'Enter level type name',
								        fieldLabel:'Name(<font color="red">*</font>)',
								  }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'Save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'Cancel',iconCls:'icon-delete'}
	],
        	
});

