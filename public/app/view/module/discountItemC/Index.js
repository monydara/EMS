var ctldiscountItem;
Ext.define('ExtDesktop.view.module.discountItemC.Index', {
	extend: 'Ext.form.Panel',
	alias:'widget.griddiscountItem',
	title:'Discount Items',
	closable:true,
	collapsible: false,
	layout:'fit',
	//id:'leadForm',	
	initComponent:function () {
		var me = this;
        Ext.applyIf(me, {
          xtype:'container',   
          items:[                                
                    this.gridDiscountItem()
                ]
        });
        me.callParent(arguments);		
	},
	
	gridDiscountItem: function(){
		return {
			xtype:'grid',			
			store:'DiscountItemS',
			columnLines:true,			
			tbar:[
					'->',
					{text:'Create',iconCls:'icon-add',action:'Create'},
                    {text:'Edit',action:'Edit',iconCls:'icon-edit'}			      		     
			      ],
		  	columns:[
		           {header:'Nº',xtype:'rownumberer',width:50,align:'center'},
		           {header:'Code',dataIndex:'item_code',flex:1},
		           {header:'Item Name',dataIndex:'item_name',flex:1},
		           {header:'Discount Type',dataIndex:'name',flex:1},
		           {header:'Effective Date',dataIndex:'effective_date',flex:1 ,xtype:'datecolumn',format:'d-M-Y'},
		           {header:'Expired Date',dataIndex:'expired_date',flex:1,xtype:'datecolumn',format:'d-M-Y'},
		           {header:'Source From',dataIndex:'Autherizer',flex:1},
		           {header:'Reference No',dataIndex:'reference_no',flex:1}
		        ],
			bbar:Ext.create('Ext.PagingToolbar', {
				store:'DiscountItemS',
		        displayInfo: true,
		        displayMsg: 'view {0} - {1} of {2}',
		        emptyMsg: "View 0"
		    })
		}
	}
});