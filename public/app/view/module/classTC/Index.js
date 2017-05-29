Ext.define('ExtDesktop.view.module.classTC.Index', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.GridClassTC',
	stateId: 'stateGrid',
	store: 'acd.ClassTC',
	title: 'TC Class',
	closable: true,
	columnLines: true,
	initComponent: function() {
		var me = this;
		Ext.applyIf(me, {
			tbar: [
                    {
                        xtype: 'container',
                        width: '100%',
                        items: [{
                                    xtype: 'panel',
                                    bbar: [{
                                        xtype: 'textfield',
                                        name: 'search',
                                        fieldLabel: 'Filter',
                                        emptyText: 'Enter search keyword here...',
                                        width: 400
                                    }, '->', {
                                            xtype: 'button',
                                            text: 'Create',
                                            action: 'Create',
                                            iconCls: 'icon-add',
                                            width: 80
                                    }, {
                                            xtype: 'button',
                                            text: 'Edit',
                                            action: 'Edit',
                                            iconCls: 'icon-edit',
                                            width: 80
                                    }]
                            }
                        ]
                    }
			],
			columns: [
                {
				xtype: 'rownumberer',
				text: 'No.',
				align: 'center',
				width: 50
			}, {
				text: 'Code',
				dataIndex: 'class_code',
                width: 100
			}, {
				dataIndex: 'class_name',
				text: 'Class Name',
				flex:1
			}, {
				dataIndex: 'term',
				text: 'Term',
				width: 100
			}, {
				dataIndex: 'shift_name',
				text: 'Shift',
				width: 100
			}, {
				text: 'Room',
				width: 100,
				dataIndex: 'class_room'
			}, {
				width: 100,
				dataIndex: 'start_date',
				xtype: 'datecolumn',
				format: 'd-M-Y',
				text: 'Start Date'
			}, {

				width: 100,
				dataIndex: 'end_date',
				xtype: 'datecolumn',
				format: 'd-M-Y',
				text: 'End Date'
			}, {
				dataIndex: 'status',
				text: 'Status',
				width: 100,
				renderer:function(value){
                    if (value == "S") {
                        return "Started";
                    }else if(value == "F"){
                        return "Finished"
                    }else if (value == "P") {
                        return "Pending";
                    }else if (value == "C") {
                        return "Canceled";
                    };
                }
			}],
			viewConfig: {
				enableTextSelection: true
			},
			bbar: Ext.create('Ext.PagingToolbar', {
				store: 'acd.ClassTC',
				displayInfo: true,
				displayMsg: 'View {0} - {1} of {2}',
				emptyMsg: "View 0"
			})
		});
		me.callParent(arguments);
	}

});
