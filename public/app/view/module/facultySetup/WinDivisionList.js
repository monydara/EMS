/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.facultySetup.WinDivisionList', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinDivisionList',
    title: 'Division List',
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
                    store:'Division',
                    autoScroll:true,
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
                            text: 'id',
                            dataIndex: 'id',
                            hidden:true
                        },{
                            text: 'Code',
                            dataIndex: 'code',
                            width: 120
                        },{
                            dataIndex: 'name',
                            text: 'Division',
                            width: 200
                        },{
                            dataIndex:'khr_name',
                            text: 'Division (KHR)',
                            flex:1
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store:"Division",
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return g;
    }

});