Ext.define('ExtDesktop.view.module.occupation.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinOccupation',    
    title:'Form Occupation',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:350},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'name',
                    emptyText:'-- Occupation Name --',
                    fieldLabel:'Occupation'
                },{
                    xtype:'textfield',
                    name:'khr',
                    emptyText:'-- Khmer Name --',
                    fieldLabel:'មុខរបរ'
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