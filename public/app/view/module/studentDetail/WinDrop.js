Ext.define('ExtDesktop.view.module.studentDetail.WinDrop', {
    extend: 'Ext.window.Window',
    alias: 'widget.winDrop',
    title:'Drop Form',
    bodyPadding: 20 , 
    modal:true,
    defaults:{
        width:400
    },
    items:[
        {
            xtype:'combo',
            fieldLabel:'Drop Type',

        },{
            xtype:'textarea',
            fieldLabel:'Description'
        }

    ],
    buttons:[
        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            action:'Cancel',
            iconCls:'icon-cancel'
        }

    ]

});