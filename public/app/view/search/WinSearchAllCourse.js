Ext.define('ExtDesktop.view.search.WinSearchAllCourse', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.WinSearchAllCourse',
	width: 700,
	height: 300,
	initComponent: function() {
		var me = this;
		var fn = this.nextFn;
		var btn = this.btn;
		Ext.applyIf(me, {
			columns: [{
					header: 'No',
					align: 'center',
					width: 50
				}, {
					header: 'Code',
					dataIndex: 'code',
					flex: 1

				}, {
					header: 'Abbr',
					dataIndex: 'abbr',
					flex: 1

				}, {
					header: 'Name',
					dataIndex: 'name',
					flex: 1

				}, {
					header: 'Course Type',
					dataIndex: 'course_type',
					flex: 1

				}

			],
			store:'Course',
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
				store: 'Course',
				displayInfo: true,
				displayMsg: 'view {0} - {1} of {2}',
				emptyMsg: "View 0"
			})
		});
		me.callParent(arguments);
	},



});