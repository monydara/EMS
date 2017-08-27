Ext.define('ExtDesktop.view.module.student.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.studentGrid',
    stateId: 'stateGrid',
    collapsible: false,
    title:'Student List',
    closable:true,
    autoScroll:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            /*columns: [
                {
                    xtype: 'gridcolumn',
                    width: 133,
                    sortable: false,
                    dataIndex: 'company',
                    text: 'Company',
                    flex: 1
                },
                {
                    xtype: 'gridcolumn',
                    renderer: function(value, metaData, record, rowIndex, colIndex, store, view) {
                        return Ext.util.Format.usMoney(value);
                    },
                    width: 75,
                    dataIndex: 'price',
                    text: 'Price'
                },
                {
                    xtype: 'gridcolumn',
                    renderer: function(value, metaData, record, rowIndex, colIndex, store, view) {
                        if (value > 0) {
                            return '<span style="color:green;">' + value + '</span>';
                        } else if (value < 0) {
                            return '<span style="color:red;">' + value + '</span>';
                        }
                        return value;
                    },
                    width: 75,
                    dataIndex: 'change',
                    text: 'Change'
                },
                {
                    xtype: 'gridcolumn',
                    renderer: function(value, metaData, record, rowIndex, colIndex, store, view) {
                        if (value > 0) {
                            return '<span style="color:green;">' + value + '%</span>';
                        } else if (value < 0) {
                            return '<span style="color:red;">' + value + '%</span>';
                        }
                        return value;
                    },
                    width: 75,
                    dataIndex: 'pctChange',
                    text: '% Change'
                },
                {
                    xtype: 'datecolumn',
                    width: 85,
                    dataIndex: 'lastChange',
                    text: 'Last Updated',
                    format: 'm/d/Y'
                },
                {
                    xtype: 'actioncolumn',
                    width: 50,
                    menuDisabled: true,
                    items: [
                        {
                            handler: function(view, rowIndex, colIndex, item, e) {
                                this.fireEvent('itemclick', this, 'sell', view, rowIndex, colIndex, item, e);
                            },
                            icon: 'resources/images/delete.gif',
                            tooltip: 'Sell stock'
                        },
                        {
                            getClass: function(v, metadata, r, rowIndex, colIndex, store) {
                                if (r.get('change') < 0) {
                                    this.items[1].tooltip = 'Hold stock';
                                    return 'alert-col';
                                } else {
                                    this.items[1].tooltip = 'Buy stock';
                                    return 'buy-col';
                                }
                            },
                            handler: function(view, rowIndex, colIndex, item, e) {
                                var rec = view.getStore().getAt(rowIndex);
                                var action = rec.get('change') < 0 ? 'hold' : 'buy';
                                this.fireEvent('itemclick', this, action, view, rowIndex, colIndex, item, e);
                            }
                        }
                    ]
                }
            ],*/
            store:'sdn.Student',
            tbar: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'Filter',
                    name: 'filter',
                    emptyText: '-- Type For Search --',
                    labelWidth: 50,
                    width: 350,
                    labelAlign: 'right'
                }, {
                    text: 'Advance',
                    iconCls: 'icon-search',
                    action: 'AdvanceSearch'
                },'->',/*{
                    text: 'Add',
                    iconCls: 'icon-add',
                    action: 'Add'
                }*/
            ],
            columns:[
                {
                    header: 'No',
                    xtype: 'rownumberer',
                    width: 50,
                    align: 'center'
                },{
                    header: 'Student ID',
                    dataIndex:'student_no',
                    width: 100,
                    align: 'center'
                }, {
                    header: 'Name',
                    dataIndex: 'first_name',
                    renderer:function(value , raw, record){
                        var data = record.getData() ;
                        return value +" "+ data.last_name ;

                    },
                    flex: 1
                },{
                    header: 'Gender',
                    dataIndex:'gender',
                    width: 100,
                    align: 'center',
                    renderer: function(value, raw, record) {
                        var data = record.data;
                        var gender = data.gender == "F" ? "Female" : "Male";
                        return gender;
                    }
                }, {
                    header: 'DOB',
                    dataIndex: 'date_of_birth',
                    width: 100,
                    align: 'center',
                    format: 'd-M-Y'
                }, {
                    header: 'Phone',
                    dataIndex: 'phone_no',
                    width: 100
                }, {
                    header: 'Note',
                    dataIndex: 'note',
                    flex: 1
                }, {
                    header: 'City',
                    dataIndex: 'city_name',
                    width: 100
                },{
                    header: 'Status',
                    dataIndex:'status',
                    width: 100,
                    align: 'center',
                    renderer: function(value, raw, record) {
                        var status = value;
                        if (status == "N") {
                            status = "New";
                        } else if (status == "A") {
                            status = "Active";
                        }else if (status == "F") {
                            status = "Finished";
                        } else {
                            status = "Cancel"
                        };
                        return status;
                    }
                },{
                    xtype: 'actioncolumn',
                    width: 100,
                    header:'Action',
                    align:'center',
                    items:[
                        {
                            xtype:'button',
                            text:'View',
                            iconCls:'icon-view',
                            tooltip: 'Student Detail',
                            handler:function(grid , rowIndex){

                                var ctrl = ExtDesktop.app.getController("Student");
                                 // Ext.MessageBox.wait("Please wait system processing data.....","System Processing");
                                ctrl.showFormStudent(grid , rowIndex );
                            },
                        }
                    ]
                }
            ],
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'sdn.Student',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            }),
            viewConfig: {
                enableTextSelection: true
            }

        });

        me.callParent(arguments);
    }

});
