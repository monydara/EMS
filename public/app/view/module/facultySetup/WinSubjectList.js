/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.facultySetup.WinSubjectList', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinSubjectList',
    title: 'Subject List',
    layout: 'fit',
    width: 550,
    height: 350,
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
                    store:'Subject',
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
                            text: 'Subject',
                            flex: 1
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store:"Subject",
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return g;
    }

});