Ext.define('ExtDesktop.view.module.student.WinStudent', {
    extend: 'Ext.window.Window',
    alias: 'widget.winStudent',
    title: 'Student Maintenance',
    width: 1020,
    height: 600,
    modal: true,
    autoScroll: true,
    initComponent: function() {
         // Ext.MessageBox.hide();
        var me = this;
        var lock = this.lock;
        Ext.applyIf(me, {
                items:[
                    {
                        xtype:'form',
                        name:'mainForm',
                        tbar:[
                            {
                                text:'Save',
                                action:'Save',
                                disabled:this.lock
                                //iconCls:'icon-save'
                            },{
                                text:'Unlock',
                                action:'Unlock',
                                disabled:!this.lock
                                //iconCls:'icon-save'
                            },{
                                text:'More Action',
                                action:'More',
                                menu: [{
                                            id:'closeStudent',
                                            text:'Close'
                                        },{
                                            id:'reOpenStudent',
                                            text:'Reopen'
                                        },{
                                            id:'transferStudent',
                                            text:'Transfer'
                                }]
                            }
                        ],
                        items:[
                            Ext.create("ExtDesktop.view.module.student.FrmBasicInfo" , { lock:lock})
/*                            {
                                xtype:'FmBasic',
                                lock: lock
                            }*/,{
                                xtype:'tabpanel',
                                height:'100%',
                                items:[
                                    Ext.create("ExtDesktop.view.module.student.FrmPersonal", { lock : lock })
                                   /* {
                                        xtype:'FmPersonal',
                                        lock : lock
                                    }*/,{
                                        xtype:'FmAcademic'
                                    }, {
                                        xtype: 'panel',
                                        title: 'Accounting'
                                    }, {
                                        xtype: 'gridDocument',
                                        // title: 'Document'
                                    },
                                    Ext.create("ExtDesktop.view.module.admissionWU.FmAdditional",{ lock : lock})
                                    /* {
                                        xtype: 'FmAdditional',
                                        lock : lock ,
                                        title: 'Additional'
                                    }*/,{
                                        xtype:'panel',
                                        title: 'History'
                                    }
                                ]
                            }
                        ]
                    }
                ]
        });
        me.callParent(arguments);
    }

});
