Ext.define('ExtDesktop.view.module.discountItemC.FmdiscountItem', {
	extend: 'Ext.window.Window',
	alias: 'widget.fmdiscountItem',
	//layout:'fit',
	modal: true,
	title: 'Form Discount',
	autoScroll: true,
	initComponent: function() {
		Ext.apply(this, {
			items: [
				this.formDiscountItem(), {
					xtype: 'tabpanel',
					margin:10,
					items: [
						this.gridDiscountItemDetail(),
						this.gridCourseItemDetail()

					]
				}

			]
		});
		this.callParent(arguments);
	},
	formDiscountItem: function() {
		var form = {
			xtype: 'form',
			defaultType: 'textfield',
			defaults: {
				labelAlign: 'right',
				typeAhead: true,
				width: 370,
				labelWidth: 150,
				minChars: 2
			},
			layout: {
				type: 'table',
				columns: 2
			},
			padding: 10,
			margin: 10,
			items: [{
					xtype: 'textfield',
					name: 'item_code',
					fieldLabel: 'Item Code',
					allowBlank: false
				}, {
					xtype: 'textfield',
					name: 'item_name',
					fieldLabel: 'Item Name',
					allowBlank: false
				}, {
					xtype: 'combo',
					fieldLabel: 'Discount Type',
					name: 'discount_type_id',
					store: 'DiscountTypeS',
					allowBlank: false,
					autoSelect: true,
					forceSelection: true,
					valueField: 'id',
					displayField: 'name'
				}, {
					xtype: 'datefield',
					name: 'effective_date',
					value: new Date(),
					fieldLabel: 'Effective Date',
					format: 'd-M-Y',
					submitFormat: 'Y-m-d'
				}, {
					xtype: 'datefield',
					name: 'expired_date',
					value: new Date(),
					fieldLabel: 'Expired Date',
					format: 'd-M-Y',
					submitFormat: 'Y-m-d'
				}, {
					xtype: 'textfield',
					fieldLabel: 'Source From',
					name: 'Autherizer'
				}, {
					xtype: 'textfield',
					fieldLabel: 'Reference No',
					name: 'reference_no'
				}, {
					xtype: 'textfield',
					fieldLabel: 'Note',
					name: 'note'
				},{
					xtype:'checkbox',
					name:'is_all_courses',
					fieldLabel:'All Course',
					checkedValue:true,
					uncheckedValue:false
				}

			]
		};
		return form;
	},
	gridDiscountItemDetail: function() {
		var cellEditing = Ext.create('Ext.grid.plugin.CellEditing', {
			clicksToEdit: 1,
			border: false
		});
		var units = Ext.create('Ext.data.Store', {
			fields: [{
				name: 'did',
				type: 'string'
			}, {
				name: 'Unit',
				type: 'string'
			}],
			data: [{
				'did': 'A',
				'Unit': 'Amount'
			}, {
				'did': 'P',
				'Unit': 'Percentage'
			}]
		});
		var grid = Ext.create('Ext.grid.Panel', {
			store: 'DiscountItemDetailS',
			style: 'margin-bottom:10px',
			name: 'griddiscountItemDetail',
			requires: ['Ext.ux.CheckColumn'],
			width: 750,
			height: 200,
			columnLines: true,
			viewConfig: {
				getRowClass: function(record, id) {
					return record.get("is_del") == 1 ? "hidden" : "row-error";
				}
			},
			columns: [{
				xtype: 'rownumberer',
				text: 'No.',
				width: 50,
				align: 'center'
			}, {
				text: 'Discount Unit',
				dataIndex: 'discount_unit',
				width: 150,
				editor: {
					xtype: 'combo',
					valueField: 'did',
					displayField: 'Unit',
					autoSelect: true,
					forceSelection: true,
					store: units
				},
				renderer: function(val) {
					index = units.findExact('did', val);
					if (index != -1) {
						rs = units.getAt(index).data;
						return rs.Unit;
					}
				}
			}, {
				text: 'Discount Value',
				dataIndex: 'discount_value',
				width: 150,
				editor: {
					xtype: 'numberfield',
					minValue: 0,
				}
			}, {
				xtype: 'checkcolumn',
				checked: false,
				text: 'Allow Edit',
				dataIndex: 'is_allow_edit',
				width: 80,
			}, {
				text: 'Note',
				dataIndex: 'note',
				flex: 1,
				editor: {
					xtype: 'textfield',
				}
			}],

			tbar: [{
				text: 'Add Item',
				iconCls: 'icon-add',
				action: 'AddItemToGridEdit',
				handler: function() {
					// Create a model instance
					var r = Ext.create('ExtDesktop.model.DiscountItemDetailM', {});
					r.set('is_del', 0);

					var newRecord = this.up('gridpanel').getStore().data.length;
					this.up('gridpanel').getStore().insert(newRecord, r);
					cellEditing.startEditByPosition({
						row: newRecord,
						column: 0
					});
				}
			}, {
				text: 'Remove Item',
				itemId: 'removeItem',
				iconCls: 'icon-delete',
				handler: function() {
					var row = grid.getSelectionModel().getSelection();
					if (row.length) {
						var record = row[0];
						record.data.is_del = 1;
						grid.getView().refresh(true);
					} else {
						this.msg('Please Select Record Before Select Edit');
					}
					//this.up('gridpanel').getStore().remove(item.getSelection());							                

					// var storeDetail = this.up('gridpanel').getStore();

					//                 		storeDetail.each(function(record,idx){
					//      val = record.get('is_del');							     
					//         record.set('is_del',0);							     
					//      record.commit();
					// });
				},
				disabled: true
			}, ],
			border:true,
			selType: 'cellmodel',
			plugins: [cellEditing],
			listeners: {
				'selectionchange': function(view, records) {
					grid.down('#removeItem').setDisabled(!records.length);
				}
			},
			title: '<b>Discount Item Detail info</b>',

		});
		/*var field = {
			xtype:'panel',
	        title:'<b>Discount Item Detail info</b>',	        
			margin: 10,
	        items:[
	        	grid
	        ]
		};*/
		return grid;
	},
	gridCourseItemDetail:function(){
		var grid =Ext.create('Ext.grid.Panel',{
			title:'Course Item',
			width: 750,
			height: 200,
			border:true,
			name:'discountItem',
			store:'acc.DiscountCourse',
			tbar:[
				{
					xtype:'button',
					text:'Add Item',
					action:'AddCourse',
					iconCls:'icon-add'
				},{
					xtype:'button',
					text:'Remove',
					action:'RemoveCourse',
					iconCls:'icon-delete'
				}
			],
			viewConfig: {
				getRowClass: function(record, id) {
					return record.get("_destroy") == true ? "hidden" : "row-error";
				}
			},
			columns:[
				{
					header:'No.',
					width:50 ,
					align:'center',
					xtype:'rownumberer',
				},{
					header:'Code',
					dataIndex:'code',
					flex:1
				},{
					header:'Abbr',
					dataIndex:'abbr',
					flex:1

				},{
					header:'Name',
					dataIndex:'name',
					flex:1

				},{
					header:'Course Type',
					dataIndex:'course_type',
					flex:1

				}
			]

		});
		return grid ;
	},
	buttons: [{
		xtype: 'button',
		text: '<b>Save<b>',
		iconCls: 'icon-save',
		action: 'Save',
	}, {
		text: '<b>Cancel<b>',
		iconCls: 'icon-cancel',
		action: 'Cancel'
	}]
});