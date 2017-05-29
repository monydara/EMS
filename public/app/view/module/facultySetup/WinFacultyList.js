/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.facultySetup.WinFacultyList', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinFacultyList',
    title: 'Faculty List',
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
                    store:'acd.Faculty',
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
                            text: 'Faculty',
                            width: 200
                        },{
                            dataIndex: 'abbr',
                            text: 'Abbr',
                            width: 120
                        },{
                            text: 'Description',
                            flex:1,
                            dataIndex: 'description'
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store:"acd.Faculty",
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return g;
    }

});