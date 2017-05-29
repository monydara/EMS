Ext.define('ExtDesktop.view.module.employee.WinAttachedFile', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmAttachedFile',
	title: 'Attachment File',
	width: 380,
	modal: true,
	autoScroll: true,
	bodyPadding: 20,
	initComponent: function() {
		var me = this;
		Ext.applyIf(me, {
			items: [

				{
					xtype: 'form',
					name: 'mainForm',
					items: [

						{
							xtype: 'textfield',
							name: 'doc_name',
							fieldLabel: 'Document Name'
						}, {
							xtype: 'combo',
							name: 'doc_type_id',
							fieldLabel: 'Document Type',
							valueField: 'id',
							displayField: 'type_name',
							editable: false,
							store: 'combo.DocumentType',
							queryMode: 'local'
						}, {
							xtype: 'filefield',
							fieldLabel: 'Select File',
							name: 'avatar'
						}

					]
				}

			]
		});
		me.callParent(arguments);
	},

	buttons: [{
		text: 'Ok',
		iconCls: 'icon-save',
		action: 'Save'
	}, {
		text: 'Cancel',
		iconCls: 'icon-cancel',
		action: 'Cancel'
	}]


});