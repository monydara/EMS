Ext.define('ExtDesktop.view.search.GridStudent', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.GridStudent',
	width: 700,
	height: 300,
	initComponent: function() {
		var me = this;
		Ext.applyIf(me, {
			columns: [{
					header: 'No',
					align: 'center',
					xtype:'rownumberer',
					width: 50
				},{
					header:'Student Code',
					dataIndex:'student_code'
				},{
					header:'Student No',
					dataIndex:'student_no'
				}, {
					header:'First Name',
					dataIndex:'first_name'
				},{
					header:'Last Name',
					dataIndex:'last_name'
				},{
					header:'Gender',
					dataIndex:'gender'
				},{
					header:'Phone',
					dataIndex:'phone'
				},{
					header:'Address',
					dataIndex:'address'
				}

			],
			store:'Student',
			tbar: [{
				xtype: 'textfield',
				fieldLabel: 'Search',
				emptyText: '-- Type Here To Search --',
				name: 'search',
				labelAlign: 'right',
				width: 350,
				labelWidth: 70,


			}],
			bbar: Ext.create('Ext.PagingToolbar', {
				store: 'Student',
				displayInfo: true,
				displayMsg: 'view {0} - {1} of {2}',
				emptyMsg: "View 0"
			})
		});
		me.callParent(arguments);
	},



});