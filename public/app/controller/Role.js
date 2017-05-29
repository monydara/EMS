Ext.define('ExtDesktop.controller.Role', {
    extend: 'Ext.app.Controller',
    stores: ['Roles','RoleUsers','RoleModules','Shortcut'],
    views: [
            	'module.role.Index',
                'module.role.WinRole',
                'search.WinSearchUsers'
    ],
    refs: [
	        {
	            ref : 'GridRole' , 
	            selector : 'GridRole'
	        },
	        {
	            ref : 'FrmRole' , 
	            selector : 'FrmRole'
	        },{
                ref: 'WinSearchUsers',
                selector: 'WinSearchUsers'
             }
    ],

    init: function(app) {
        this.control({
           'GridRole button[action=Create]':{
        	   click: this.showFormRole
           },
           'FrmRole button[action=Save]':{
        	   click: this.saveRole
           },
            'FrmRole button[action=SaveNew]': {
                click: this.saveAndNewUser
            },
           'FrmRole button[action=Cancel]':{
                click: Util.closeWindow
           },
            'GridRole button[action=Edit]': {
                click: this.editRole
            },
           'FrmRole button[action=addUser]': {
                click: this.showSearchUser
           },

           'WinSearchUsers grid':{
               itemdblclick: this.selectUserToRole
           },
           'WinSearchUsers textfield[name=search]': {
               change: this.searchLookup
            },
            'FrmRole button[action=addModule]': {
                click: this.addModuleToRole
            },
            'FrmRole button[action=removeUser]': {
                click: Util.removeGridItem
            },
            'FrmRole button[action=removeModule]': {
                click: Util.removeGridItem
            }

        });
        
    },
    gridRole:null,
    addModuleToRole:function(btn){
        // var record = records[0];
        var me=this;
        var combo = btn.up('grid').down('combo[name=comboModule]');
        var id = combo.getValue();
        var comboStore = combo.store;
        if (id > 0) {
            var record = comboStore.getById(id);
            var store = btn.up('grid').store;
            var is_exist = false ;

            store.each(function(rec){
                if (rec.get('shortcut_id') == record.get("id")) { is_exist = true ;};
            });

            if (is_exist) {
                Ext.Msg.alert("Warning", "The module is already exist.");
                return 0 ;
            };

            var model = Ext.create('ExtDesktop.model.RoleModule', {
                shortcut_id: record.get('id'),
                name: record.get('name')
            });

            store.add(model);
        };
    },
    searchLookup:function(field,value){
        var store=field.up('grid').store;
        Util.loadStore(store,{searchKeyword:value});

    },
    selectUserToRole:function(dv, record, item, index, e){
        var me = this ;
        var model = Ext.create('ExtDesktop.model.RoleUser');
        var store = me.getRoleUsersStore();
        var is_exist = false ;

        store.each(function(rec){
            if(record.get('id')==rec.get('user_id')){
                is_exist = true ;
                return false;
            }
        })

        if (is_exist) {
            Ext.Msg.alert("Warning", "Selected user already assigned to this role.");
        }else{
            model.set('user_id',record.get('id'));
            model.set('user_id_str',record.get('user_id'));
            model.set('name',record.get('user_name'));
            store.add(model);
            dv.up('window').close();
        };
    },

    showSearchUser:function(field,value){
        var win=Ext.create('ExtDesktop.view.search.WinSearchUsers');
        win.show();
        win.center();
    },

    showFormRole: function(btn){
        this.gridRole=btn.up('grid');
    	var me=this;
        var win=Ext.create('ExtDesktop.view.module.role.WinRole');
        var roleUsersStore=me.getRoleUsersStore();
        var roleModulesStore=me.getRoleModulesStore();
        roleModulesStore.removeAll();
        roleUsersStore.removeAll();

        win.show();
        win.center();
    },

    saveRole:function(btn){
        var win = btn.up('window'),
            form = win.down('form'),
            values = form.getValues(),
            record = form.getRecord(),
            me = this;
        var store=me.getRolesStore();

        if(form.isValid()){
            var storeRoleUsers = me.getRoleUsersStore();
            var storeRoleModules = me.getRoleModulesStore();
            values['sys_role_user_attributes'] = Util.getItemStore(storeRoleUsers);
            values['sys_role_shortcut_attributes'] = Util.getItemStore(storeRoleModules);
            if(record){
                record.set(values);
            }else{
                var model = Ext.create('ExtDesktop.model.Role');
                model.set(values);
                store.add(model);
            }
            store.sync(
                {
                    success: function(batch, options) {
                        if (win) {
                            win.close();
                        }
                        Ext.MessageBox.show({
                            title: 'Saved',
                            msg: 'Record Save Succeed.',
                            icon: Ext.MessageBox.INFO,
                            buttons: Ext.Msg.OK
                        });
                        me.gridRole.selModel.deselectAll();
                        store.load();
                    },
                    failure: function(batch, options) {
                        store.rejectChanges();
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
        }else{
            Util.msg('Please input required fields!');
        }
    },

    saveAndNewUser:function(btn){
        var win = btn.up('window'),
            form = win.down('form'),
            values = form.getValues(),
            record = form.getRecord(),
            me = this;
        var store=me.getRolesStore();

        if(form.isValid()){
            var storeRoleUsers = me.getRoleUsersStore();
            var storeRoleModules = me.getRoleModulesStore();
            values['sys_role_user_attributes'] = Util.getItemStore(storeRoleUsers);
            values['sys_role_shortcut_attributes'] = Util.getItemStore(storeRoleModules);
            if(record){
                record.set(values);
            }else{
                var model = Ext.create('ExtDesktop.model.Role');
                model.set(values);
                store.add(model);
            }
            store.sync(
                {
                    success: function(batch, options) {

                        Ext.MessageBox.show({
                            title: 'Saved',
                            msg: 'Record Save Succeed.',
                            icon: Ext.MessageBox.INFO,
                            buttons: Ext.Msg.OK
                        });

                        form.getForm().reset();
                        storeRoleUsers.removeAll();
                        storeRoleModules.removeAll();
                        me.gridRole.selModel.deselectAll();
                        store.load();
                    },
                    failure: function(batch, options) {
                        store.rejectChanges();
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
        }else{
                Util.msg('Please input required fields!');
        }
    },

    editRole: function(btn){

        this.gridRole=btn.up('grid');

        var record =Util.getRecord(btn,"Please select role first!");
        var win=Ext.create("ExtDesktop.view.module.role.WinRole");
        var form=win.down('form');
        var role_id= record.get("id");
        form.loadRecord(record);
        var storeRoleUsers = this.getRoleUsersStore();
        storeRoleUsers.load({params:{role_id: role_id}});
        var storeRoleModules = this.getRoleModulesStore();
        storeRoleModules.load({params:{role_id: role_id}});
        win.show();
        win.center();
    },

    close: function(button){
		 var win    = button.up('window');
		 win.close();
	},



});

