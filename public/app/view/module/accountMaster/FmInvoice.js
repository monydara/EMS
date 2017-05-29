/**
 * Created by HENG SOPHAT on 2/7/2016.
 */

Ext.define('ExtDesktop.view.module.accountMaster.FmInvoice', {
    extend: 'Ext.form.Panel',
    alias: 'widget.fmInvoice',
    autoScroll: true,
    bodyPadding: 20,
    layout:{
        type:'table',
        columns:2
    },
    defaultType:'textfield',
    defaults:{
        width:400 ,
        style:"margin-left:10px",
        allowBlank:false,
        labelWidth:120
    },
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                {
                    xtype:'hiddenfield',
                    name:'account_id'
                },
                {
                    fieldLabel:"Invoice No."+redStar, 
                    readOnly:true,
                    name:'invoice_no'
                },{
                    fieldLabel: "Invoice Type"+redStar,
                    readOnly:true,
                    name:"invoice_type"
                },{
                    fieldLabel: "From Date"+redStar,
                    name:"from_date",
                    xtype:'datefield',
                    submitFormat:'Y-m-d',
                    format:'d-M-Y',                
                },{
                    fieldLabel: "To Date"+redStar,
                    name:"to_date",
                    xtype:'datefield',
                    submitFormat:'Y-m-d',
                    format:'d-M-Y',                    
                },{
                    xtype:"numberfield",
                    fieldLabel:"Due Date(Days)"+redStar,
                    name:"due_date",
                    minValue:0 , 
                    colspan:2
                },{
                    xtype:"grid",
                    colspan:2,
                    title:"Item Detail",
                    width:800 , 
                    height: 200 , 
                    autoScroll:true,
                    border:true,
                    columns:[
                        {
                            xtype:'rownumberer',
                            text:"No",
                            align:'center',
                            width:50
                        },{
                            text:"Item Name",
                            width:200,
                            dataIndex:"item_name"
                        },{
                            text:"Item Type",
                            width:200,
                            dataIndex:"item_type"
                        },{
                            text: "Amount",
                            flex:1,
                            dataIndex:"amount",
                            renderer:Ext.util.Format.usMoney,
                        }

                    ]
                },{
                    xtype:"numberfield",
                    name:"total_amount",
                    colspan:2 , 
                    style:'margin-left:410px; margin-top:10px',
                    readOnly:true,
                    fieldLabel:"Total Amount"
                }

            ]

        });
        me.callParent(arguments);
    },


});