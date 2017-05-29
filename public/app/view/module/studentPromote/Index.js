Ext.define('ExtDesktop.view.module.studentPromote.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.FmStudentPromote',
    collapsible: false,
    title: 'Promote(TC)',
    closable: true,
    bodyPadding: 10,
    layout: 'hbox',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                this.promoteMainPanel()
            ]
        });
        me.callParent(arguments)
    },

    promoteMainPanel: function() {
        var panel = {
            xtype: 'panel',
            layout: 'vbox',
            items: [{
                xtype: 'container',
                layout: 'hbox',
                margin: '0 0 10 0',
                items: [{
                    xtype: 'form',
                    width: 550,
                    defaultType: 'textfield',
                    name:'primary',
                    fieldDefaults: {
                        width: 400,
                        // labelWidth:140,
                        //labelAlign:'right',
                        readOnly: true
                    },
                    items: [{
                        xtype: 'component',
                        html: 'Promote From Class',
                        cls: 'x-form-check-group-label',
                        margin: '0 0 10 0',
                        width: 400
                    }, {
                        xtype: 'fieldcontainer',
                        layout: 'hbox',
                        items: [{
                            name: 'class_id',
                            xtype: 'hiddenfield',
                            hidden: true
                        }, {
                            xtype: 'textfield',
                            name: 'class_code',
                            fieldLabel: 'Class Code',
                            width: 330
                        }, {
                            xtype: 'button',
                            text: '...',
                            margin: '0 0 0 5',
                            action: 'SelectPromoteFromClass', 
                            formName:'primary'
                        }, {
                            xtype: 'button',
                            text: 'P',
                            margin: '0 0 0 5',
                            action: 'PopulatePromoteToClass', 
                            gridName:'primary'
                        }]
                    }, {
                        xtype: 'textfield',
                        name: 'class_name',
                        fieldLabel: 'Class Name'
                    }, {
                        name: 'course',
                        fieldLabel: "Course",
                    }, {
                        name: 'course_level',

                        fieldLabel: 'Course Level'
                    }, {
                        name: 'class_room',
                        fieldLabel: 'Room'
                    }, {
                        name: 'session',
                        fieldLabel: 'Shift'
                    }]

                }, {
                    xtype: 'form',
                    defaultType: 'textfield',
                    name:'secondary',
                    margin: '0 0 0 60',
                    fieldDefaults: {
                        width: 400,
                        readOnly: true
                    },
                    items: [{
                        xtype: 'component',
                        html: 'Promote To Class',
                        cls: 'x-form-check-group-label',
                        margin: '0 0 10 0',
                        width: 400
                    }, {
                        xtype: 'fieldcontainer',
                        layout: 'hbox',
                        items: [{
                            name: 'class_id',
                            xtype: 'hiddenfield',
                            hidden: true
                        }, {
                            xtype: 'textfield',
                            name: 'class_code',
                            fieldLabel: 'Class Code',
                            width: 330
                        }, {
                            xtype: 'button',
                            text: '...',
                            margin: '0 0 0 5',
                            action: 'SelectPromoteToClass',
                            formName:'secondary'
                        }, {
                            xtype: 'button',
                            text: 'P',
                            margin: '0 0 0 5',
                            action: 'PopulatePromoteToClass', 
                            gridName:"secondary"
                        }]
                    }, {
                        xtype: 'textfield',
                        name: 'class_name',
                        fieldLabel: 'Class Name'
                    }, {
                        name: 'course',
                        fieldLabel: "Course",
                    }, {
                        name: 'course_level',

                        fieldLabel: 'Course Level'
                    }, {
                        name: 'class_room',
                        fieldLabel: 'Room'
                    }, {
                        name: 'session',
                        fieldLabel: 'Shift'
                    }]
                }]
            }, {
                xtype: 'container',
                //margin:'0 0 0 '
                layout: 'hbox',
                items: [{
                    xtype: 'grid',
                    title: 'Student to Promote',
                    name: 'primary',
                  multiSelect: true,
                    width: 550,
                    height: 300,
                    border: true,
                    autoScroll: true,
                    store: Ext.create("ExtDesktop.store.sdn.StudentListEnrollment"),
                    columns: [

                        {
                            header: 'No',
                            width: 50,
                            xtype: 'rownumberer',
                            align: 'center'
                        }, {
                            header: 'Student No.',
                            dataIndex: 'student_no',
                            width: 120,
                            align: 'center'
                        }, {
                            header: 'Admission No.',
                            dataIndex: 'admission_no',
                            width: 120,
                            align: 'center'
                        }, {
                            header: 'Name',
                            dataIndex: 'student_name',
                            flex: 1
                        }, {
                            header: 'Status',
                            dataIndex: 'status',
                            width: 100,
                            align: 'center'
                        }

                    ]
                }, {
                    xtype: 'container',
                    margin: '130 0 0 0',
                    width: 60,
                    padding: 10,

                    items: [{
                        xtype: 'button',
                        action: 'Promote',
                        width: 40,
                        text: '>'
                    }, {
                        xtype: 'button',
                        margin: '10 0 0 0',
                        action: 'Depromote',
                        width: 40,
                        text: '<'
                    }]
                }, {
                    xtype: 'grid',
                    border: true,
                    title: 'Promoted Student',
                    name : 'secondary',
                    width: 550,
                    height: 300,
                    store: Ext.create("ExtDesktop.store.sdn.StudentListEnrollment"),
                      multiSelect: true,
                    autoScroll: true,
                    columns: [{
                        header: 'No',
                        width: 50,
                        xtype: 'rownumberer',
                        align: 'center'
                    }, {
                        header: 'Student No.',
                        dataIndex: 'student_no',
                        width: 120,
                        align: 'center'
                    }, {
                        header: 'Admission No.',
                        dataIndex: 'admission_no',
                        width: 120,
                        align: 'center'
                    }, {
                        header: 'Name',
                        dataIndex: 'name',
                        flex: 1
                    }, {
                        header: 'Status',
                        dataIndex: 'status',
                        width: 100,
                        align: 'center'
                    }]
                }]
            }]
        };

        return panel;
    }
});