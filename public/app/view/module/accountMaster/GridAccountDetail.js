/**
 * Created by HENG SOPHAT on 2/7/2016.
 */
Ext.define('ExtDesktop.view.module.accountMaster.GridAccountDetail', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridAccountDetail',
    title:'Account Detail',
    stateId: 'stateGrid',
    collapsible: false,
    columnLines:true,
    border:true,
    autoHeight:true,
    store:'acc.AccountDetail',
    height:320,
    // margin:'10 0 0 0',
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                
                {
                    xtype:'button',
                    text:'Discount',
                    action:'AddDiscount',
                    iconCls:'icon-add',
                    
                },{
                    xtype:'button',
                    text:'Adhoc Charge',
                    action:'AdhocCharge',
                    iconCls:'icon-add',
                    
                },{
                    xtype:'button',
                    text:'Tax',
                    action:'AddTax',
                    iconCls:'icon-add',
                    
                },{
                    xtype:'button',
                    text:'Delete',
                    action:'Delete',
                    iconCls:'icon-delete',
                    width: 80
                }
            ],
           
            columns:[
                {
                    xtype :'rownumberer',
                    text  :'No.',
                    align :'center',
                    width :50
                },{
                    text :'Item Desc.',
                    dataIndex:'item_name',
                    width: 200
                },{
                    text:'Item Type',
                    dataIndex:'item_type',
                    width: 100,
                    align:'center', 
                    renderer:function(value){
                        if (value == "D") {
                            return "Discount"
                        }else if(value == "T"){
                            return "Tax"
                        }else{
                            return "Adhoc Charge"
                        }

                    }
                },{
                    text:'Unit (%,$)',
                    dataIndex:'item_unit',
                    width: 100,
                    align:'center',
                    renderer:function(value){
                        if(value == "A"){
                            return "$"
                        }else{
                            return "%"
                        }
                    }
                },{
                    text:'Value',
                    dataIndex:'item_value',
                    width:120,
                    align:'right'
                },{
                    text:'Is Recurring',
                    dataIndex:'is_recurring',
                    width:100,
                    align:'center'
                },{
                    text:'Recur. Value',
                    dataIndex:'recurring_val',
                    width:100,
                    align:'right'
                },{
                    text:'Effective Date',
                    dataIndex:'effective_date',
                    width:120,
                    align:'center'
                },{
                    text:'End Date',
                    dataIndex:'end_date',
                    width:120,
                    align:'center'
                },{
                    text:'Comments',
                    dataIndex:'comments',
                    flex:1
                }
            ],

            viewConfig: {
                enableTextSelection: true
            },
            

          
        });

        me.callParent(arguments);
    },

});

