Ext.define('ExtDesktop.view.module.nationality.Win', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinNationality',    
    title:'Form Nationality',
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
                    emptyText:'-- Nationality Name --',
                    fieldLabel:'Nationality'
                },{
                    xtype:'textfield',
                    name:'khr',
                    emptyText:'-- Khmer Name --',
                    fieldLabel:'សញ្ជាតិ'
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