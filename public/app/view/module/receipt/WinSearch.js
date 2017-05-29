Ext.define('ExtDesktop.view.module.receipt.WinSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.winRecieptSearch',  
    title:'Advance Search',
    layout:'fit',
    items:[
        {
          xtype:'form',
          bodyPadding:20 , 
          defaults:{
            width: 350 ,
            labelAlign:'right'
          },         
          defaultType:'textfield',
          items:[
            {
              fieldLabel:'From Date',
              xtype:'datefield'
            },{
                xtype:'datefield',
                fieldLabel:'To Date'
            },{
              fieldLabel:'Receipt Type',
              xtype:'combo',
              name:'receipt_type',
              store:[ 'Admission', 'Service Charge']
            },{
              fieldLabel:'Item Charge',
              xtype:'combo',
              name:'acc_charge_item_type_id',
              valueField: 'acc_charge_item_type_id',
              displayfield: 'item_type_name',
              store:'acc.ChargeItemTypeS'
            },{
              xtype:'combo',
              store:['All', 'Paid', 'Unpaid'],
              fieldLabel:'Status',
              value:'All'
            }


          ]
        }


    ],
    buttons:[
      {
        text:'Search',
        iconCls:'icon-search',
        action:'Search'
      },{
        text:'Close',
        iconCls:'icon-cancel',
        action:'Cancel'

      }

    ]

});