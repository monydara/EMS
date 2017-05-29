/**
 * Created by IT on 2/25/2016.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.payment.WinPayment', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinPayment',
    title: 'Invoice Payment',
    modal: true,
    height: 480,
    width: 800,
    bodyPadding: 10,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items:[
                    this.form(),this.grid()
            ]
        });
        me.callParent(arguments);
    },
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
    ],

    form:function(){
      var form={
          xtype:'form',
          name:'FrmPayment',
          defaults:{width:360, style:'margin-left:10px'},
          defaultType:'textfield',
          layout:{
                  type:'table',
                  columns:2
          },
          items:[
              {
                  xtype: 'container',
                  colspan: 2,
                  layout: {type: 'table', columns: 3},
                  items: [
                    {
                        xtype:"hiddenfield",
                        name:"account_id"
                    },
                      {
                          xtype: 'textfield',
                          fieldLabel: 'Student No.'+redStar,
                          name: 'student_no',
                          width: 280,
                          readOnly: true
                      }, {
                          xtype: 'button',
                          text: '...',
                          margin: '0 5 0 5',
                          action: 'SelectStudent'
                      }, {
                          xtype: 'button',
                          text: 'P',
                          action: 'PopulateStudent'
                      }
                  ]
              },{
                      xtype:'textfield',
                      name:'admission_no',
                      fieldLabel: 'Admission No'+redStar,
                        readOnly: true
              },{
                    xtype:'combo',
                    fieldLabel:'Pay Method',
                    afterLabelTextTpl: required,
                    allowBlank:false,
                    name:'acc_payment_method_id',
                    valueField:'id',
                    displayField:'name',
                    store:'acc.PaymentMethodS',
                    queryMode:'local',
                    editable:false
              },{
                  xtype:'combo',
                  name:'currency_code',
                  fieldLabel:'Currency',
                  afterLabelTextTpl: required,
                  allowBlank:false,
                  valueField:'id',
                  displayField:'name',
                  // store:'combo.Currency',
                  queryMode:'local',
                  valueField:'ccy_code',
                  displayField:'ccy_name',
                  store:'acc.Currency',
                  editable:false

              }, {
                  name: 'paid_amount',
                  xtype: 'numberfield',
                  fieldLabel: 'Paid Amount',
                  minValue:0,
                  afterLabelTextTpl: required,
                  allowBlank: false
              },{
                  name:'exchange_rate',
                  fieldLabel:'Exchange Rate',
                  readOnly:true
              },{
                  name:'total_amount',
                  fieldLabel:'Total Amount',
                  readOnly:true
              },{
                  xtype:'textarea',
                  fieldLabel:'Remark',
                  name:'remark' ,
                  width:730,
                  height:40 ,
                  colspan:2
              }
          ],

      }  ;
        return form;
    },

    grid:function(){
        var grid={
                    xtype:'grid',
                    name:'InvoiceList',
                    title:'Invoice List',
                    store:'acc.Invoice',
                    margin:10,
                    border:true,
                    height:250,
                    columns:[
                        {
                            xtype:'rownumberer',
                            text:'No',
                            align:'center',
                            width:50
                        },{
                            text:'Invoice No',
                            dataIndex:'invoice_no',
                            align:'center',
                            width:120,

                        },{
                            text:'Issue Date',
                            dataIndex:'issue_date',
                            align:'center',
                            format:'d-M-Y',
                            width:120,
                        },{
                            text:'Due Date',
                            dataIndex:'due_date',
                            align:'center',
                            format:'d-M-Y',
                            width:120
                        },{
                            text:'Total Amount',
                            dataIndex:'total_amount',
                            align:'right'
                        },{
                            text:'Unpaid Amount',
                            dataIndex:'unpaid_amount',
                            align:'right',
                            flex:1
                        }
                    ]
            };

        return grid;
    }


});