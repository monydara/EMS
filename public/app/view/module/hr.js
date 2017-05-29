Ext.define('ExtDesktop.view.module.hr', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'ExtDesktop.view.hr.Main'
    ],
    id: 'hr-win',
    init: function() {
        this.launcher = {
            text: 'Human Resource',
            iconCls:'tabs'
        };
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('hr-win');
        if(!win){
            win = desktop.createWindow({
                id: 'hr-win',
                title:'Human Resource',
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
                            xtype:'main_hr',
                            flex:1
                }]
            });
        }
        return win;
    }

});
