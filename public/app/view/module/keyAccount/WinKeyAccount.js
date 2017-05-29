Ext.define('ExtDesktop.view.module.keyAccount.WinKeyAccount', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmKeyAccount',
	title: 'Key Account',
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
                                     emptyText:'Key account code',
                                     maxLength: 6,
                                     fieldLabel:'Code'
                           	},{
                                    xtype:     'textfield',
                                    name:      'name',
                                    maxLength:  50 ,
                                    emptyText:  'Key account name',
                                    fieldLabel: 'Name'
                            },{
                                xtype: 'combo',
                                name: 'refer_type',
                                fieldLabel: 'Refer to',
                                store: Ext.create('Ext.data.Store',{
                                    fields:['id','name'],
                                    data:[
                                            {id:'O',name:'Other'},
                                            { id:'S', name:'Student'},
                                            {id:'E', name:'Employee'}
                                    ]
                                }),
                                valueField: 'id',
                                displayField: 'name',
                                listeners:Util.firstSelect()
                            }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	]
        	
});

