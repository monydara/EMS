Ext.define('ExtDesktop.view.module.closeCashDrawer.Index',{
    extend: 'Ext.panel.Panel',
    alias: 'widget.GridCloseCashDrawers',
    collapsible: false,    
    title:'Close Drawer',
    closable:true,
    bodyPadding:10,
    initComponent: function() { 
        var me = this;
        Ext.applyIf(me, {
			items:[
						this.getGridDetail()
			     ]

        });
        me.callParent(arguments);
    },
    getGridDetail: function(){
    	var grid ={
						xtype:'grid',
						height:480,
						title:'Transaction Detail',
						border:true,
						style:'margin-left:10px',
						// store:'FinanceTran',
						tbar:[
							{
								xtype:'combo',
								fieldLabel:'Cash Drawer',
								emptyText:'-- Select Cash Drawer --'
							},{
								xtype:'button',
								text:'Close Drawer',
								style:'margin-left:5px'
							},'->',
							{xtype:'label',text:'Cash on Hand:',style:'font-weight:bold'},
							{xtype:'textfield',name:'amount_usd',fieldLabel:'Amount($)',width:280,readOnly:true},
							{xtype:'textfield',name:'amount_khr',fieldLabel:'Amount(R)',width:280,readOnly:true}
						],
						columns:[
						{
							xtype:'rownumberer',
							text:'No.',
							align:'center',
							width:50
						},{
							text:'Receipt No',
							align:'center',
							width:120
						},{
							text:'Receipt Date',
							dataIndex:'tran_date',
							align:'center',
							format:'d-M-Y',
							width:120
						},{
							text:'Description',
							dataIndex:'remark',
							flex:1
						},{
							text:'Committed Date',
							dataIndex:'commited_date',
							align:'center',
							format:'d-M-Y',
							width:120
						},{
							text:'Rollback Date',
							dataIndex:'rollback_date',
							align:'center',
							format:'d-M-Y',
							width:120
						},{
							text:'Amount($)',
							dataIndex:'amount_usd',
							align:'right',
							width:120
						}
					],

					viewConfig: {
						enableTextSelection: true
					},
					bbar: Ext.create('Ext.PagingToolbar', {
						//store: 'acc.InvoiceRule',
						displayInfo: true,
						displayMsg: 'View {0} - {1} of {2}',
						emptyMsg: "View 0"
					})
    			
    	};
    	
    	return grid;
    }

});

