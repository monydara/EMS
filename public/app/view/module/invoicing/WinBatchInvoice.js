var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.invoicing.WinBatchInvoice', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinBatchInvoice',
    title: 'Batch Process Maintenance',
    modal: true,
    height: 550,
    width: 800,
    bodyPadding: 10,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [this.formBatch(), this.grid()]
        });
        me.callParent(arguments);
    },

    formBatch: function() {
        var form = {
            xtype: 'form',

            defaults: {
                width: 360,
                allowBlank: true,
                style: 'margin-left:10px'
            },
            /*fieldDefaults: {
           labelWidth: 125
           },*/
            layout: {
                type: 'table',
                columns: 2
            },
            items: [{
                xtype: 'textfield',
                name: 'batch_proc_code',
                fieldLabel: 'Batch Code',
                allowBlank: false,
                afterLabelTextTpl: required,
                emptyText: 'Batch Processing Code',
                maxLength: 10
            }, {
                xtype: 'textfield',
                name: 'batch_proc_name',
                fieldLabel: 'Batch Name',
                afterLabelTextTpl: required,
                allowBlank: false,
                emptyText: 'Batch Processing Name',
                maxLength: 100
            },/* {
                xtype: 'datefield',
                name: 'from_date',
                fieldLabel: 'From Date',
                allowBlank: false,
                afterLabelTextTpl: required,
                value: new Date(),
                format: 'd-M-Y',
                submitFormat: 'Y-m-d',
                altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
            }, {
                xtype: 'datefield',
                name: 'to_date',
                fieldLabel: 'To Date',
                format: 'd-M-Y',
                submitFormat: 'Y-m-d',
                altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
            },*/ {
                xtype: 'combo',
                fieldLabel: 'Group Account',
                allowBlank: false,
                afterLabelTextTpl: required,
                name: 'group_account_id',
                store: 'combo.GroupAccount',
                valueField: 'id',
                displayField: 'group_name'
            }, /*{
                xtype: 'combo',
                fieldLabel: 'Status',
                allowBlank: false,
                name: 'status',
                listeners:Util.firstSelect(),
                store: Ext.create("Ext.data.Store", {
                    fields: ["id", "name"],
                    data: [{
                        id: "O",
                        name: "Open"
                    }, {
                        id: "C",
                        name: "Close"
                    }]
                }),
                valueField: 'id',
                displayField: 'name'
            }*/]
        };

        return form;
    },

    grid: function() {
        var grid = {

            xtype: 'grid',
            title: 'Group Members',
            store	: 'acc.GroupAccountAdmission',
            name: 'GridMembers',
            border: true,
            height: 360,
            stateId: 'stateGrid',
            collapsible: false,
            columnLines: true,
            autoScroll: true,
            columns: [{
                xtype: 'rownumberer',
                text: 'No.',
                align: 'center',
                width: 50
            }, {
                text: 'Admission No',
                dataIndex: 'admission_no',
                width: 120,
                align: 'center'
            }, {
                text: 'First Name',
                dataIndex: 'first_name',
                flex: 1
            },{
                text:'Last Name',
                dataIndex:'last_name'
            }, {
                text: 'Degree',
                dataIndex: 'degree_name',
                width: 160
            }, {
                text: 'Course',
                dataIndex: 'course_name',
                width: 160
            }],
            viewConfig: {
                getRowClass: function(record, id) {
                    return record.get("_destroy") == true ? "hidden" : "row-error";
                },
                enableTextSelection: true
            }
        };
        return grid;
    },
    buttons: [

        {
            text: '<b>Save</b>',
            action: 'Save',
            iconCls: 'icon-save'
        }, {
            text: '<b>Close</b>',
            action: 'close',
            iconCls: 'close'
        }
    ],

});