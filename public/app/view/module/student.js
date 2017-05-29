Ext.define('ExtDesktop.view.module.student', {
    id: 'student-win',
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'ExtDesktop.view.Main'
    ],

    init: function() {
        this.launcher = {
            text: 'Student',
            iconCls:'tabs'
        };
    },
    createWindow: function() {
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('student-win');
        if(!win){
            win = desktop.createWindow({
                id: 'student-win',
                title:'Student Management',
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
                    xtype:'mainlayout',
                    flex:1
                }]
            });
        }
        return win;
    }

});/**
 * Created by SOPHAT on 6/28/14.
 */
