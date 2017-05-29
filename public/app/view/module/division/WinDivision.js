Ext.define('ExtDesktop.view.module.division.WinDivision', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmDivision',
	title: 'Division',
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
                                 emptyText:'Division code',
                                 maxLength: 6,
                                 fieldLabel:'Code'
                           	},
                           	{
                                xtype:'textfield',
                                name:'name',
                                maxLength:50 ,
                                emptyText:'Division name',
                                fieldLabel:'Name'
                            },{
                              	xtype:'textfield',
                              	name:'khr_name',
                                maxLength:50 ,
                                emptyText:'Division Khmer name',
                                fieldLabel:'Khmer Name'
                            },{
                                  xtype:'numberfield',
                                  name:'sequence',
                                  fieldLabel:'Sequence',
                                  minValue:0 ,
                                  maxValue:100
                            }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

