Ext.define('ExtDesktop.view.module.reasonType.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridReasonType',
    title:'Reason Type',
    closable:true,
    autoScroll:true,
    store:'sdn.ReasonType',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                { 
                    xtype:'textfield', 
                    name:'search',
                    width:350 , 
                    emptyText:'Enter keyword to search...'
                },
                '->',
                {
                    text:'Add',
                    iconCls:'icon-add', 
                    action:'Add'
                },
                {
                    text:'Edit',
                    iconCls:'icon-edit', 
                    action:'Edit'
                },
                {
                    text:'Delete',
                    iconCls:'icon-delete', 
                    action:'Delete'
                }
            ],
            columns:[
                {header:'Id',xtype:'rownumberer', width:50,align:'center'},
                {header:'Code', dataIndex:'code',flex:1},
                {header:'Name', dataIndex:'type_name',flex:1},
                {
                    header:'Reason Type',  
                    dataIndex:'reason_for',
                    flex:1,
                    renderer:function(value){
                         return value == "D" ? "Drop":"Suspend";
                    }
                },

                {header:'Description',  dataIndex:'description',flex:1}
            ],
            bbar: Ext.create('Ext.PagingToolbar', {
                    store: 'sdn.ReasonType',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
            }) 
        });
        me.callParent(arguments);
    }
});