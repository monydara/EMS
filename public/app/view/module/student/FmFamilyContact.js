var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.student.FmFamilyContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmFamily',    
    title:'Family',

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
                this.getFamilyContact(this.lock)
            ]
        });
        me.callParent(arguments);
    },
    getFamilyContact: function(lock){
        
        var panel ={
            xtype:'panel',
            bodyPadding:10,
            autoScroll:true,
            layout:'hbox',
            items:[
                {
                    xtype:'form',
                    name:'father',
                    defaultType:'textfield',
                    defaults:{width:420},
                    fieldDefaults: {
                        msgTarget: 'side',
                        disabled: lock,

                        width: 350
                    },
                    items:[
                        {
                            xtype: 'component',
                            html: '<b>Father</b>',
                            cls:'x-form-check-group-label',
                            anchor: '100%'
                        },{

                            fieldLabel:'Name',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            name:'contact_name'
                        },{
                            fieldLabel:'Phone No',
                            name:'phone'
                        },{
                            fieldLabel:'Address',
                            name:'address',
                            height:50,
                            xtype:'textarea'
                        }
                    ]
                },{
                    xtype:'form',
                    name:'mother',
                    defaultType:'textfield',
                    defaults:{width:420},
                    fieldDefaults: {
                        msgTarget: 'side',
                        disabled: lock,

                        width: 350
                    },
                    margin:'0 0 0 10',
                    items:[
                        {
                            xtype: 'component',
                            html: '<b>Monther</b>',
                            cls:'x-form-check-group-label',
                            anchor: '100%'
                        },{
                            fieldLabel:'Name',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            name:'contact_name'
                        },{
                            fieldLabel:'Phone No',
                            name:'phone'
                        },{
                            fieldLabel:'Address',
                            name:'address',
                            height:50,
                            xtype:'textarea'
                        }
                    ]
                }

            ]
        }

        return panel;

    }

});