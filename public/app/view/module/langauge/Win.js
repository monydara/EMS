Ext.define('ExtDesktop.view.module.langauge.Win',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinLangauge',    
    title:'Form Langauge',
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
                    emptyText:'-- Langauge Name --',
                    fieldLabel:'Langauge'
                },{
                    xtype:'textfield',
                    name:'khr',
                    emptyText:'-- Khmer Name --',
                    fieldLabel:'ភាសា'
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