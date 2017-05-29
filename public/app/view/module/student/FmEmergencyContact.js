Ext.define('ExtDesktop.view.module.student.FmEmergencyContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmEmergency',
    title: 'Emergency',
    name: 'emergency',
    layout: {
                type: 'table',
                columns: 2
            },

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, 
                this.getEmergencyContact()
           );
        me.callParent(arguments);
    },

    getEmergencyContact: function() {
        var panel = {
            bodyPadding: 20,
            fieldDefaults: {
                width: 400,
                style: 'margin-left:10px',
                disabled: this.lock,
            },
            
            items: [{
                xtype: 'textfield',
                name: 'contact_name',
                fieldLabel: 'Name',
                allowBlank: true
            }, {
                layout: 'hbox',
                border: false,
                items: [{
                    xtype: 'radio',
                    fieldLabel: 'Gender',
                    inputValue: 'M',
                    boxLabel: 'Male',
                    name: 'gender',
                    checked: true
                }, {
                    xtype: 'radio',
                    boxLabel: 'Female',
                    inputValue: 'F',
                    style: 'margin-left: 10px',
                    name: 'gender'
                }]
            }, {
                xtype: 'textfield',
                maxLength: 30,
                fieldLabel: 'Phone',
                name: 'phone'
            }, {
                xtype: 'textfield',
                vtype: 'email',
                name: 'email',
                maxLength: 100,
                fieldLabel: 'Email'
            }, {
                xtype: 'textfield',
                name: 'address',
                fieldLabel: 'Address',
                maxLength: 250,
                height: 60,
                colspan: 2
            }]
        }
        return panel;
    }


});