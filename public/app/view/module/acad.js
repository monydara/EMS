
Ext.define('ExtDesktop.view.module.acad', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'ExtDesktop.view.academic.Main'
    ],
    id: 'acad-win',
    init: function() {
        this.launcher = {
            text: 'Academic',
            iconCls:'tabs'
        };
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('acad-win');
        if(!win){
            win = desktop.createWindow({
                id: 'acad-win',
                title:'Academic Managment',
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
                            xtype:'main_academic',
                            flex:1
                }]
            });
        }
        return win;
    }

});/**
 * Created by SOPHAT on 6/28/14.
 */
