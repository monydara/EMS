/**
 * Created by HENG SOPHAT on 2/7/2016.
 */
var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.accountMaster.FmAccountInfo', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmAccountInfo',
    autoScroll: true,
    bodyPadding: '20 0 0 20',
    layout: 'hbox',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                this.getFormAcademicInfo(),
                this.getFormAccountInfo(),
                this.getFeeChargeInfo()
            ]
        });
        me.callParent(arguments);
    },

    getFeeChargeInfo: function() {
        var form = {
            xtype: 'form',
            name: 'FeeChargeInfo',
            fieldDefaults: {
                msgTarget: 'side',
                width: 280,
                readOnly: true
            },

            defaults: {
                width: 315
            },
            items: [
                // == field for WU admission show 
                {
                    xtype: 'component',
                    html: '<b>Fee Charge Information</b>',
                    cls: 'x-form-check-group-label',
                    margin: '0 0 10 0'
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Batch(<span style="color:red">*</span>)',
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name',
                    name: "batch_id",
                    readOnly: false,
                    store: 'combo.Batch',
                    hidden:true

                }, {
                    xtype: 'combo',
                    name: 'cycle_type_id',
                    fieldLabel: 'Bill Cycle',
                    afterLabelTextTpl: required,
                    allowBlank: false,
                    readOnly: false,
                    editable: false,
                    store: 'combo.CycleType',
                    valueField: 'id',
                    displayField: 'cycle_name',
                    hidden:true

                },
                // == field for TC admission show
                {
                    xtype: 'combo',
                    fieldLabel: 'Term',
                    name: 'term_id',
                    readOnly: false,
                    store: 'combo.Term',
                    valueField: 'id',
                    displayField: 'term_name'
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Tuition Time'+redStar,
                    name: 'tuition_time_id',
                    store: 'combo.TuitionTime',
                    readOnly: false,
                    allowBlank: false,
                    queryMode: 'local',
                    valueField: 'id',
                    displayField: 'tuition_name'
                },
                {
                    name: 'fee_plan_detail_id',
                    xtype: 'combo',
                    store:'combo.FeeCatDetailTC',
                    itemName:'fee_plan_tc',
                    fieldLabel: 'Fee Plan',
                    afterLabelTextTpl: required,
                    allowBlank: false,
                    readOnly: false,
                    editable: false,
                    hidden:true , 
                    disabled:true ,
                    valueField: 'id',
                    displayField: 'description',
                    queryMode:'local'
                },{
                    name: 'fee_plan_detail_id',
                    xtype: 'combo',
                    store:'combo.FeeCatDetailWU',
                    itemName:'fee_plan_wu',
                    fieldLabel: 'Fee Plan',
                    afterLabelTextTpl: required,
                    allowBlank: false,
                    readOnly: false,
                    hidden:true , 
                    disabled:true ,
                    editable: false,
                    valueField: 'id',
                    displayField: 'description',
                    queryMode:'local'
                },
                /*{
                    xtype:'container',
                    layout: {type: 'table', columns: 2},
                    items:[
                        {
                            xtype:'textfield',
                            name:'total_fee',
                            fieldLabel:'Total Fee($)',
                            value:0,
                            fieldStyle: 'text-align: right;'
                        },{
                            xtype: 'button',
                            style: 'margin-left:5px',
                            tooltip: 'Populate Fee',
                            action: 'btnPopulateFee',
                            text: 'P',
                            width: 30
                        }
                    ]
                },*/
                {
                    xtype: 'textfield',
                    name: 'fee_per_cycle',
                    fieldLabel: 'Fee/Cycle($)',
                    value: 0.0,
                    fieldStyle: 'text-align: right;'
                }, {
                    xtype: 'textfield',
                    name: 'balance',
                    fieldLabel: 'Balance',
                    value: 0.0,
                    fieldStyle: 'text-align: right;'
                },
            ]
        };

        return form;
    },

    getFormAccountInfo: function() {
        var form = {
            xtype: 'form',
            name: 'AccountInfo',
            fieldDefaults: {
                msgTarget: 'side',
                width: 300
            },
            defaults: {
                width: 335
            },
            margin: '0 20 0 0',
            items: [{
                xtype: 'component',
                html: '<b>Accounting Information</b>',
                cls: 'x-form-check-group-label',
                margin: '0 0 10 0'
            }, {
                xtype: 'combo',
                name: 'key_account_id',
                fieldLabel: 'Key Account',
                afterLabelTextTpl: required,
                allowBlank: false,
                editable: false,
                store: 'combo.KeyAccount',
                valueField: 'id',
                displayField: 'name'
            }, {
                xtype: 'combo',
                name: 'credit_control_id',
                fieldLabel: 'Credit Control',
                afterLabelTextTpl: required,
                allowBlank: false,
                editable: false,
                store: 'combo.CreditControl',
                valueField: 'id',
                displayField: 'policy_name'

            }, {
                xtype: 'combo',
                name: 'account_type',
                fieldLabel: 'Account Type',
                afterLabelTextTpl: required,
                allowBlank: false,
                editable: false,
                store: Ext.create('Ext.data.Store', {
                    fields: ['id', 'name'],
                    data: [{
                        id: 'N',
                        name: 'Normal'
                    }, {
                        id: 'I',
                        name: 'Installment'
                    }, {
                        id: 'S',
                        name: 'Scholarship'
                    }]
                }),
                valueField: 'id',
                displayField: 'name'
            }, {
                xtype: 'textfield',
                name: 'vat_no',
                fieldLabel: 'VAT Number'
            }, {
                xtype:'combo',
                name:'group_account_id',
                valueField:'id',
                displayField:'group_name',
                store:'combo.GroupAccount',
                fieldLabel:"Group Account"
            }]
        };

        return form;
    },
    getFormAcademicInfo: function() {
        var form = {
            xtype: 'form',
            name: 'AcademicInfo',
            defaultType: 'textfield',
            margin: '0 20 0 0',
            fieldDefaults: {
                msgTarget: 'side',
                width: 300
            },
            defaults: {
                width: 335
            },
            items: [{
                xtype: 'component',
                html: '<b>Academic Information</b>',
                cls: 'x-form-check-group-label',
                margin: '0 0 10 0'
            },{
                xtype:'hiddenfield',
                name:'student_id'
            } ,{
                name: 'student_no',
                fieldLabel: 'Student ID',
                readOnly: true
            }, {
                name: 'name',
                fieldLabel: 'Name',
                readOnly: true
            }, {
                xtype: 'combo',
                name: 'admission_id',
                fieldLabel: 'Admission No.',
                afterLabelTextTpl: required,
                allowBlank: false,
                editable: false,
                queryMode: 'local',
                store: 'combo.Admission',
                valueField: 'id',
                displayField: 'admission_no'
            }, {
                name: 'degree_name',
                fieldLabel: 'Degree',
                readOnly: true
            }, {
                name: 'course_name',
                fieldLabel: 'Course',
                readOnly: true
            },{
                xtype:'hiddenfield',
                name:'degree_id'
            },{
                xtype:'hiddenfield',
                name:"course_id"
            }]

        };

        return form;
    }
});