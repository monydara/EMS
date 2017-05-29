/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.studentPromote.WinSelectPromoteClass', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinSelectPromoteClass',
    title: 'Select TC Class',
    layout: 'fit',
    width: 800,
    height: 450,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
                items:[
                    this.grid()
                ]
        });
        me.callParent(arguments);
    },
    grid:function(){
        var g={
                    xtype:'grid',
                    columnLines:true,
                    store:'acd.ClassTC',
                    tbar: [
                        {
                            xtype: 'textfield',
                            emptyText: '-- Type Here To Search --',
                            name: 'filter',
                            labelAlign: 'right',
                            width: 380
                        }
                    ],
                    columns:[
                        {
                            xtype: 'rownumberer',
                            text: 'No.',
                            align: 'center',
                            width: 50
                        },{
                            text: 'class_id',
                            dataIndex: 'id',
                            hidden:true
                        },{
                            text: 'Code',
                            dataIndex: 'class_code',
                            width: 120
                        },{
                            dataIndex: 'class_name',
                            text: 'Name',
                            flex:1
                        },{
                            dataIndex: 'shift_name',
                            text: 'Shift',
                            width: 120
                        },{
                            text: 'Room',
                            width: 120,
                            dataIndex: 'class_room'
                        }, {
                            dataIndex: 'status',
                            text: 'Status',
                            width: 120,
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
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store:"acd.ClassTC",
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return g;
    }

});