Ext.define('ExtDesktop.view.module.payment.Index', {
    extend: 'Ext.grid.Panel',
    closable: true,
    alias: 'widget.GridPayment',
    title: 'Payment',
    //layout:'border',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {        
            tbar:[
                {
                    text:'Paid',
                    action:'Paid',
                    iconCls:'icon-payment',
                    width:100,
                },{
                    text:'Print',
                    action:'Print',
                    width:100,
                    iconCls:'icon-printer'

                },'->',
                {xtype:'label',text:'Cash on Hand:',style:'font-weight:bold'},
                {xtype:'textfield',labelAlign:'right',name:'amount_usd',fieldLabel:'Amount($)',width:280,readOnly:true},
                {xtype:'textfield',labelAlign:'right',name:'amount_khr',fieldLabel:'Amount(R)',width:280,readOnly:true}
            ],
            store:"acc.FinanceTranS",
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    text:'Receipt No',
                    align:'center',
                    dataIndex:'receipt_no',
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
                store: 'acc.FinanceTranS',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
        ExtDesktop.app.getController("Payment").setTotalAmount(me);
    },


    formStudentInfo:function(){
      var form={
                  xtype:'form',
                  name:'StudentInfo',
                  title:'Student Information',
                  bodyPadding:5,
                  defaults:{width:300, readOnly:true, style:'margin-left:10px'},
                  layout:{
                      type:'table',
                      columns:3
                  },
                  items:[
                      {
                          xtype:'textfield',
                          name:'student_no',
                          fieldLabel:'Student No'
                      }, {
                          xtype: 'textfield',
                          name: 'name',
                          fieldLabel: 'Name'
                      },{
                          xtype:'textfield',
                          name:'gender',
                          fieldLabel:'Gender'
                      },{
                          xtype:'datefield',
                          name:'date_of_birth',
                          fieldLabel:'Date of Birth'
                      },{
                          xtype:'textfield',
                          name:'phone_no',
                          fieldLabel:'Phone No'
                      },{
                          xtype:'textfield',
                          name:'balance',
                          fieldLabel:'Balance'
                      }
                  ]
      }  ;

        return form;
    },
    gridStudentList:function(){
        var grid={
                        xtype:'grid',
                        name:'StudentList',
                        border:false,
                        height:'95%',
                        stateId: 'stateGrid',
                        columnLines :true ,
                        autoScroll:true,
                        tbar:[
                            {
                                xtype:'textfield',
                                name:'SearchKeyword',
                                emptyText:'Enter keyword hare'
                            },'->',{
                                text:'Advance',
                                action:'AdvanceSearch',
                                iconCls:'icon-search'
                            }
                        ],
                        columns:[

                            {xtype:'rownumberer', text:'No.',align:'center',width:50},
                            {text:'Student No',dataIndex:'student_no',width:120,align:'center'},
                            {text:'Name',dataIndex:'student_name',width:160}

                        ]

        };
        return grid;
    },
    gridInvoiceList:function(){
        var grid={
            xtype:'grid',
            name:'GridInvoice',
            title:'Invoices',
            height:'100%',
            autoHeight:true,
            autoScroll:true,
            tbar:[

                {
                    xtype: 'checkbox',
                    name: 'Paid',
                    fieldLabel: 'Filter',
                    boxLabel: 'Paid',
                    inputValue:'1',
                    checked:false
                },{
                    xtype:'checkbox',
                    name:'Unpaid',
                    boxLabel:'Unpaid',
                    inputValue:0,
                    checked:true
                },'->',
                {
                    text:'Paid',
                    action:'Paid',
                    iconCls:'icon-payment'
                },{
                    text:'Credit Note',
                    action:'CreditNote',
                    iconCls:'icon-cashcollection'
                },{
                    text:'Write off',
                    action:'WriteOff',
                    iconCls:'icon-approval'
                },{
                    text:'Print',
                    action:'Print',
                    iconCls:'icon-printer'
                }
            ],
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    dataIndex:'invoice_no',
                    text:'Invoice No',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'issue_date',
                    text:'Issue Date',
                    align:'center',
                    width: 120,
                    format:'d-M-Y'
                },{
                    dataIndex:'from_date',
                    text:'From Date',
                    align:'center',
                    width: 120,
                    format:'d-M-Y'
                },{
                    dataIndex:'to_date',
                    text:'To Date',
                    align:'center',
                    width: 120,
                    format:'d-M-Y'
                },{
                    dataIndex:'due_date',
                    text:'Due Date',
                    align:'center',
                    width: 120,
                    format:'d-M-Y'
                },{
                    dataIndex:'total_amount',
                    text:'Total Amount',
                    align:'right',
                    width: 120,
                },{
                    dataIndex:'unpaid_amount',
                    text:'Unpaid Amount',
                    align:'right',
                    width: 120,
                },{
                    dataIndex:'status',
                    text:'Status',
                    align:'center',
                }
            ]


        };
        return grid;
    },
    gridReceiptList:function(){
        var grid={
                    xtype:'grid',
                    name:'GridReceipt',
                    title:'Receipt',
                    height:'100%',
                    autoHeight:true,
                    autoScroll:true,
                    tbar:[
                            '->',
                            {
                                text: 'Print',
                                action: 'Print',
                                iconCls: 'icon-printer'
                            },{
                                text: 'Rollback',
                                action: 'Rollback',
                                iconCls: 'icon-refund'
                            }
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
                            width:120,
                            renderer:Ext.util.Format.usMoney
                        }
                    ]
        };

        return grid;
    },

    gridAccountInfo:function(){
        var grid={
            xtype:'grid',
            xtype:'grid',
            name:'GridAccountInfo',
            title:'Accounts',
            height:'100%',
            autoHeight:true,
            autoScroll:true,
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    text:'Admission No',
                    dataIndex:'admission_no',
                    align:'center',
                    width:120

                },{
                    text:'Degree',
                    dataIndex:'degree_name',
                    flex:1
                }, {
                    text: 'Course',
                    dataIndex: 'course_name',
                    flex: 1
                }, {
                    text: 'Group Account',
                    dataIndex: 'group_account',
                    width: 120
                }, {
                    text: 'Cycle Type',
                    dataIndex: 'cycle_type',
                    width: 120,
                    align: 'center',
                },{
                    text:'Balance',
                    dataIndex:'balance',
                    width:120,
                    align: 'center',
                    renderer:Ext.util.Format.usMoney
                },{
                    text:'Status',
                    dataIndex:'status',
                    width:120,
                    align:'center'
                }
            ]
        }   ;
        return grid;
    },

    gridHistory:function(){
        var grid={
                    xtype:'grid',
                    name:'GridHistory',
                    title:'History',
                    minHeight:360,
                    autoHeight:true,
                    autoScroll:true,
                    columns:[
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{
                            text:'Tran. Date',
                            dataIndex:'tran_date',
                            align:'center',
                            format:'d-M-Y',
                            width:120
                        },{
                            text:'Ref. No',
                            dataIndex:'receipt_no',
                            align:'center',
                            width:120
                        }, {
                            text: 'Tran. Type',
                            dataIndex: 'tran_type',
                            width: 200
                        }, {
                            text: 'Tran. By',
                            dataIndex: 'tran_type',
                            width: 200
                        },{
                            text:'Amount($)',
                            dataIndex:'amount_usd',
                            width:120,
                            align:'right',
                        },{
                            text:'Remark',
                            dataIndex:'remark',
                            flex:1
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        // store: 'acd.Faculty',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })

        };

        return grid;
    }

});