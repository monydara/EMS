Ext.define('ExtDesktop.view.module.class.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridClass',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'acd.ClassWU',
    title: 'W.U Class',
    closable: true,
    columnLines: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar: [

                {
                    xtype: 'container',
                    width: '100%',
                    items: [
                        {
                            xtype: 'panel',
                            // style: 'border-top:2px solid rgb(0, 100, 255);margin-top:10px; ',
                            bbar: [{
                                xtype: 'textfield',
                                name: 'search',
                                fieldLabel: 'Filter',
                                emptyText: 'Enter search keyword here...',
                                width: 450
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
            columns: [{
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
                text: 'Name',
                flex:1

            }, {
                dataIndex: 'session',
                text: 'Session',
                width: 120
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
                    text: 'Start Date'
            }, {
                dataIndex: 'status',
                text: 'Status',
                flex:1,
                renderer:function(value){
                    if (value == "S") {
                        return "Started";
                    }else if(value == "F"){
                        return "Finished"
                    }else if (value == "P") {
                        return "Pendding";
                    }else if (value == "C") {
                        return "Canceled";
                    };
                }
            }],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'acd.ClassWU',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    }
});