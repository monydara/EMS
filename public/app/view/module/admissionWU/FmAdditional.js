Ext.define('ExtDesktop.view.module.admissionWU.FmAdditional', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmAdditional',
    name:'admissionWuFmAdditional' , 
    title: 'Additional',
    initComponent: function() {
        var me = this;
        var lock = false;
        if (this.lock == true) {
            lock = true
        };

        Ext.applyIf(me, {
            items: [
                this.getAdditionalForm(lock)
            ]
        });
        me.callParent(arguments);
    },

    getAdditionalForm: function(lock) {
        console.log(lock,"========= additional")
        var panel = {
            xtype: 'tabpanel',
            bodyPadding: 10,
            autoScroll: true,
            items: [{
                xtype: 'panel',
                border: true,
                title: 'Personal',
                height: 180,
                defaults: {
                    labelWidth: 130,
                    width: 400,
                    style: 'margin-left:10px', 
                    readOnly:lock
                },
                
                layout: {
                    type: 'table',
                    columns: 2
                },
                bodyPadding: 10,
                items: [{
                    xtype: 'container',
                    layout: 'hbox',
                    defaults: {
                        readOnly: lock
                    },
                    items: [{
                        fieldLabel: 'ភេទ',
                        labelWidth: 120,
                        checked: true,
                        xtype: 'radiofield',
                        name: 'gender',
                        boxLabel: 'ប្រុស',
                        inputValue: 'ប'
                    }, {
                        boxLabel: 'ស្រី',
                        xtype: 'radiofield',
                        name: 'gender',
                        inputValue: 'ស',
                        style: 'margin-left:10px'
                    }]
                }, {
                    xtype: 'textfield',
                    name: 'city',
                    maxLength: 100,
                    fieldLabel: 'ខេត្តកំណើត'
                }, {
                    xtype: 'textfield',
                    name: 'phone',
                    maxLength: 30,
                    fieldLabel: 'លេខទូរស័ព្ទ'
                }, {
                    xtype: 'textfield',
                    name: 'occupation',
                    maxLength: 100,
                    fieldLabel: 'មុខរបរសិស្ស'
                }, {
                    xtype: 'textfield',
                    name: 'father_name',
                    maxLength: 100,
                    fieldLabel: 'ឈ្មោះឪពុក'
                }, {
                    xtype: 'textfield',
                    name: 'mother_name',
                    maxLength: 100,
                    fieldLabel: 'ឈ្មោះម្តាយ'
                }, {
                    xtype: 'textarea',
                    name: 'place_of_birth',
                    maxLength: 250,
                    fieldLabel: 'ទីកកន្លែងកំណើត',
                    rowspan: 2
                }, {
                    xtype: 'textarea',
                    name: 'address',
                    maxLength: 250,
                    rowspan: 2,
                    fieldLabel: 'អាស័យដ្ឋានបច្ចុបន្ប'
                }]

            }, {
                xtype: 'panel',
                border: true,
                title: 'Education',
                height: 180,
                defaults: {
                    labelWidth: 150,
                    width: 400,
                    style: 'margin-left:10px', 
                    readOnly:lock
                },
                 // fieldDefaults:{
                 //        disabled:lock
                 //    },
                layout: {
                    type: 'table',
                    columns: 2
                },
                bodyPadding: 10,
                items: [{
                    xtype: 'textfield',
                    name: 'diploma_num',
                    maxLength: 5,
                    fieldLabel: 'លេខ​សបបអ​ទុតិយភូមិ'
                }, {
                    xtype: 'textfield',
                    name: 'institue',
                    maxLength: 100,
                    fieldLabel: 'វិទ្យាល័យ'
                }, {
                    xtype: 'textfield',
                    name: 'diploma_year',
                    maxLength: 100,
                    fieldLabel: 'ឆ្នាំសបបអទុតិយភូមិ'
                }, {
                    xtype: 'textfield',
                    name: 'institue_city',
                    maxLength: 100,
                    fieldLabel: 'មកពីខេត្ត'
                }, {
                    xtype: 'combo',
                    name: 'diploma_grade',
                    maxLength: 100,
                    fieldLabel: 'និទេស',
                    store: ['A', 'B', 'C', 'D', 'E']
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                     defaults:{
                        readOnly:lock
                    },
                    items: [{
                        boxLabel: 'ជាប់ទុតិយភូមិ',
                        style: 'margin-left:130px',
                        checked: true,
                        xtype: 'radiofield',
                        name: 'is_passed_diploma',
                        inputValue: true
                    }, {
                        boxLabel: 'ធ្លាក់ទុតិយភូមិ',
                        style: 'margin-left:10px',
                        xtype: 'radiofield',
                        name: 'is_passed_diploma',
                        inputValue: false
                    }]
                }, {
                    xtype: 'numberfield',
                    name: 'total_score',
                    fieldLabel: 'លំដាប់បន្ទុរួម',
                    value: 0
                }]
            }]
        }
        return panel;
    }


});