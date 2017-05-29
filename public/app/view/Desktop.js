Ext.define('ExtDesktop.view.Desktop', {
    extend: 'Ext.ux.desktop.App',
    alias: 'widget.mydesktop',
    requires: [
        'Ext.window.MessageBox',
        'Ext.ux.desktop.ShortcutModel'
    ],
    init: function() {
        this.callParent();
    },
    onSettings: function() {
        Ext.widget('window',{
            title: 'Settings',
            width: 200,
            height: 200
        }).show();
    },

    getModules: function() {
        var store =ExtDesktop.app.getController('Login').getUserShortcutsStore();
        var modules= new Array();
        store.each(
            function(rec){
                  modules.push(rec.get('modules'));
            }
        );
        var modulesAux = [];
        Ext.each(modules, function(item) {
            modulesAux.push(Ext.create(item));

        }, this);
        return modulesAux;
    },

    getDesktopConfig: function() {
        var me = this, ret = me.callParent();
        return Ext.apply(ret, {
            /*contextMenuItems: [
                { text: 'Change Settings', handler: me.onSettings, scope: me }
            ],*/
            shortcuts:'UserShortcuts',
            wallpaper: 'resources/wallpapers/desk.jpg',
            wallpaperStretch: false
        });
    },

    getStartConfig: function() {
        var me = this, ret = me.callParent();
        return Ext.apply(ret, {
            title: 'EMS v1.0',
            iconCls: 'settings',
            height: 300,
            toolConfig: {
                width: 150,
                items: [{
                            action:"Logout",
                            formBind:true,
                            text:'Logout',
                            iconCls:'logout',
                            // handler: me.onLogout,
                            scope: me
                        },{
                            action:'ChangePwd',
                            formBind:true,
                            text:'Change Password',
                            iconCls:'icon-edit'
                        },{
                            action:'SwitchCampus',
                            formBind:true,
                            text:'Switch Campus',
                            iconCls:'icon-edit'
                        }
                ]
            }
        });
    },

    getTaskbarConfig: function() {
        var ret = this.callParent();
        return Ext.apply(ret, {
            quickStart: [
                          //  { name: 'Grid Window', iconCls: 'icon-grid', module: 'company-win' }
            ],
            trayItems: [
                            'Logged in as: ',
                            {
                                xtype:'label',
                                id:'username'
                            },
                            'Location: ',
                            {xtype:'label',name:'tb_location',id:'tb_location',
                            text:''},
                            {xtype: 'trayclock', flex: 1 }
            ]
        });
    },

    onLogout: function() {
    }

});
