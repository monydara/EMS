Ext.define('ExtDesktop.view.ChangePassword', {
    extend:'Ext.window.Window',
    alias:'widget.ChangePassword',
    cls:'form-login-dialog',
    iconCls:'form-login-icon-title',
    width:460,
    height:250,
    resizable:false,
    closable:true,
    draggable:false,
    //modal:true,
    layout:'border',
    title:'Change Password',
    initComponent:function () {
        Ext.apply(this, {
            items:[{
                    xtype:'form',
                    bodyPadding:20,
                    header:false,
                    region:'center',
                    border:false,
                    waitMsgTarget:true,
                    layout:{
                            type:'vbox',
                            align:'stretch'
                    },
                    defaults:{
                        labelWidth:160,
                        height:30
                    },
                    items:[{

                        xtype: 'textfield',
                        fieldLabel: 'Enter Old Password '+redStar,
                        name: 'OldPassword',
                        allowBlank: false,
                        inputType: 'password',
                        anchor: '100%',
                        validateOnBlur: false
                        //enableKeyEvents:true
                    },{
                        xtype:'textfield',
                        fieldLabel:'Enter New Password '+redStar,
                        name:'NewPassword',
                        allowBlank:false,
                        inputType:'password',
                        anchor:'100%',
                        validateOnBlur:false
                    },{
                        xtype:'textfield',
                        fieldLabel:'Confirm New Password'+redStar,
                        name:'ConfirmPassword',
                        allowBlank:false,
                        inputType:'password',
                        anchor:'100%',
                        validateOnBlur:false
                    }]
                }
            ],
            buttons:[{
                        action:"Change",
                        formBind:true,
                        text:'Save',
                        iconCls:'form-login-icon-login',
                        scale:'medium',
                        width:90
            },{
                        action:"Cancel",
                        text:'Cancel',
                        iconCls:'icon-delete',
                        scale:'medium',
                        width:90
            }]
        });
        this.callParent(arguments);
    },
    defaultFocus:'OldPassword'
});