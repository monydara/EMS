Ext.define('ExtDesktop.view.module.receipt.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.winReciept',
    modal:true,  
    title:'Receipt Form',
    layout:'fit',
    width: 900 ,
    resizable:false,
    items:[
        {
            xtype:'form',
            bodyPadding:20 ,
            layout:{
                    type:'table',
                    columns:2
            },
            items:[
                  {
                    xtype:'panel',
                    layout:{
                      type:'table',
                      columns:2
                    },
                    colspan: 2,
                    style:'margin-top:-20px',
                    width:820,  
                    items:[
                      {
                        html:'<h1>Receipt Form</h1>',
                          width:320,
                          style:'margin-left:80px'

                      },{
                        xtype:'combo',
                        fieldLabel:'Reference', 
                        name:'ref_type',
                        labelAlign:'right',
                        store:Ext.create('Ext.data.Store',{
                          fields:['id', 'name'],
                          data:[
                            { id:'L'  , name :'Lead' },
                            { id:'S'  , name :'Student' },
                            { id:'O'  , name :'Others' }
                          ]
                        }),
                        value:'O',
                        valueField:'id',
                        displayField:'name',
                        style:'margin-left:20px',
                        editable:false,
                        labelWidth:80,
                         width:400
                      }
                    ]

                  },
                  
                  {
                      xtype: 'container',
                      defaults:{
                          labelAlign:'right',
                          labelWidth:80,
                          width:400,
                          style:'margin-left:10px',
                      },
                      defaultType:'textfield',
                      layout:{
                        type:'table',
                        columns:2
                      },
                      items:[
                          {
                              fieldLabel:'Ref. No',
                              name:'ref_no',
                             
                              readOnly:true
                          }, {
                              xtype: 'numberfield',
                              fieldLabel: 'Discount',
                              name: 'discount_amount',
                              minValue: 0,
                              value: 0,
                            
                              readOnly: true
                          },{
                              fieldLabel:'Payer<span style="color:red" > * </span>',
                              name:'payer_name',
                              maxLength: 100,
                              allowBlank: false

                          },{
                              xtype: 'numberfield',
                              fieldLabel: 'Charge',
                              name: 'charges_amount',
                              minValue: 0,                                 
                              value:0,
                              readOnly: true
                          },
                          {
                              fieldLabel: 'Receipt No.',
                              name: 'receipt_no',
                              readOnly: true
                          },{
                              xtype: 'numberfield',
                              fieldLabel: 'Paid Amount',                                  
                              name: 'paid_amount',
                              minValue: 0,
                              value:0,
                              readOnly: true
                          },{
                              xtype:'container',
                              layout:'hbox',
                              items:[
                                {
                                  xtype:'checkbox',
                                  name:'is_usd',
                                  fieldLabel:'Amount(USD)', 
                                  labelWidth:80,
                                  checked:true
                                },{
                                  xtype:'numberfield', 
                                  name:'usd_amount',
                                  minValue:0 , 
                                  value:0,
                                  allowBlank:false,
                                  width:300,
                                  readOnly:true
                                }
                              ]
                          },{
                              xtype:'container',
                              layout:'hbox',
                              items:[
                                {
                                  xtype:'checkbox',
                                  name:'is_khr',
                                  fieldLabel:'Amount(KHR)', 
                                  labelWidth:80,
                                  
                                },{
                                  xtype:'numberfield', 
                                  name:'khr_amount',
                                  minValue:0 , 
                                  value:0,
                                  width:300,
                                  readOnly:true
                                }
                              ]
                             
                          },
                          {
                              xtype: 'hidden',
                              name: 'ref_id'
                          },{
                              xtype:'textarea',
                              name: 'remark',
                              labelAlign:'right',
                              fieldLabel:'Remark',
                              colspan:2 , 
                              labelWidth:80 ,
                              width:830 ,
                              style:'margin-top:10px'
                          },


                      ]
                  },
                  {
                      xtype: 'container',
                      // padding:'0px 0px 0px 20px',
                      defaults:{
                              labelAlign:'right',
                              labelWidth:140,
                              width:350
                      },
                      defaultType:'textfield',
                      items: [
                              
                      ]
                  },
                  {
                    xtype:'fieldset',
                    title:'<b>Discounts & Charges</b>',
                    colspan:2,
                    items:[
                            {
                            xtype:'grid',
                            height:160,
                            autoScroll:true,
                            columnLines:true,
                            tbar: [
                                {
                                    text: 'Adhoc Charge',
                                    iconCls: 'icon-add',
                                    action:'AdhocCharge'
                                },{

                                    text: 'Add Discount',
                                    iconCls: 'icon-add',
                                    action:'AddDiscount'
                                },
                                {
                                    text: 'Remove Item',
                                    itemId: 'removeItem',
                                    action:'RemoveItem',
                                    iconCls: 'icon-delete',
                                    // disabled: true
                                }
                            ],
                            store:'acc.ReceiptDetail',
                            viewConfig: {
                                getRowClass: function(record, id) {
                                  return record.get("_destroy") == true ? "hidden" : "row-error";
                                }
                            },
                            columns:[
                                {text:'ID',hidden:true,dataIndex:'id'},
                                {xtype:'rownumberer',text  :'No.',align :'center',width :50},
                                {text:'Item Type',dataIndex:'item_type',width :120},
                                {text:'item_id',dataIndex:'item_id',hidden:true},
                                {text:'Item Name',dataIndex:'item_name',flex:1},
                                {text:'Item Unit',dataIndex:'item_unit',width:80,align:'center'},
                                {text:'Amount',dataIndex:'amount',width :120,align:'left'},
                                {text:'Description', dataIndex:'description',flex:1}
                            ]
                        }
                    ]
                }
          ]
        }
    ],
    buttons:[
              {
                text:'Save',
                iconCls:'icon-save',
                action:'Save'
              },{
                text:'Cancel',
                iconCls:'icon-cancel',
                action:'Cancel'
              }
    ]

});