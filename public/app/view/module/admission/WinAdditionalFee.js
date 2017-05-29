Ext.define('ExtDesktop.view.module.admission.WinAdditionalFee', {
    extend: 'Ext.window.Window',
    alias: 'widget.winAdditionalFee',    
    title:'Additional Fee Form',
    modal:true,   
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:'form',
                    bodyPadding:30,
                    defaults:{
                        labelWidth: 120 , 
                        width: 400
                    }, 
                    items:[
                        {
                            xtype:'combo',
                            name:'item_charge_id',
                            fieldLabel:'Item Charge(<span style="color:red">*</span>)',
                            store:'combo.ChargeItem',
                            queryMode:'remote',
                            allowBlank:false,
                            editable:false,
                            valueField:'id',
                            displayField:'item_name'
                        },{
                            xtype:'numberfield',
                            name:'charge_amount',
                            readOnly:true,
                            fieldLabel:'Charge Amount'
                        },{
                            xtype:'checkbox',
                            fieldLabel:'Is Recurring',
                            name:'is_recurring'
                        },{
                            xtype:'textarea',
                            name:'note',
                            fieldLabel:'Memo', 
                            
                        }
                    ] 

                }

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
        
    ]

});