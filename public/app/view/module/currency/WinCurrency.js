/**
 * Created by IT on 2/26/2016.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.currency.WinCurrency', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinCurrency',
    title: 'Currency Maintenance',
    modal: true,
    autoScroll: true,
    bodyPadding: 10,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:'form',
                    name:'FrmCurrency',
                    defaults:{width:360,  style:'margin-left:10px'},
                    defaultType:'textfield',
                    items:[
                        {
                            name:'ccy_code',
                            fieldLabel:'Currency Code',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            emptyText:'Enter currency code',
                            maxLength:3
                        },{
                            name:'ccy_name',
                            fieldLabel:'Currency Name',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            emptyText:'Enter currency name',
                            maxLength:50
                        },{
                            xtype:'numberfield',
                            name:'ccy_rate',
                            fieldLabel:'Rate',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            value:0
                        }
                    ]
                }
            ]
        });
        me.callParent(arguments);
    },
    buttons:[
        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel',
            handler:function(){this.up("window").close()}
        }
    ]
});
