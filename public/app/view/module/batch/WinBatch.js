Ext.define('ExtDesktop.view.module.batch.WinBatch', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmBatch',
	title: 'Batch',
	modal:'true',
	height:330,
	width:500,
	items:[
            {
                xtype:'form',
                bodyPadding:20,
                defaults:{width:450,height:30, allowBlank:false},
                fieldDefaults: {
                    labelWidth: 125
                },
                items:[
                          {
                               xtype:'textfield',
                               name:'code',
                               maxLength:6,
                               emptyText:'Enter batch code',
                               fieldLabel:'Batch Code'
                          },{
                               xtype:'textfield',
                               name:'name',
                               maxLength:50,
                               emptyText:'Enter batch name',
                               fieldLabel:'Batch Name'
                          },{
                                xtype:'textfield',
                                name:'khr_name',
                                maxLength:50,
                                emptyText:'ជំនាន់',
                                fieldLabel:'ជំនាន់'
                          }
				 ]
            }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save'},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	]
        	
});

