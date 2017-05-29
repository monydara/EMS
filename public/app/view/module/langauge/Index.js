Ext.define('ExtDesktop.view.module.langauge.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridLangauge',
    store: 'Langauge',
    title:'Langauge List',
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
                            text: 'Langauge',
                            width:200,
                        },{                           
                            dataIndex: 'khr',
                            text: 'ភាសា',
                            flex: 1
                        }
            ],           
            
        });
        me.callParent(arguments);
    }

});