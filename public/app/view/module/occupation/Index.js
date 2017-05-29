Ext.define('ExtDesktop.view.module.occupation.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridOccupation',
    store: 'Occupation',
    title:'Occupation List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                {
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add'
                },
                 {
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit'

                },{
                    text:'Delete',
                    action:'Delete',
                    iconCls:'icon-delete'
                }
            ],
            autoScroll:true,
            columns: [
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },
                        {
                            dataIndex: 'name',
                            text: 'Occupation',
                            width:200,
                        },{
                            dataIndex: 'khr',
                            text: 'មុខរបរ',
                            flex: 1
                        }

            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Occupation',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })

        });
        me.callParent(arguments);
    }

});
