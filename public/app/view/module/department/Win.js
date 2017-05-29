Ext.define('ExtDesktop.view.module.department.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinDepartment',    
    title:'Form Department',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:350},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'department',
                    emptyText:'-- Position Name --',
                    fieldLabel:'Department Name'
                },{
                    xtype:'textarea',
                    name:'description',
                    emptyText:'-- Department Description --',
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