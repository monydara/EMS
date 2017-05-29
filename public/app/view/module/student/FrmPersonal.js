Ext.define('ExtDesktop.view.module.student.FrmPersonal', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.FmPersonal',
    name: 'contact',
    autoScroll: true,
    title: 'Personal',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [this.personalForm(), this.personalTab()]
        });
        me.callParent(arguments);
    },
    personalForm: function() {
        var form = {
            xtype: 'form',
            name: 'others',

            itemId: 'fmPersonal',
            bodyPadding: 10,
            fieldDefaults: {
                msgTarget: 'side',
                width: 320,
                disabled: this.lock,
                //allowBlank: false,
                style: 'margin-left:5px'
            },
            layout: {
                type: 'table',
                columns: 3
            },
            items: [{
                xtype: 'combo',
                name: 'category_id',
                listeners: Util.firstSelect(),
                valueField: 'id',
                displayField: 'name',
                store: 'StudentCategory',
                fieldLabel: 'Category',
                allowBlank: true

            }, {
                xtype: 'combo',
                style: 'margin-left:10px',
                listeners: Util.firstSelect(),
                store: 'Occupation',
                name: 'occupation_id',
                valueField: 'id',
                displayField: 'name',
                fieldLabel: 'Occupation',
                allowBlank: true
            }, {
                xtype: 'combo',
                allowBlank: true,
                fieldLabel: 'Religion',
                emptyText: 'Select....',
                style: 'margin-left:10px',

                listeners: Util.firstSelect(),
                valueField: 'id',
                displayField: 'name',
                name: 'religion_id',
                store: 'lookup.CmbReligion'
            }, {
                xtype: 'combo',
                allowBlank: true,

                fieldLabel: 'Nationality',
                emptyText: 'Select....',
                valueField: 'id',
                listeners: Util.firstSelect(),
                displayField: 'name',
                name: 'national_id',
                store: 'Nationality'
            }, {
                xtype: 'combo',
                allowBlank: true,
                fieldLabel: 'Language',
                emptyText: 'Select....',
                style: 'margin-left:10px',
                valueField: 'id',
                listeners: Util.firstSelect(),
                displayField: 'name',
                name: 'langauge_id',
                store: 'Langauge'
            }, {
                xtype: 'combo',
                allowBlank: true,
                fieldLabel: 'Ethnicity',
                emptyText: 'Select....',
                style: 'margin-left:10px',

                valueField: 'id',
                listeners: Util.firstSelect(),
                displayField: 'name',
                name: 'ethnicity_id',
                store: 'Ethnicity'
            }]
        }
        return form;
    },

    personalTab: function() {
        var tab = {
            xtype: 'form',
            name: 'ContractForm',
            items: [{
                xtype: 'tabpanel',
                items: [this.personalContact(),
                    Ext.create("ExtDesktop.view.module.student.FmFamilyContact", {
                        lock: this.lock
                    }),
                    Ext.create("ExtDesktop.view.module.student.FmEmergencyContact", {
                        lock: this.lock
                    }),
                    /* {
                        xtype: 'FmFamily', 
                        lock : this.lock
                    },*/
                    /*{
                                       xtype: 'FmEmergency' , 
                                       lock: this.lock
                                   }*/
                    , this.noteTabPanel()
                ]
            }]
        };

        return tab;
    },

    noteTabPanel: function() {
        var panel = {
            xtype: 'panel',
            title: 'Note',
            bodyPadding: 10,
            items: [{
                xtype: 'textarea',
                fieldLabel: 'Note',
                flex: 1,
                name: 'note',
                labelAlign: 'top',
                width: '100%',
                height: 100
            }]
        };
        return panel;
    },
    personalContact: function() {
        var form = {
            xtype: 'form',
            name: 'personalContact',
            title: 'Contact',
            defaultType: 'textfield',
            fieldDefaults: {
                msgTarget: 'side',
                width: 320,
                readOnly: this.lock,
                allowBlank: false,
                style: 'margin-left:5px'
            },
            layout: {
                type: 'table',
                columns: 2
            },
            bodyPadding: 10,
            items: [{
                name: 'phone_no',
                allowBlank: false,
                fieldLabel: 'Phone No.'
            }, {
                name: 'address',
                xtype: 'textarea',
                fieldLabel: 'Address',
                width: 650,
                height: 80,
                rowspan: '3'
            }, {
                name: 'email',
                fieldLabel: 'E-mail'
                //vtype:'email'
            }, {
                name: 'from_city_id',
                xtype: 'combo',
                fieldLabel: 'From City',
                store: 'combo.CityState',
                queryMode: 'Remote',
                valueField: 'id',
                displayField: 'city_name'
            }]
        };

        return form;
    }
});