Ext.define('ExtDesktop.view.module.admission.WinDiscount', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinDisountForm',    
    title:'Discount Form',
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
                            name:'fee_charge_id',         
                            fieldLabel:'Discount Item(<span style="color:red">*</span>)',
                            store:'combo.DiscountItem',
                            valueField:'id',
                            displayField:'item_name',
                            editable:false, 
                            queryMode:'local',
                            allowBlank:false,
                        },{
                            xtype:'combo', 
                            fieldLabel:'Discount($,%)<span style="color:red">*</span>', 
                            allowBlank:false,
                            name:'discount_item_detail_id',
                            store:'combo.DiscountItemDetail',
                            valueField:'id',
                            displayField:'discount_item',    
                            queryMode:'local',
                            editable:false, 

                        },{
                            xtype:'numberfield',
                            fieldLabel:'Custom Discount',
                            name:'custom_discount',
                            minValue: 0 , 

                            // name:'discount_amount',
                            readOnly:true,
                        },{
                            type:'numberfield',
                            fieldLabel:'Discount Percentag',
                            name:'discount_p'
                        },{
                            xtype:'combo',
                            name:'deduct_type',
                            fieldLabel:'Deduct Type(<span style="color:red">*</span>)',
                            allowBlank:false,
                            editable:false, 
                            valueField:'id',
                            displayField:'name',
                            value:'F',
                            store : Ext.create('Ext.data.Store',{
                                fields:['id','name'],
                                data:[
                                    {id:'F', name: 'Discount Full Fee'}
                               
                                ]
                            }), 
                        },{
                            xtype:"textarea",
                            name:'note',
                            fieldLabel:'Memo'
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