Ext.define('ExtDesktop.view.module.receipt.WinLead', {
    extend: 'Ext.window.Window',
    alias: 'widget.winLeadSearch',  
    title:'Lead List',
    layout:'fit',
    modal:true,
    items:[
        {
          xtype:'gridLead'
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