Ext.define('ExtDesktop.view.module.standard.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridStandard',
    store: 'Standard',
    title:'Standard List',
    closable:true,    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[                
                  '->',{                  
	                    text:'Create',
	                    action:'Create',
	                    iconCls:'icon-add'
                  },{                 
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
            columns: [{
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{ 
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{                         
                            dataIndex: 'code',
                            text: 'Code',
                            width: 100
                        },{                         
                            dataIndex: 'name',
                            text: 'Name',
                            flex:1
                        },{                         
                            dataIndex: 'khr_name',
                            text: 'ឈ្មោះ',
                            flex:1
                        },{                                 	
                            dataIndex: 'sequence',
                            text: 'Sequence',
                            width: 100
                        }],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Standard',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});