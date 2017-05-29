Ext.define('ExtDesktop.controller.Desktop', {
    extend: 'Ext.app.Controller',
    //views	:	['Login'],
    stores :['UserShortcuts'],
    refs	:	[
        {
            ref:'loginwindow',
            selector:'loginwindow'
        }
    ],
    init:function () {
        var me=this;
        this.control({
            'button[action=Logout]':{
                click:this.logout
            },
            'button[action=SwitchCampus]':{
                click:this.showSwitchCampusForm
            },
            'button[action=ChangePwd]':{
                click:this.showChangePasswordForm
            }

        });
    },
    onLaunch: function() {

    },
    showChangePasswordForm:function(btn){
        var win = Ext.create('ExtDesktop.view.ChangePassword');
        win.show();
        win.center();
    },

    showSwitchCampusForm:function(btn){
        alert('Switch Campus');
    },
    logout:function (btn) {
        var me=this;
        Ext.Msg.confirm('Logout', 'Are you sure you want to logout?',function(b){
            if(b==='yes'){
                var form = Ext.create("Ext.form.Panel");
                form.getForm().doAction('standardsubmit',{
                   url: '/home/logout',
                   standardSubmit: true,
                   method: 'POST'
                });
                // me.logoff(btn);
                // loginWin.show();
                // loginWin.center();
            }
        });
    },

    logoff:function(btn){
        var me=this;
        var store=me.getUserShortcutsStore();
        Ext.Ajax.request({
            method:'POST',
            url:'security/logout_user',
            success : function(response, action) {
                    store.load();
            }
        });
    },


});
