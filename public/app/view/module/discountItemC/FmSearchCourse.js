Ext.define('ExtDesktop.view.module.chargeItemC.FmSearchCourse', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinSearchCourse',
    modal:true,  
    title:'Course Item',
    width:700 , 
    heigt:300 ,
    layout:'fit',   
    items:[{
        xtype:"WinSearchAllCourse"
    }],
    buttons:[
      {
        text:'Ok',
        iconCls:'icon-ok',
        action:'Ok'
      },{
        text:'Cancel',
        iconCls:'icon-cancel',
        action:'Cancel'

      }

    ]

});