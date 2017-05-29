Ext.define('ExtDesktop.view.module.admissionWU.WinTransfer', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.amsWinTransfer',
    title: 'Transfer Form',
    layout: 'fit',
    height: "80%",
    width: '80%',
    bodyPadding:20 ,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [

                this.getEducation()
            ]
        });
        me.callParent(arguments);

    },
    buttons:[
        {
            xtype:'button',
            action:'Save',
            text:'Save',
            iconCls:'icon-save'

        },{
            xtype:'button',
            text:'Cancel',
            action:'Cancel',
            iconCls:'icon-cancel',
            handler:function(){
                this.up("window").close()
            }
        }
    ],
    getEducation: function() {
        var form = {
            xtype: 'form',
            // title: 'Academic',
            name: 'academic',
            bodyPadding: 20,
            defaults: {
                width: 400,
                style: 'margin-left: 10px',
                queryMode: 'local',
                editable: false,
                labelWidth: 120
            },
            layout: {
                type: 'table',
                columns: 2

            },
            items: [{
                xtype:'textfield',
                name:'reference_no',
                fieldLabel:"Reference No"+redStar,
                allowBlank:false,
                tooltip:'Admission No',
                colspan:2 ,
            }, {
                    xtype:'textfield' ,
                    name:'student_name',
                    fieldLabel:'Student Name',
                    readOnly:true,
                },{
                    xtype:'datefield',
                    readOnly:true,
                    name:'dob',
                    fieldLabel:'DOB'

                },{
                    xtype:'textfield',
                    readOnly:true,
                    name:'student_no',
                    fieldLabel:"Student No"
                },{
                    xtype:'textfield',
                    name:'gender',
                    fieldLabel:'Gender'
                },{
                    xtype: 'combo',
                    fieldLabel: 'Batch(<span style="color:red">*</span>)',
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name',
                    name: "batch_id",
                    store: 'combo.Batch'
                }, {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                            fieldLabel: 'Program Type',
                            labelWidth: 120,
                            checked: true,
                            xtype: 'radiofield',
                            name: 'program_type',
                            boxLabel: 'Local',
                            inputValue: 'N'
                        }, {
                            boxLabel: 'International',
                            xtype: 'radiofield',
                            name: 'program_type',
                            inputValue: 'I',
                            style: 'margin-left:10px'
                        }

                    ]
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Degree(<span style="color:red">*</span>)',
                    allowBlank: false,
                    store: 'combo.DegreeWU',
                    valueField: 'id',
                    displayField: 'name',
                    queryMode:'local',
                    name: 'degree_id'
                }, {
                    xtype: 'combo',
                    name: 'course_id',
                    queryMode:'local',
                    store: 'combo.CourseWU',
                    allowBlank: false,
                    displayField: 'name',
                    valueField: 'id',
                    fieldLabel: 'Course(<span style="color:red">*</span>)'
                }, {
                    xtype: 'combo',
                    name: 'major_id',
                    fieldLabel: 'Major/Skill(<span style="color:red">*</span>)',
                    queryMode:'local',
                    store: 'combo.Major',
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name',
                    colspan: 2
                },
                /*{
                               xtype: 'combo',
                               fieldLabel: 'Tuition Time(<span style="color:red">*</span>)',
                               name: 'tuition_time_id',
                               store: 'combo.TuitionTime',
                               allowBlank: false,
                               valueField: 'id',
                               displayField: 'tuition_name'

                           },*/
                {
                    xtype: 'datefield',
                    name: 'admission_date',
                    format: 'd-m-Y',
                    allowBlank: false,
                    submitFormat: 'Y-m-d',
                    editable: true,
                    fieldLabel: 'Admission Date(<span style="color:red">*</span>)'
                }, {
                    xtype: 'combo',
                    name: 'class_shift_id',
                    store: 'combo.ClassShift',
                    valueField: 'id',
                    allowBlank: false,
                    displayField: 'name',
                    fieldLabel: 'Shift(<span style="color:red">*</span>)'
                }, {
                    xtype: 'combo',
                    name: 'admission_type',
                    fieldLabel: 'Admission Type',
                    valueField: 'id',
                    displayField: 'name',
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
                    xtype: 'combo',
                    fieldLabel: 'Academic Year',
                    store: "combo.AcademicYear",
                    valueField: 'id',
                    displayField: 'name',
                    name: 'start_acd_year_id'
                }, {
                    xtype: 'textarea',
                    name: 'note',
                    fieldLabel: 'Note',
                    colspan: 2,
                    maxlength: 250,
                    width: 810
                }
            ]
        };

        fieldset = Ext.create('Ext.form.FieldSet',{
            title:'Transfer Information',
            items:[
                form
            ]
        })

        return fieldset;
    },
});
