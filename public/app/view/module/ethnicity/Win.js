Ext.define('ExtDesktop.view.module.ethnicity.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinEthnicity',    
    title:'Form Ethnicity',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:350,labelWidth:150},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'name',
                    emptyText:'-- Ethnicity Name --',
                    fieldLabel:'Ethnicity'
                },{
                    xtype:'textfield',
                    name:'khr',
                    emptyText:'-- Khmer Name --',
                    fieldLabel:'ជាតិសាសន៍'
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