Ext.define('ExtDesktop.view.module.receipt.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.GridReceipt',
    collapsible: false,
    title: 'Receipt List',
    closable: true,
    layout: 'fit',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            xtype: 'container',
            items: [

                this.getGridReceipt()
            ]
        });
        me.callParent(arguments);
    },
    getGridReceipt: function() {
        var grid = {
            xtype: 'grid',
            // style:'margin-left:20px',
            store: 'acc.Receipt',
            tbar: [{
                    xtype: 'textfield',
                    emptyText: '-- Type For Search --',
                    width: 350
                }, {
                    text: 'Advance',
                    iconCls: 'icon-search',
                    action: 'AdvanceSearch'
                }, '->', {
                    text: 'Create',
                    iconCls: 'icon-add',
                    action: 'Create'
                }, {
                    text: 'Edit',
                    action: 'Edit',
                    iconCls: 'icon-edit'
                }

            ],
            columns: [{
                    xtype: 'rownumberer',
                    header: 'No.',
                    width: 50,
                    align: 'center'
                }, {
                    header: 'Receipt Date',
                    width: 120,
                    dataIndex: 'receipt_date',
                    type: 'date',
                    renderer: Ext.util.Format.dateRenderer('d-M-Y')
                }, {
                    header: 'Receipt No',
                    width: 120,
                    dataIndex: 'receipt_no'
                }, {
                    header: 'Payer',
                    flex: 1,
                    dataIndex: 'payer_name'
                },

                {
                    header: 'Ref. Number',
                    flex: 1,
                    dataIndex: 'reference_no'
                }, {
                    header: 'Charge Amount',
                    renderer: Ext.util.Format.usMoney,
                    flex: 1,
                    dataIndex: 'charges_amount'
                }, {
                    header: 'Discount Amount',
                    renderer: Ext.util.Format.usMoney,
                    flex: 1,
                    dataIndex: 'discount_amount'
                }, {
                    header: 'Paid Amount',
                    flex: 1,
                    renderer:function(grid , raw){
                        var record = raw.record;
                        return Ext.util.Format.usMoney(record.get("charges_amount") - record.get("discount_amount"));
                    }
                }, {
                    header: 'Status',
                    flex: 1,
                    dataIndex: 'is_paid',
                    renderer: function(value) {
                        if (value === true) {
                            return "Paid";
                        }
                        return "Unpaid";
                    }
                }, {
                    header: 'Paid',
                    width: 100,
                    align: 'center',
                    xtype: 'actioncolumn',
                    items: [{
                        iconCls: 'icon-paymentmethod',
                        tooltip: 'Paid Receipt',
                        handler: function(grid, rowIndex, colIndex) {
                             var store = grid.getStore(),
                                        rec = store.getAt(rowIndex);
                            ExtDesktop.app.getReceiptController().showFormPaid(store , rec )

                        },
                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                            var isDisabled = record.get('is_paid') == 1;
                            return isDisabled;
                        },
                    }]
                }, {
                    header: 'Delete',
                    width: 100,
                    align: 'center',
                    xtype: 'actioncolumn',
                    items: [{
                        iconCls: 'icon-delete',
                        tooltip: 'Delete Receipt',
                        handler: function(grid, rowIndex, colIndex) {
                            Ext.MessageBox.confirm('Confirm', 'Are you sure to delete receipt?', function(btn) {
                                if ('yes' == btn) {
                                    var rec = grid.getStore().getAt(rowIndex);
                                    grid.getStore().remove(rec);
                                    grid.getStore().sync()
                                        //remove from backend

                                }
                            });
                        },
                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                            var isDisabled = record.get('is_paid') == 1;
                            return isDisabled;
                        },

                    }, ]
                },

                // {header:'Receiver',flex:1,dataIndex:'receiver'},


            ],

            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'acc.Receipt',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"

            })
        };


        return grid;
    },


});
