Ext.define('ExtDesktop.view.module.DiscountType.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinDiscountType',    
    title:'Form Discount Type',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:350},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'code',
                    emptyText:'-- Discount Typ Code --',
                    fieldLabel:'Code'
                },{
                    xtype:'textarea',
                    name:'name',
                    emptyText:'-- Discount Type Name --',
                    fieldLabel:'Name'
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