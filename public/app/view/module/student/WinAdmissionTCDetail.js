/**
 * Created by hengsophat on 10/16/2015.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';

Ext.define('ExtDesktop.view.module.student.WinAdmissionTCDetail', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinAdmissionTCDetail',
    title: 'Admission Detail',
    modal: true,
    width:880,
    height:550,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items: [this.formAdmissionDetail(),this.tabAdmissionDetail()]
        });
        this.buttons=[
                {
                    text:'Save',
                    action:'Save',
                    disabled: this.isReadOnly,
                }, {
                    text: 'Unlock',
                    action: 'Unlock',
                    disabled: !this.isReadOnly,

                },{
                    text:'Close',
                    action:'Close'
                }
    ]; 
        me.callParent(arguments);
    },

   

    tabAdmissionDetail:function(){
        var tab={
            xtype:'tabpanel',
            autoScroll: true,
            items:[
                    this.formClassDetail(),
                    {
                        title:'Account',
                        xtype:'panel',
                        minHeight:'100%'
                    },{
                        title:'Document',
                        xtype:'panel',
                        minHeight:'100%'

                    },{
                        title:'Attendance',
                        xtype:'panel'

                    },{
                        title:'History',
                        xtype:'panel'
                    }

            ]
        };
        return tab;
    },

    formClassDetail:function(){
        var form={
                xtype:'form',
                bodyPadding:10,
                defaultType: 'textfield',
                itemId:'class',
                title:'Class',
                fieldDefaults: {
                    // labelAlign: 'top',
                    msgTarget: 'side',
                    width: 350,
                    style: 'margin-left:5px',
                    editable:false
                },
                layout: {
                    type: 'table',
                    columns: 2,
                    tdAttrs:{
                        align:'top'
                    }
                },
                items:[
                    {
                        fieldLabel:'Class',
                        name:'class_name',
                        readOnly:true
                    },{
                        fieldLabel:'Room',
                        xtype:'combo',
                        name:'room_id',
                        readOnly:true
                    },{
                        fieldLabel:'Term',
                        xtype:'textfield',
                        name:'term',
                        readOnly:true
                    },{
                        fieldLabel:'Shift',
                        xtype:'textfield',
                        name:'session',
                        readOnly:true
                    }, {
                        xtype: 'combo',
                        fieldLabel: 'Course Level',
                        name: 'course_level_id',
                        readOnly: true
                    },{
                        xtype:'textfield',

                        fieldLabel:'Tuition Time',
                        name: 'tuition_name',
                        readOnly:true
                    },{
                        xtype:'timefield',
                        fieldLabel:'Start Time',
                        name: 'study_start_time',
                        readOnly:true
                    }, {
                        fieldLabel: 'Status',
                        name: "status",
                        readOnly: true
                    },{
                        xtype:'textarea',
                        fieldLabel:'Description',
                        colspan:2,
                        width:705,
                        name:'description'
                    }
                ]
            };
            return form;
    },
    formAdmissionDetail:function(){

        var form={
            bodyPadding:10,
            xtype:'form',
            defaultType: 'textfield',
            fieldDefaults: {
                // labelAlign: 'top',
                msgTarget: 'side',
                width: 350,
                style: 'margin-left:5px', labelWidth:120
            },
            layout: {
                type: 'table',
                columns: 2,
                tdAttrs:{
                    align:'top'
                }
            },
            items:[
                {
                    fieldLabel: 'Admission No',
                    name: 'admission_no',
                    readOnly: true
                },{
                    fieldLabel: 'Ref. No',
                    name: 'reference_no',
                    readOnly: true
                }, {
                    xtype: 'combo',
                    name: 'admission_type',
                    fieldLabel: 'Admission Type',
                    valueField: 'id',
                    displayField: 'name',
                    readOnly: this.isReadOnly,
                    afterLabelTextTpl: required,
                    allowBlank: false,
                    store: Ext.create('Ext.data.Store', {
                        fields: ['id', 'name'],
                        data: [{id: 'N', name: 'Normal'},
                            {id: 'T', name: 'Transfer'},
                            {id: 'S', name: 'Scholarship'}]
                    })
                },{
                    xtype:'datefield',
                    readOnly: this.isReadOnly,
                    name:'admission_date',
                    fieldLabel:'Admission Date'
                },{
                    xtype:'combo',
                    name:'degree_id',
                    store:'combo.DegreeTC',
                    queryMode:'local',
                    valueField:'id',
                    displayField:'name',
                    editable:false,
                    fieldLabel:'Degree',
                    readOnly: true
                },{
                    xtype:'combo',
                    fieldLabel:'Course',
                    name:'course_id',
                    valueField:'id',
                    queryMode:'local',
                   store:'combo.CourseTC',
                    editable:false,
                    displayField:'name',
                    readOnly: true
                }, {
                    xtype: 'combo',
                    name: 'major_id',
                    fieldLabel: 'Skill',
                    afterLabelTextTpl: required,
                   store: 'combo.Major',
                    readOnly: this.isReadOnly,
                    queryMode:'Remote',
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name'
                },{
                    xtype: 'combo',
                    fieldLabel: 'Academic Year',
                   store: "combo.AcademicYear",
                    afterLabelTextTpl: required,
                    readOnly: this.isReadOnly,
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name',
                    name: 'start_acd_year_id'
                },{
                    fieldLabel: 'Status',
                    name: 'status',
                    colspan: 2,
                    readOnly: true
                }, {
                    xtype: 'textarea',
                    fieldLabel: 'Note',
                    colspan: 2,
                    width: 705,
                    name: 'note'
                }
            ]
        };

        return form;
    }

});

