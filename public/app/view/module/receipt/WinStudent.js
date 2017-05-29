Ext.define('ExtDesktop.view.module.receipt.WinStudent', {
    extend: 'Ext.window.Window',
    alias: 'widget.winStudentSearch',  
    title:'Student List',
    layout:'fit',
    modal:true,
    items:[
        {
          xtype:'GridStudent'
        }
    ],
    buttons:[
      {
        text:'Ok',
        iconCls:'icon-Ok',
        action:'Ok'
      },{
        text:'Cancel',
        iconCls:'icon-cancel',
        action:'Cancel'

      }

    ]

});