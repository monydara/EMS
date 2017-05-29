Ext.define('ExtDesktop.view.module.accountMaster.Index', {
    extend: 'Ext.panel.Panel',
    modal: true,
    closable: true,
    alias: 'widget.AccountMaster',
    title: 'Account Master',
    autoScroll: true,
    resizeable: false,
    maximized: true,
    bodyPadding: 10,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                me.formAccount(),
                me.gridAccountList()
            ]
        });
        me.callParent(arguments);
    },

    formAccount: function() {
        var form = {
            xtype: 'form',
            defaultType: 'textfield',
            fieldDefaults: {
                width: 350,
                readOnly: true,
                labelAlign: 'right'
            },
            margin: 10,
            layout: {
                type: 'table',
                columns: 2,
                tdAttrs: {
                    valign: 'top'
                }
            },
            items: [{
                name: 'class_id',
                hidden: true
            }, {
                xtype: 'hiddenfield',
                name: 'id'
            }, {
                xtype: 'fieldcontainer',
                layout: 'hbox',
                colspan: 2,
                items: [{
                    name: 'student_no',
                    fieldLabel: 'Student ID',
                    xtype: 'textfield',
                    width: 280
                }, {
                    xtype: 'button',
                    text: '...',
                    margin: '0 0 0 5',
                    action: 'SelectStudent'
                }, {
                    xtype: 'button',
                    text: 'P',
                    margin: '0 0 0 5',
                    action: 'Populate'

                }]
            }, {
                name: 'last_name',
                fieldLabel: 'Last Name'
            }, {
                name: 'first_name',
                fieldLabel: 'First Name'

            }, {
                name: 'gender',
                fieldLabel: 'Sex'
            }, {
                xtype: 'datefield',
                name: 'date_of_birth',
                fieldLabel: 'DOB'
            }]
        }

        return form;
    },

    gridAccountList: function() {

        var grid = {
            xtype: 'grid',
            autoScroll: true,
            store: 'acc.AccountMaster',
            title: 'Account List',
            name: 'GridAccountList',
            border: true,
            // height: "100%",
            columnLines: true,
            minHeight:350 ,
            maxHeight: 500 ,
            autoScroll:true,
            tools: [{
                xtype: 'button',
                text: 'Create',
                action: 'Add',
                width: 100,
                iconCls: 'icon-add'
            }, {
                xtype: 'button',
                text: 'Edit',
                width: 100,
                action: 'Edit',
                iconCls: 'icon-edit'

            }],

            columns: [{
                    xtype: 'rownumberer',
                    text: 'No.',
                    align: 'center',
                    width: 50
                }, {
                    dataIndex: 'student_id',
                    name: 'student_id',
                    hidden: true
                }, {
                    dataIndex: 'admission_id',
                    name: 'admission_id',
                    hidden: true
                }, {
                    text: 'Admission No.',
                    dataIndex: 'admission_no',
                    align: 'center',
                    width: 140
                }, {
                    text: 'Course',
                    dataIndex: 'course_name',
                    flex: 1,
                    width: 160
                }, {
                    text: 'Cycle Type',
                    width: 160,
                    dataIndex: 'cycle_name'
                }, {
                    text: 'Fee/Cycle',
                    format: '0.0',
                    width: 160,
                    renderer: Ext.util.Format.usMoney,
                    dataIndex: 'fee_per_cycle'
                }, {
                    text: 'Balance',
                    xtype: 'numbercolumn',
                    renderer: Ext.util.Format.usMoney,
                    format: '0.0',
                    width: 160,
                    dataIndex: 'balance'
                }, {
                    dataIndex: 'status',
                    text: 'Status',
                    align: 'center',
                    renderer: function(value) {
                        if (value == "A") {
                            return "Active";
                        } else if(value == "C") {
                            return "Close"
                        }else{
                            return "Suspend"
                        }
                    },
                    width: 120
                },
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'acc.AccountMaster',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
                })

        };

        return grid;
    }
});