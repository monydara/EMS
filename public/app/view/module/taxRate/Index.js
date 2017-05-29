Ext.define('ExtDesktop.view.module.taxRate.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridTaxRate',
    store: 'TaxRate',
    title:'Tax List',
    closable:true,  
    columnLines: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                    {
                        xtype:'textfield',
                        width:380 ,
                        name:'Search',
                        emptyText:'Enter keyword to search...'
                    }
                    ,'->',{
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
	                    iconCls:'icon-delete',

                       
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
                            width: 100,
                            align:'center'
                        },{                         
                        	dataIndex: 'description',
                        	text: 'Description',
                        	flex:1
                        },{
                        	dataIndex: 'name',
                        	text: 'Tax Type',
                        	width: 160
                        },{
                        	dataIndex: 'tax_rate',
                        	text: 'Rate',
                        	width: 120,
                            align:'left'
                        },{
                        	dataIndex: 'status',
                        	text: 'Status',
                        	width: 120
                        }],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			            store: 'TaxRate',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});