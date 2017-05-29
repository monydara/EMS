Ext.define('ExtDesktop.view.module.chargeItemC.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.GridChargeItem',  
    collapsible: false,
    title:'Charge Item List',
    closable:true,
    layout:'fit',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          xtype:'container',   
          items:[
                    this.getGridChargeItem()
          ]
        });
        me.callParent(arguments);
    },
    getGridChargeItem: function(){
    	var grid={
    			xtype:'grid',    			       		        		
        		store:'acc.ChargeItemS',     
                tbar:[
                    {
                        xtype:'textfield',
                        name:'search',
                        width:400,
                        emptyText:'Enter keyword to search..'
                    },
                    '->'
                    ,{
                        text:'Create',
                        iconCls:'icon-add',
                        action:'Create'
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
        		columns:[
                    {xtype:'rownumberer', header:'No.', width:50 ,align:'center' },
    		         {header:'Item Code', width:120,dataIndex:'item_code'},
                     {header:'Item Name',flex:1,dataIndex:'item_name'},
                     {header:'Item Type',flex:1,dataIndex:'item_type_name'},
                     {header:'Charge Amount',flex:1,dataIndex:'charge_amount'},
                     {header:'Note',flex:1,dataIndex:'note'},                     
    	         ],
    	         
    	         bbar: Ext.create('Ext.PagingToolbar', {
    		            store: 'acc.ChargeItemS',
    		            displayInfo: true,
    		            displayMsg: 'View {0} - {1} of {2}',
    		            emptyMsg: "View 0"
    	         
    		        })
    	};
    	
    	
    	return grid;
    },
   

});