Ext.define('ExtDesktop.view.module.cashDrawerManager.WinAddMember', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmAddMember',
	title: 'Add Member',
	modal:'true',
	width:550,
	height:400,
	items:[
            {
            	xtype:'grid',
            	store:'acc.AddMember',
            	columns:[
            	         {header:'User Name',width:150,dataIndex:'user_id'},
            	         {header:'Staff Name',width:150,dataIndex:'user_name'},
            	         {header:'Phone',width:150,dataIndex:'phone'},
            	         {header:'Is Member',xtype:'checkcolumn',dataIndex:'is_member'}
            	         ]
            	
            }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

