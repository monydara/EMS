/**
 * Created by HENG SOPHAT on 2/7/2016.
 */
Ext.define('ExtDesktop.view.module.accountMaster.GridInvoice', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridInvoice',
    title:'Invoice',
    stateId: 'stateGrid',
    collapsible: false,
    store:'acc.Invoice',
    columnLines:true,
    border:true,
    autoHeight:true,
    height:320,
    // margin:'10 0 0 0',
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                
                {
                    xtype:'button',
                    text:'Generate Invoice',
                    action:'GenerateInvoice',
                    iconCls:'icon-money',                    
                },{
                    xtype:'button',
                    text:'Print',
                    iconCls:'icon-print',
                    action:'Print'
                }
            ],
           
            columns:[
                {
                    xtype :'rownumberer',
                    text  :'No.',
                    align :'center',
                    width :50
                },{
                    text :'Invoice No.',
                    dataIndex:'invoice_no',
                    width: 200
                },{
                    text:'Due Date',
                    width:200 ,
                    dataIndex:"due_date"
                },{
                    text: "From Date",
                    width:200 ,                    
                    dataIndex:"from_date"
                },{
                    text:"To Date",
                    width:200 ,                    
                    dataIndex:"to_date"
                },{
                    text:"Total Amount",
                    width:200 ,                    
                    dataIndex: "total_amount"
                },{
                    text: "Status",
                    dataIndex:"is_paid",
                    renderer:function(value){
                        if (value) {
                            return "Paid"
                        }else{
                            return 'Unpaid'
                        }
                    }
                }
            ],
            viewConfig: {
                enableTextSelection: true
            },


          
        });

        me.callParent(arguments);
    }
});

