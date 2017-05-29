Ext.define('ExtDesktop.view.module.position.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridPosition',
    store: 'Position',
    title:'Position List',
    closable:true,    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[                
                '->',{                   
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
                            dataIndex: 'position',
                            text: 'Position',
                            width:200,
                        },
                        {                            
                            dataIndex: 'description',
                            text: 'Description',
                            flex: 1
                        }
            ],           
            
        });
        me.callParent(arguments);
    }

});