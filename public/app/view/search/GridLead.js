Ext.define('ExtDesktop.view.search.GridLead', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.gridLead',
	width: 700,
	height: 300,
	initComponent: function() {
		var me = this;

		Ext.applyIf(me, {
			columns: [{
					header: 'No',
					align: 'center',
					width: 50,
					xtype:'rownumberer'
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
					header:'DOB',
					dataIndex:"date_of_birth"
				},{
					header:'Phone',
					dataIndex:'phone'
				},{
					header:'Place Of Birth',
					dataIndex:'place_of_birth'
				}

			],
			store:'sdn.Lead',
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
				store: 'sdn.Lead',
				displayInfo: true,
				displayMsg: 'view {0} - {1} of {2}',
				emptyMsg: "View 0"
			})
		});
		me.callParent(arguments);
	},



});