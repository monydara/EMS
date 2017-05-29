Ext.define('ExtDesktop.view.module.department.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridDepartment',
    store: 'Department',
    title:'Department List',
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
                            dataIndex: 'department',
                            text: 'Department',
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