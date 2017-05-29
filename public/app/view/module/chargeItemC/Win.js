Ext.define('ExtDesktop.view.module.chargeItemC.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.winchargeItem',
    modal:true,  
    title:'Form: Charge Item',
    height:340,
    items:[
        {
          xtype:'Form',
          bodyPadding:20 ,
          defaults:{
                        width: 360 ,
                        labelAlign:'right',
                        labelWidth:120
          }, 
          layout:{
                type:'table',
                columns:2
          },
          defaultType:'textfield',
          items:[
            {
                  fieldLabel:'Item Code',
                  name:'item_code',
                  allowBlank: false
            },{
                  fieldLabel:'Item Name',
                  name:'item_name',
                  allowBlank: false
            },{
                  fieldLabel:'Item Type',
                  xtype:'combo',
                  name:'item_type_id',
                  store:'acc.ChargeItemTypeS',
                  autoSelect: true,
                  forceSelection: true,
                  allowBlank: false,
                  valueField: 'id',
                  displayField: 'item_type_name'

            }, {
                  xtype: 'numberfield',
                  fieldLabel: 'Charge Amount',
                  name: 'charge_amount',
                  allowBlank: false,
                  minValue: 0,
                  value: 0
              }, {
                  xtype: 'checkbox',
                  boxLabel: 'Editable',
                  name: 'is_editable',
                  width: 160,
                  style: 'margin-left:120px',
                  checkedValue: 1,
                  uncheckedValue: 0
              },{
                  xtype:'panel',
                  layout:'hbox',
                  items:[
                      {
                          xtype:'radiofield',
                          name:'status',
                          inputValue:'A',
                          labelWidth:90,
                          checked:true ,
                          fieldLabel:'Status',
                          labelAlign:'right',
                          labelWidth:120,
                          style:'margin-left:30px',
                          boxLabel:'<span style="color:blue"><b>Active</b></span>'
                      },{
                          xtype:'radiofield',
                          name:'status',
                          inputValue:'C',
                          style:'margin-left:30px',
                          boxLabel:'<span style="color:red"><b>Close</b></span>',
                      }
                  ]
            },{
                  xtype:'textarea',
                  name: 'note',
                  height:100 ,
                  width:730,
                  colspan:2,
                  fieldLabel:'Note'
            }
          ]
        }


    ],
    buttons:[
      {
        text:'Save',
        iconCls:'icon-save',
        action:'save'
      },{
        text:'Cancel',
        iconCls:'icon-cancel',
        action:'Cancel'

      }

    ]

});