/**
 * Created by hengsophat on 10/16/2015.
 */
var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';

Ext.define('ExtDesktop.view.module.student.WinAdmissionDetail', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinAdmissionDetail',
    title: 'Admission Detail',
    modal: true,

    width: 880,
    height: 550,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [this.formAdmissionDetail(), this.tabAdmissionDetail()]
        });
        this.buttons = [{
            text: 'Save',
            action: 'Save',
            disabled: this.isReadOnly,

        }, {
            text: 'Unlock',
            action: 'Unlock',
            disabled: !this.isReadOnly,
        }, {
            text: 'Close',
            action: 'Close',

        }];
        me.callParent(arguments);
    },



    tabAdmissionDetail: function() {
        var tab = {
            xtype: 'tabpanel',
            autoScroll: true,
            items: [
                this.formClassDetail(), {
                    title: 'Account',
                    xtype: 'panel',
                    minHeight: '100%'
                }, {
                    title: 'Document',
                    xtype: 'panel',
                    minHeight: '100%'

                }, {
                    title: 'Attendance',
                    xtype: 'panel',

                }, {
                    title: 'History',
                    xtype: 'panel'
                }

            ]
        };
        return tab;
    },

    formClassDetail: function() {
        var form = {
            xtype: 'form',
            itemId:'class',
            title: 'Class',
            bodyPadding: 10,
            defaultType: 'textfield',
            autoScroll: true,
            fieldDefaults: {
                // labelAlign: 'top',
                msgTarget: 'side',
                width: 350,
                style: 'margin-left:5px',
                editable: false
            },
            layout: {
                type: 'table',
                columns: 2,
                tdAttrs: {
                    align: 'top'
                }
            },
            items: [{
                fieldLabel: 'Class Code',
                name: 'class_code',
                readOnly: true
            }, {
                fieldLabel: 'Class Name',
                name: 'class_name',
                readOnly: true
            }, {
                fieldLabel: 'Program',
                name: 'program_type',
                readOnly: true
            }, {
                fieldLabel: 'Shift',
                xtype: 'textfield',
                name: 'session',

                readOnly: true
            }, {
                fieldLabel: 'Standard',
                xtype:'textfield',
                name:'standard',
                readOnly: true
            }, {
                fieldLabel: 'Division',
                xtype: 'textfield',
                name:'division_name' ,
                readOnly: true
            }, {
                fieldLabel: 'Room',
                name:'class_room',
                xtype:'textfield',
                readOnly: true
            }, {
                fieldLabel: 'Status',
                name: 'status',
                readOnly: true
            }, {
                xtype: 'textarea',
                fieldLabel: 'Description',
                colspan: 2,
                width: 705,
                name: 'description'
            }]
        };
        return form;
    },

    formAdmissionDetail: function() {
        var form = {
            xtype: 'form',
            defaultType: 'textfield',
            bodyPadding: 10,
            fieldDefaults: {
                // labelAlign: 'top',
                msgTarget: 'side',
                width: 350,
                style: 'margin-left:5px',
                labelWidth: 120
            },
            layout: {
                type: 'table',
                columns: 2,
                tdAttrs: {
                    align: 'top'
                }
            },
            items: [{
                fieldLabel: 'Admission No',
                name: 'admission_no',
                readOnly: true
            }, {
                fieldLabel: 'Ref. No',
                name: 'reference_no',
                readOnly: true
            }, {
                xtype: 'combo',
                name: 'admission_type',
                fieldLabel: 'Admission Type',
                valueField: 'id',
                displayField: 'name',
                afterLabelTextTpl: required,
                readOnly: this.isReadOnly,
                allowBlank: false,
                store: Ext.create('Ext.data.Store', {
                    fields: ['id', 'name'],
                    data: [{
                        id: 'N',
                        name: 'Normal'
                    }, {
                        id: 'T',
                        name: 'Transfer'
                    }, {
                        id: 'S',
                        name: 'Scholarship'
                    }]
                })
            }, {
                xtype: 'datefield',
                name: 'admission_date',
                fieldLabel: 'Admission Date',
                readOnly: this.isReadOnly,

            }, {
                xtype: 'combo',
                name: 'degree_id',
                store: 'combo.DegreeWU',
                queryMode: 'local',
                valueField: 'id',
                displayField: 'name',
                editable: false,
                fieldLabel: 'Degree',
                readOnly: true
            }, {
                xtype: 'combo',
                fieldLabel: 'Course',
                name: 'course_id',
                valueField: 'id',
                queryMode: 'local',
                store: 'combo.CourseWU',
                editable: false,
                displayField: 'name',
                readOnly: true
            }, {
                xtype: 'combo',
                fieldLabel: 'Batch',
                name: 'batch_id',
                readOnly: this.isReadOnly,
                store: 'combo.Batch',
                afterLabelTextTpl: required,
                valueField: 'id',
                displayField: 'name',
                queryMode: 'local',
                editable: false

            }, {
                xtype: 'combo',
                fieldLabel: 'Academic Year',
                store: 'combo.AcademicYear',
                readOnly: this.isReadOnly,
                name: 'start_acd_year_id',
                valueField: 'id',
                displayField: 'name',

            }, {
                xtype: 'combo',
                name: 'major_id',
                readOnly: this.isReadOnly,
                fieldLabel: 'Major',
                afterLabelTextTpl: required,
                store: 'combo.Major',
                queryMode: 'Remote',
                allowBlank: false,
                valueField: 'id',
                displayField: 'name'
            }, {
                fieldLabel: 'Status',
                name: 'status',
                readOnly: true
            }, {
                xtype: 'textarea',
                fieldLabel: 'Note',
                colspan: 2,
                width: 705,
                name: 'note'
            }]
        };

        return form;
    }

});
