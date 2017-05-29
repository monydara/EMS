Ext.define('ExtDesktop.view.module.admin', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'ExtDesktop.view.admin.Main'
    ],
    id: 'admin-win',
    init: function() {
        this.launcher = {
            text: 'Administrator',
            iconCls:'tabs'
        };
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('admin-win');
        if(!win){
            win = desktop.createWindow({
                id: 'admin-win',
                title:'System Administration',
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
                layout:{
                    type:'fit'
                },
                items:[{
                            xtype:'main_admin',
                            flex:1
                }]
            });
        }
        return win;
    }

});/**
 * Created by SOPHAT on 6/28/14.
 */
