Ext.define('ExtDesktop.view.module.course.WinMajor', {
	extend: 'Ext.window.Window',
	alias: 'widget.courseWinMajor',
	title: 'Major List',
	modal: true,
	resizable: false,
	// height		: 550,
	layout: 'fit',
	width: 800,
	autoShow: false,
	initComponent: function() {
		var me = this;
		Ext.applyIf(me, {
			items: [
				// call grid major form
				Ext.create('ExtDesktop.view.module.major.Index',{
					title:'',
					closable:false,
					height: 300 ,
					tbar:[
						{
							xtype:'textfield',
							width:350 ,
							name:'search',
							fieldLabel:'Search',
							labelAlign:'right',
							emptyText:'--- Type here for search ---',
							labelWidth:100
						}
					]
				})
			],
			buttons: [{
				text: 'Ok',
				action: 'Ok',
				iconCls: 'icon-ok'
			}, {
				text: 'Cancel',
				action: 'Cancel',
				iconCls: 'icon-cancel',
				handler:function(btn){
					btn.up("window").close();
				}
			}]
		});
		me.callParent(arguments);
	},

});
