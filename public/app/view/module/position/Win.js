Ext.define('ExtDesktop.view.module.position.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinPosition',    
    title:'Form Position',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:350},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'position',
                    emptyText:'-- Position Name --',
                    fieldLabel:'Position Name'
                },{
                    xtype:'textarea',
                    name:'description',
                    emptyText:'-- Position Description --',
                    fieldLabel:'Description'
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