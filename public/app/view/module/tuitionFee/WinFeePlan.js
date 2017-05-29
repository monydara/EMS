Ext.define('ExtDesktop.view.module.tuitionFee.WinFeePlan', {
    extend: 'Ext.window.Window',
    alias: 'widget.winFeePlan',
    title: 'Fee Plan Form',
    modal: true,
    items: [{
            xtype: 'form',
            defaults: {
                width: 400
            },
            modal: true,
            bodyPadding: 20,
            items: [{
                xtype: 'textfield',
                name: 'plan_code',
                allowBlank: false,
                fieldLabel: 'Code'
            }, {
                xtype: 'hiddenfield',
                name: 'acc_plan_master_id',
                allowBlank: false,
                fieldLabel: 'Plan master'
            }, {
                xtype: 'textfield',
                name: 'plan_name',
                allowBlank: false,
                fieldLabel: 'Plan Name'
            }, {
                xtype: 'combo',
                name: 'acd_degree_id',
                store: 'combo.DegreeWU',
                valueField: 'id',
                editable: false,
                displayField: 'name',
                listeners: Util.firstSelect(),
                allowBlank: false,
                fieldLabel: 'Degree'
            }, {
                xtype: 'combo',
                name: 'acd_course_facultie_id',
                store: 'combo.CourseWU',
                queryMode: 'local',
                valueField: 'id',
                displayField: 'name',
                //listeners:Util.firstSelect(),
                allowBlank: false,
                fieldLabel: 'Course'
            }, {
                xtype: 'numberfield',
                name: 'full_fee',
                allowBlank: false,
                decimalPrecision: 4,
                value: 0,
                fieldLabel: 'Full Fee'
            }, {
                xtype: 'numberfield',
                name: 'monthly_fee',
                allowBlank: false,
                decimalPrecision: 4,
                value: 0,
                fieldLabel: 'Monthly Fee'
            }, {
                xtype: 'numberfield',
                name: 'quarterly_fee',
                allowBlank: false,
                decimalPrecision: 4,
                value: 0,
                fieldLabel: 'Qauter Fee'
            }, {
                xtype: 'numberfield',
                name: 'semesterly_fee',
                allowBlank: false,
                decimalPrecision: 4,
                value: 0,
                fieldLabel: 'Semester Fee'
            }, {
                xtype: 'numberfield',
                name: 'yearly_fee',
                allowBlank: false,
                decimalPrecision: 4,
                value: 0,
                fieldLabel: 'Year Fee'
            }, {
                xtype: 'radiogroup',
                vertical: true,
                columns: 1,
                margin: '0px 0px 0px 20px',
                bind: {
                    radioValue: 'is_active'
                },
                //width: 300,
                items: [

                    {
                        xtype: 'component',
                        html: 'Status',
                        cls: 'x-form-check-group-label'
                    }, {
                        boxLabel: 'Active',
                        padding: '0px 0px 0px 20px',
                        name: 'is_active',
                        inputValue: true,
                        checked: true
                    }, {
                        boxLabel: 'Deactive',
                        padding: '0px 0px 0px 20px',
                        name: 'is_active',
                        inputValue: false
                    }
                ],
                setValue: function(value) {
                    if (!Ext.isObject(value)) {
                        var obj = new Object();
                        obj[this.name] = value;
                        value = obj;
                    }
                    Ext.form.RadioGroup.prototype.setValue.call(this, value);
                }
            }]
        }


    ],
    buttons: [{
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            iconCls: 'icon-cancel',
            action: 'Cancel'
        }

    ]

});