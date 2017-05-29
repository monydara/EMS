/**
 * Created by IT on 2/24/2016.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.groupAccount.WinGroupAccount', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinGroupAccount',
    title: 'Group Account',
    modal: true,
    autoScroll: true,
    bodyPadding:10,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
                items:[
                    {
                        xtype:'form',
                        name:'FrmGroupAccount',
                        defaults:{width:360,  style:'margin-left:10px'},
                        defaultType:'textfield',
                        items:[
                            {
                                name:'group_code',
                                fieldLabel:'Group Code',
                                afterLabelTextTpl: required,
                                allowBlank: false,
                                emptyText:'Enter group account code',
                                maxLength:10
                            },{
                                name:'group_name',
                                fieldLabel:'Group Name',
                                afterLabelTextTpl: required,
                                allowBlank: false,
                                emptyText:'Enter group name',
                                maxLength:100
                            },{
                                xtype:'combo',
                                name:'group_type',
                                fieldLabel:'Group Type',
                                afterLabelTextTpl: required,
                                allowBlank: false,
                                store: Ext.create('Ext.data.Store', {
                                    fields: ['id', 'name'],
                                    data: [{id: 'TC', name: 'TC'}, {id: 'WU', name: 'WU'}]
                                }),
                                valueField: 'id',
                                displayField: 'name'
                            },{
                                xtype: 'combo',
                                name: 'account_type',
                                fieldLabel: 'Account Type',
                                afterLabelTextTpl: required,
                                allowBlank: false,
                                editable: false,
                                store: Ext.create('Ext.data.Store', {
                                    fields: ['id', 'name'],
                                    data: [{
                                        id: 'N',
                                        name: 'Normal'
                                    }, {
                                        id: 'I',
                                        name: 'Installment'
                                    }, {
                                        id: 'S',
                                        name: 'Scholarship'
                                    }]
                                }),
                                valueField: 'id',
                                displayField: 'name'
                            },{
                                xtype:'textarea',
                                name:'description',
                                fieldLabel:'Description',
                                width:480,
                                height:120
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