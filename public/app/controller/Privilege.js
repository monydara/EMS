Ext.define('ExtDesktop.controller.Privilege', {
    extend: 'Ext.app.Controller',
    stores: ['Roles','RoleModules','RoleModuleMenus','Menus' , 'Shortcut'],
    views:  [
            	'module.privilege.Index'
    ],
    refs: [
        {
            ref: 'GridRoleModules',
            selector: 'GridRoleModules'
        },{
            ref: 'GridRoleModuleMenus',
            selector: 'GridRoleModuleMenus'
    }],
    init: function(app) {
        this.getRoleModulesStore().removeAll();
        this.getRoleModuleMenusStore().removeAll();
        this.control({
            'RolePrivileges combo[name=comboRole] ':{
                select: this.showRoleModules
            },
            'RolePrivileges grid[name=GridRoleModules]':{
                itemclick: this.showMenusByRoleAndModule
            },
            'RolePrivileges button[action=addMenu]':{
                click: this.addMenu
            },
            'RolePrivileges button[action=removeMenu]': {
                click: Util.removeGridItem
            },
            'RolePrivileges button[action=saveMenu]': {
                click: this.saveMenu
            }
        });
    },

    v_role_id:null,
    v_shortcut_id:null,

    saveMenu:function(btn){
       var comboRole = btn.up('RolePrivileges').down('combo[name=comboRole]');
        var record = Util.getRecord(comboRole,"Please Select Role");
        var me = this ;
        if(record){
            var grid = btn.up("grid");
            var storeMenu = grid.getStore();
            var itemMenu = Util.getItemStore(storeMenu) ;

            var storeShortcut = me.getShortcutStore();
            var recordShortcut = storeShortcut.getById(record.get("shortcut_id"));
            recordShortcut.set("sys_shortcut_menu_attributes" ,itemMenu );

            storeShortcut.sync({
                success: function(batch, options) {
                    storeMenu.load();
                    grid.getView().refresh();
                },
                failure: function(batch, options) {
                    storeShortcut.rejectChanges();
                    var msg = batch.proxy.reader.rawData.message;
                    Ext.MessageBox.show({
                            title: 'Error',
                            msg: msg,
                            icon: Ext.MessageBox.ERROR,
                            buttons: Ext.Msg.OK
                    });
                },
                callback: function(batch, options) {},
                scope: this
            });
        }
    },
    showMenusByRoleAndModule:function(dv, record, item, index, e){
            var me=this,
            role_id = record.get('role_id'),
            shortcut_id=record.get('shortcut_id');

            var combo=dv.up('RolePrivileges').down('combo[name=comboMenu]');
            combo.setValue('');
            me.v_role_id=role_id;
            me.v_shortcut_id=shortcut_id;

            var store=me.getRoleModuleMenusStore();
            var storeMenu=this.getMenusStore();
            store.proxy.extraParams={role_id: role_id, shortcut_id:shortcut_id};
            store.load();
            storeMenu.proxy.extraParams={shortcut_id:shortcut_id};
            storeMenu.load();
    },
    showRoleModules:function(combo , rec){
        var record = rec[0];
        var store= this.getRoleModulesStore();
        store.proxy.extraParams={role_id: record.get('id')};
        store.load();
    },
    addMenu:function(btn){
        var me=this;
        var combo = btn.up('grid').down('combo[name=comboMenu]');
        var id = combo.getValue();
        var comboStore = combo.store;
        var checkB=btn.up('grid').down('checkbox[name=chkAllMenu]');
        var store = btn.up('grid').store;

        if (checkB.getValue()==true)
        {
                comboStore.each(function(recCombo){
                    var model = Ext.create('ExtDesktop.model.RoleModuleMenu');
                    var i=store.findBy(
                        function(rd, id){
                            if(rd.get('menu_id')===recCombo.get('id')){
                                return true; // a record with this data exists
                            }
                            return false; // there is no record in the store with this data
                        }
                    );
                    if (i==-1){
                        model.set('shortcut_id', me.v_shortcut_id);
                        model.set('role_id',me.v_role_id );
                        model.set('menu_id',recCombo.get('id'));
                        model.set('name', recCombo.get('name'));
                        store.add(model);
                    }
                });
        }else{
                   if (id > 0) {
                    var record = comboStore.getById(id);
                    var is_exist = false ;
                    store.each(function(rec){
                        if (rec.get('menu_id') == record.get("id")) { is_exist = true ;};
                    });
                    if (is_exist) {
                        Ext.Msg.alert("Warning", "The menu is already exist.");
                        return 0 ;
                    };
                    var model = Ext.create('ExtDesktop.model.RoleModule', {
                        shortcut_id: me.v_shortcut_id,
                        role_id: me.v_role_id,
                        menu_id: record.get('id'),
                        name: record.get('name')
                    });
                    store.add(model);
                };
        };
    }
});

