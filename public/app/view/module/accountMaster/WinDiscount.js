/**
 * Created by HENG SOPHAT on 2/7/2016.
 */

Ext.define('ExtDesktop.view.module.accountMaster.WinDiscount', {
    extend: 'Ext.window.Window',
    alias: 'widget.accountMasterWinDiscount',
    title:'Discount Item',
    modal:true,
    minimizable:false,
    resizable:false,
    bodyPadding:20,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:'form',
                    name:'FrmItems',
                    fieldDefaults: {
                        msgTarget: 'side',
                        width: 350
                    },
                    items:[
                        {
                            xtype:'hiddenfield',
                            name:'item_type', 
                            value: "D"                          
                        },{
                            xtype:'hiddenfield',
                            name:'item_unit'
                        },{
                            xtype:'combo', 
                            name:'discount_item',         
                            fieldLabel:'Discount Item(<span style="color:red">*</span>)',
                            store:'combo.DiscountItem',
                            queryMode:'local' ,
                            valueField:'id',
                            displayField:'item_name',
                            editable:false, 
                            queryMode:'local',
                            allowBlank:false,
                        },{
                            xtype:'combo', 
                            fieldLabel:'Discount($,%)<span style="color:red">*</span>', 
                            allowBlank:false,
                            name:'item_id',
                            store:'combo.DiscountItemDetail',
                            valueField:'id',
                            displayField:'discount_item',    
                            queryMode:'local',
                            editable:false, 

                        },{
                            xtype:'textfield',
                            name:'item_unit_name',                                                       
                            fieldLabel:'Item Unit',
                            readOnly:true
                        },{
                            xtype:'numberfield',
                            name:'item_value',
                            fieldLabel:'Value'+redStar,                          
                            allowBlank: false,
                            fieldStyle: 'text-align: right;',
                            value:0
                        },{
                            xtype:'checkbox',
                            name:'is_recurring',
                            boxLabel:'Recurring'
                        },{
                            xtype:'numberfield',
                            name:'recurring_val',
                            fieldLabel:'Recurring Value',
                            value:0,
                            disabled:true,
                            fieldStyle: 'text-align: right;'
                        },{
                            xtype:'datefield',
                            name:'effective_date',
                            fieldLabel:'Effective Date'+redStar,                            
                            allowBlank: false,
                            format:'d-M-Y',
                            submitFormat:'Y-m-d',
                            altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
                            value:new Date()
                        },{
                            xtype:'datefield',
                            name:'end_date',
                            fieldLabel:'End Date',
                            submitFormat:'Y-m-d',
                            altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
                            format:'d-M-Y',
                            value:new Date()
                        },{
                            xtype:'textarea',
                            name:'comments',
                            fieldLabel: 'Comments'
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
             action:'Cancel',
             handler:function(){this.up("window").close()}
        }
    ]

});
