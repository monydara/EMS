Ext.define('ExtDesktop.view.module.studentDetail.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.studentDetailGrid',
    collapsible: false,
    store: 'sdn.StudentDetail',
    title: 'Student Detail List',
    closable: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar: [
                {
                            xtype: 'textfield',
                            fieldLabel: 'Filter',
                            name: 'filter',
                            emptyText: '-- Type For Search --',
                            labelWidth: 50,
                            width: 350,
                            labelAlign: 'right'
                        }, {
                            text: 'Advance',
                            action: 'AdvanceSearch'
                        }, '->', {
                            text: 'View',
                            iconCls: 'icon-view',
                            action: 'ViewStudent'
                        },


            ],
            columns: [{
                    header: 'No',
                    xtype: 'rownumberer',
                    width: 50,
                    align: 'center'
                }, {
                    header: 'Image',
                    dataIndex: 'image_url',
                    width: 150,
                    align: 'center',
                    renderer: function(value, raw, record) {
                        console.log(record.data);

                        return '<img width=140px height=140px src="' + value + '" />';
                    },
                }, {
                    header: 'Student Information',
                    dataIndex: 'efirstName',
                    width: 300,
                    renderer: function(value, raw, record) {
                        var data = record.data;
                        var gender = data.gender == "F" ? "Female" : "Male";
                        var status = data.status;
                        if (status == "N") {
                            status = "New";
                        } else if (status == "A") {
                            status = "Active";
                        } else {
                            status = "Cancel"
                        };
                        var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:70px;'>" +
                            "<div style='padding-bottom:5px'><b> Name   </div>" +
                            // "<div style='padding-bottom:5px'> St. Code </div>" +
                            "<div style='padding-bottom:5px'>Student </div>" +
                            "<div style='padding-bottom:5px'>Gender </div>" +
                            "<div style='padding-bottom:5px'>Email </div>" +
                            "<div style='padding-bottom:5px'>Phone </div>" +
                            "<div style='padding-bottom:5px'>Status</b></div>" +
                            "</div>";
                        var infoString = labelDiv + "<div style='display:inline-block; width:300px;'>" +
                            "<div style='padding-bottom:5px'>:" + data.first_name + " " + data.last_name + "</div>" +
                            // "<div style='padding-bottom:5px'>:" + data.student_code + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.student_no + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.gender + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.email + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.phone_no + "</div>" +
                            "<div style='padding-bottom:5px'>:" + status + "</div>" +

                            "</div></div>";
                        return infoString;
                    }
                }, {
                    header: 'Admission Infomation',
                    dataIndex: 'admissionBy',
                    width: 300,
                    renderer: function(value, raw) {
                        var data = raw.record.data;
                        var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:105px;'>" +
                            "<div style='padding-bottom:5px'><b> Degree   <br></div>" +
                            "<div style='padding-bottom:5px'>Course <br> </div>" +
                            "<div style='padding-bottom:5px'>Session  <br> </div>" +
                            "<div style='padding-bottom:5px'>Batch <br> </div>" +
                            "<div style='padding-bottom:5px'>Admission Date</b></div>" +
                            "<div style='padding-bottom:5px'>Admission No</b></div>" +
                            "<div style='padding-bottom:5px'>Reference No</b></div>" +
                            "</div>";

                            referenceNo = data.reference_no  ?  data.reference_no:"" ;
                            admissionNo = data.admission_no ? data.admission_no :"";
                        var infoString = labelDiv + "<div style='display:inline-block; width:200px;'>" +
                            "<div style='padding-bottom:5px'>:" + data.degree_name + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.course_name + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.class_shift_name + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.batch_name + "</div>" +
                            "<div style='padding-bottom:5px'>:" + data.admission_date + "</div>" +
                            "<div style='padding-bottom:5px'>:" + admissionNo + "</div>" +
                            "<div style='padding-bottom:5px'>:" + referenceNo + "</div>" +
                            "</div></div>";
                        return infoString;
                    }
                }, {
                    header: 'Attendance',
                    flex: 1,

                }, {
                    header: "Accounting",
                    flex: 1
                }


            ],
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'sdn.StudentDetail',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });

        me.callParent(arguments);
    },
    getSuspendAccount: function() {
        var win = Ext.create('Ext.window.Window', {
            title: 'Suspend Account',
            modal: true,
            layout: 'fit',
            closable: false,
            items: [{
                xtype: 'form',
                bodyPadding: 20,
                defaults: {
                    width: 350
                },
                items: [{
                        xtype: 'combo',
                        fieldLabel: 'Suspend Type',
                        emptyText: '-- Select Type --',
                    }, {
                        xtype: 'datefield',
                        fieldLabel: 'From',
                        value: new Date()
                    }, {
                        xtype: 'datefield',
                        fieldLabel: 'To',

                    }, {
                        xtype: 'textarea',
                        fieldLabel: 'Description'
                    }

                ]
            }],
            buttons: [{
                text: 'Save',
                iconCls: 'icon-save',
                action: 'Save'
            }, {
                text: 'Cancel',
                iconCls: 'icon-cancel',
                action: 'Cancel',
                handler: function() {
                    win.close();
                }
            }]
        });

        win.show();

    }

});
