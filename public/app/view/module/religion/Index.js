Ext.define('ExtDesktop.view.module.religion.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridReligion',    
    collapsible: false,
    store: 'Religion',
    title:'Religion List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                    '->',
                    {
                        xtype:'button',
                        text:'Create',
                        action:'Create',
                        iconCls:'icon-add'            
                    },
                        {
                        xtype:'button',
                        text:'Edit',
                        action:'Edit',
                        iconCls:'icon-edit'              
                    }
            ],
            columns: [
                     {
                        xtype:'rownumberer',
                        text:'No',
                        width:50
                     },{
                    	 dataIndex:'name',text:'Religion',width:200
                     },{
                    	 dataIndex:'khr',text:'សាសនា',flex:1
                     }  
            ],          
            bbar: Ext.create('Ext.PagingToolbar', {
                      store: 'Religion',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: 'View 0'
                    })
        });
        me.callParent(arguments);
    }
});