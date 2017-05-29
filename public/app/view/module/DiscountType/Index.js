Ext.define('ExtDesktop.view.module.DiscountType.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridDiscountType',
    store: 'DiscountTypeS',
    title:'DiscountType List',
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
                            dataIndex: 'code',
                            text: 'Code',
                            width:200,
                        },
                        {                            
                            dataIndex: 'name',
                            text: 'Name',
                            flex: 1
                        }
            ],           
            
        });
        me.callParent(arguments);
    }

});