var loginWin;
Ext.define('ExtDesktop.controller.Login', {
    extend: 'Ext.app.Controller',
    views	: ['Login'],
    stores      : ['UserShortcuts'],
    refs	:[{
                    ref:'loginwindow',
                    selector:'loginwindow'
                }],

    init:function () {
        var me=this;
        me.index();
        Util.ajax("/Home/get_username_campus",{},me.setUserNameCampus, me)
        this.control({
            'button[action=login]':{
                click:this.login
            },
            '#loginwindow textfield':{
                specialkey:this.keyenter
            }, 
            'ChangePassword button[action=Change]':{
                click: this.processChangePasssword
            }
        });
    },
    processChangePasssword:function(btn){
        var me = this; 
        var win = btn.up("window");
        var form = win.down("form");
        var values = form.getValues();
        if(form.getForm().isValid()){

            if (values.NewPassword == values.ConfirmPassword) {

                Util.ajax("sys_users/change_password", values ,me.afterAjax , win  )        
            }else{
                Util.msg("Incorrect confirm password "); 
            }
        }

    },
    afterAjax:function(obj , win){
        win.close();
        Util.msg(obj.message)
    },

    setUserNameCampus:function(obj, me){
        setTimeout(function() {
            if (Ext.getCmp("username")) {
                Ext.getCmp("username").setText(obj.username)
                Ext.getCmp("tb_location").setText(obj.campus)

            }else{

                me.setUserNameCampus(obj)
            };
        }, 1000);
    },
    index:function () {
         Ext.create('ExtDesktop.view.Desktop');
         this.getUserShortcutsStore().load();
        // loginWin = Ext.create('ExtDesktop.view.Login');
        // loginWin.show();
        // loginWin.center();
    },

    login: function(btn){
        var me =this;
        var form = btn.up('window').down('form');
        var values = form.getValues();
        var store=me.getUserShortcutsStore();
        if(form.getForm().isValid()){
        	Ext.Ajax.request({
                    method:'POST',
                    url:'security/login',
                    params:{
                            userId:values.userId,
                            password:values.password
                    },
                    success : function(response, action)
                    {
                            objReturn = Ext.decode(response.responseText);

                            if(objReturn.success==true){
                                loginWin.hide();
                                store.load({
                                                callback: function(records, operation, success) {
                                                    if(success){
                                                        Ext.create('ExtDesktop.view.Desktop');
                                                        setTimeout(function(){
                                                            var u=Ext.getCmp('tb_user_name');
                                                            var l=Ext.getCmp('tb_location');
                                                            u.setText(values.userId);
                                                            l.setText(objReturn.branch);
                                                        },1000);

                                                    }
                                                },
                                                scope: this
                               });

                                var username = Ext.getCmp('lblUsername');
                            }else{
                                       Ext.MessageBox.show({
                                                        title : 'Login Fail',
                                                        msg: objReturn['message'],
                                                        icon : Ext.MessageBox.ERROR,
                                                        buttons : Ext.Msg.OK
                                                });
                            }
                    },
                    failure : function(response, action)
                    {
                            objReturn = Ext.decode(response.responseText);
                            Ext.MessageBox.show({
                                                    title : 'Login Fail',
                                                    msg : objReturn['message'],
                                                    icon : Ext.MessageBox.ERROR,
                                                    buttons : Ext.Msg.OK
                                            });
                    }
        	});
        };
    },

    keyenter:function (item, event) {
        if (event.getKey() == event.ENTER) {
            this.login();
        }
    }

});
