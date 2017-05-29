Ext.define('ExtDesktop.view.module.studentDetail.WinSuspend', {
    extend: 'Ext.window.Window',
    alias: 'widget.winSuspend',
    title:'Suspend Form',
    bodyPadding: 20 , 
    modal:true,
    defaults:{
        width:400
    },
    items:[
        {
            xtype:'combo',
            fieldLabel:'Suspend Type',

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