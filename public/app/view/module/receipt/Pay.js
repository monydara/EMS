Ext.define('ExtDesktop.view.module.receipt.Pay', {
    extend: 'Ext.window.Window',
    alias: 'widget.winRecieptPay',
    modal:true,  
    title:'Paid Receipt',
    layout:'fit',
    items:[
        {
          xtype:'Form',
          bodyPadding:20 , 
          defaults:{
            width: 380 ,
              height:30,
            labelAlign:'right'
          }, 
         /* layout:{
            type:'table',
            columns:2
          },*/
          defaultType:'textfield',
          items:[
            {
                    fieldLabel:'Method',
                    xtype:'combo',
                    name:'acc_payment_method_id',
                    store:'acc.PaymentMethodS',
                    valueField:'id',
                    displayField:'name',
                    listeners:Util.firstSelect(),
                    allowBlank: false
            },{
                    fieldLabel:'Ref. No.:',
                    name:'ref_no'
              },{
                  xtype:'numberfield',
                  fieldLabel:'Amount(USD)',
                  name:'usd_amount',
                  minValue: 0 ,
                  value: 0 ,
                  readOnly:true
             },{
                  xtype:'numberfield',
                  name:'clear_amount',
                  fieldLabel:'Clear Amount',
                  minValue: 0 ,
                  value: 0 ,
                  allowBlank: false

             },{
                  xtype:'textarea',
                  name: 'tranRemark',
                  height:100 ,
                  fieldLabel:'Remark'
            }
          ]
        }


    ],
    buttons:[
      {
        text:'Paid',
        iconCls:'icon-payment',
        action:'Pay'
      },{
        text:'Cancel',
        iconCls:'icon-cancel',
        action:'Cancel'
      }

    ]

});