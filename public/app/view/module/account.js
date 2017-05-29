Ext.define('ExtDesktop.view.module.account', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'ExtDesktop.view.account.Main'
    ],
    id: 'account-win',
    init: function() {
        this.launcher = {
            text: 'Accounting',
            iconCls:'tabs'
        };
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('account-win');
        if(!win){
            win = desktop.createWindow({
                id: 'account-win',
                title:'Accounting Management',
                width:800,
                height:400,
                resizable:true,
                closable:true,
                draggable:true,
                modal:false,
                closeAction:'hide',
                maximized:true,
                minimizable:true,
                maximizable:true,
                autoScroll:true,
                layout:{
                    type:'fit'
                },
                items:[{
                            xtype:'main_account',
                            flex:1
                }]
            });
        }
        return win;
    }

});/**
 * Created by SOPHAT on 6/28/14.
 */


