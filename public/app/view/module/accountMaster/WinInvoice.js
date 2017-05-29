/**
 * Created by HENG SOPHAT on 2/7/2016.
 */

Ext.define('ExtDesktop.view.module.accountMaster.WinInvoice', {
    extend: 'Ext.window.Window',
    alias: 'widget.accountMasterWinInvoice',
    title:'Invoice',
    modal:true,
    minimizable:false,
    resizable:false,
    bodyPadding:20,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:"fmInvoice"
                }
            ]

        });
        me.callParent(arguments);
    },

    buttons:[
        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
             text:'Cancel',
             iconCls:'icon-cancel',
             action:'Cancel',
             handler:function(){this.up("window").close()}
        }
    ]

});
