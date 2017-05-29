Ext.define('ExtDesktop.controller.User', {
    extend: 'Ext.app.Controller',
    stores: [
                'User','UserLocations','UserRoles','Department','Position','Degree','UserDegrees','Roles','Campus'
    ],
    views: [
                'module.user.Index',
                'module.user.WinUser',
                'search.WinSearchDegrees',
                'search.WinSearchRoles',
                'search.WinSearchLocations'
    ],
    refs: [{
                ref : 'GridUser' ,
                selector : 'GridUser'
            },{
                ref: 'FrmUser',
                selector: 'FrmUser'
            },
            {
                ref: 'GridUserRoles',
                selector: 'GridUserRoles'
            },{
                ref: 'GridSearchDegree',
                selector: 'GridSearchDegree'
            }],
    init: function(app) {
        
        this.control({
            'GridUser button[action=Create]': {
                click: this.showFormUser
            },
            'GridUser button[action=Edit]': {
                click: this.editUser
            },
            'GridUser textfield[name=search]': {
                change: this.searchLookup
            },
            'FrmUser button[action=Cancel]': {
                click: Util.closeWindow
            },
            'FrmUser button[action=Save]': {
                click: this.saveUser
            },
            'FrmUser button[action=SaveNew]': {
                click: this.saveAndNewUser
            },
            'FrmUser button[action=addRole]': {
                click: this.showSearchRole
            },
            'FrmUser button[action=addLocation]': {
                click: this.showSearchLocation
            },
            'FrmUser button[action=setNewPassword]':{
                click: this.enableTextPasswordChange
            },
            'FrmUser button[action=addDegree]': {
                click: this.showSearchDegree
            },
            'FrmUser button[action=removeDegree]': {
                click: this.removeGridItem
            },
            'FrmUser button[action=removeRole]': {
                click: Util.removeGridItem
            },
            'FrmUser button[action=removeLocation]': {
                click: Util.removeGridItem
            },

        'WinSearchDegrees grid':{
            itemdblclick: this.selectDegreeToUser
        },
        'WinSearchLocations grid':{
            itemdblclick: this.selectLocationToUser
        },
        'WinSearchRoles grid':{
            itemdblclick: this.selectRoleToUser
        },
        'WinSearchRoles textfield[name=search]':{
            change: this.searchLookup
        }
       });
        
    },

    gridUser:null,
    enableTextPasswordChange:function(btn){
        var win= btn.up('window');
        win.down("textfield[name=password]").setDisabled(false);
        win.down("textfield[name=confirmPassword]").setDisabled(false);

     },
    selectRoleToUser:function(dv, record, item, index, e){
        var me = this ;
        var model = Ext.create('ExtDesktop.model.UserRoles');
        var store = me.getUserRolesStore();
        var is_exist = false ;

        store.each(function(rec){
            if(record.get('id')==rec.get('role_id')){
                is_exist = true ;
                return false;
            }
        })

        if (is_exist) {
            Ext.Msg.alert("Warning", "This role already assigned to user.");
        }else{
            model.set('role_id',record.get('id'));
            model.set('name',record.get('name'));
            store.add(model);
            dv.up('window').close();
        };
    },
    selectLocationToUser:function(dv, record, item, index, e){
        var me = this ;
        var model = Ext.create('ExtDesktop.model.UserLocation');
        var store = me.getUserLocationsStore();
        var is_exist = false ;
        store.each(function(rec){
            if(record.get('id')==rec.get('campus_id')){
                is_exist = true ;
                return false;
            }
        })
        if (is_exist) {
                Ext.Msg.alert("Warning", "This location already assigned to user.");
        }else{
                model.set('campus_id',record.get('id'));
                model.set('name',record.get('campus_name'));
                store.add(model);
                dv.up('window').close();
        };
    },
    selectDegreeToUser:function(dv, record, item, index, e){
        var me = this ;
        var model = Ext.create('ExtDesktop.model.UserDegree');
        var store = me.getUserDegreesStore();
        var is_exist = false ;
        store.each(function(rec){
            if(record.get('id')==rec.get('degree_id')){
                is_exist = true ;
                return false;
            }
        })
        if (is_exist) {
            Ext.Msg.alert("Warning", "This degree already assigned to user.");
        }else{
            model.set('degree_id',record.get('id'));
            model.set('name',record.get('name'));
            store.add(model);
            dv.up('window').close();
        };
    },
    showSearchDegree:function(field,value){
        var win=Ext.create('ExtDesktop.view.search.WinSearchDegrees');
        win.show();
        win.center();
    },
    showSearchRole:function(field,value){
        var win=Ext.create('ExtDesktop.view.search.WinSearchRoles');
        win.show();
        win.center();
    },
    showSearchLocation:function(field,value){
        var win=Ext.create('ExtDesktop.view.search.WinSearchLocations');

        win.show();
        win.center();
    },
    searchLookup:function(field,value){
    	var store=field.up('grid').store;
    	Util.loadStore(store,{searchKeyword:value});
    	
    },
    saveUser: function(btn){

        var win = btn.up('window'),
           form = win.down('form'),
           values = form.getValues(),
           record = form.getRecord(),
           me = this;

        var store=me.getUserStore();

        if(form.isValid()){

            var storeUserRoles = me.getUserRolesStore();
            var storeUserLocations = me.getUserLocationsStore();
            var storeUserDegrees =me.getUserDegreesStore();

            values['sys_role_user_attributes'] = Util.getItemStore(storeUserRoles);
            values['sys_user_location_attributes'] = Util.getItemStore(storeUserLocations);
            values['sys_user_degree_attributes'] = Util.getItemStore(storeUserDegrees);

            if(record){
                record.set(values);
            }else{
                var model = Ext.create('ExtDesktop.model.User');
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


                        me.gridUser.selModel.deselectAll();
                        me.getUserStore().load();

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
    saveAndNewUser: function(btn){

        var win = btn.up('window'),
            form = win.down('form'),
            values = form.getValues(),
            record = form.getRecord(),
            me = this;

        var store=me.getUserStore();

        if(form.isValid()){

            var storeUserRoles = me.getUserRolesStore();
            var storeUserLocations = me.getUserLocationsStore();
            var storeUserDegrees =me.getUserDegreesStore();

            values['sys_role_user_attributes'] = Util.getItemStore(storeUserRoles);
            values['sys_user_location_attributes'] = Util.getItemStore(storeUserLocations);
            values['sys_user_degree_attributes'] = Util.getItemStore(storeUserDegrees);

            if(record){
                record.set(values);
            }else{
                var model = Ext.create('ExtDesktop.model.User');
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

                        storeUserRoles.removeAll();
                        storeUserLocations.removeAll();
                        storeUserDegrees.removeAll();

                        me.gridUser.selModel.deselectAll();
                        me.getUserStore().load();
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
    showFormUser: function(btn){
        var me=this;
        this.gridUser=btn.up('grid');
    	var win=Ext.create('ExtDesktop.view.module.user.WinUser');

        var storeUserRoles = me.getUserRolesStore();
        var storeUserLocations = me.getUserLocationsStore();
        var storeUserDegrees =me.getUserDegreesStore();
        storeUserRoles.removeAll();
        storeUserLocations.removeAll();
        storeUserDegrees.removeAll();
        win.show();
        win.center();
    },
    editUser: function(btn){
        this.gridUser=btn.up('grid');

    	this.selectGrid(btn,'ExtDesktop.view.module.user.WinUser','Please select user from list!');   	
    },
    selectGrid:function(btn,fileName,message){		
        var grid =btn.up("gridpanel"); 
        var row =grid.getSelectionModel().getSelection();

        if(row.length){
                var win=Ext.create(fileName);
                var form=win.down('form');
                var record = row[0];
                var userId= record.get("id");
                        
                win.down('textfield[name=user_id]').setReadOnly(true);
                win.down("textfield[name=password]").setDisabled(true);
                win.down("textfield[name=confirmPassword]").setDisabled(true);
                win.down("button[action=setNewPassword]").setDisabled(false);

                form.loadRecord(record);
                //form.down('textfield[name=comfirmPassword]').setValue(record.get('password'));

                var storeRoles = this.getUserRolesStore();
                storeRoles.load({params:{userId: userId}});

                var storeLocations = this.getUserLocationsStore();
                storeLocations.load({params:{userId: userId}});

                var storeDegree = win.down('grid[name=UserDegrees]').store;
                storeDegree.load({params:{userId: userId}});

                win.show();
                win.center();
        }else{
                Util.msg(message);
        }
    }

    
});