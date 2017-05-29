var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.admissionWU.WinAdmission', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinAddmissionWU',
    title: 'Student Admission',
    width: 1020,
    height: 620,
    modal: true,
    //autoScroll: true,
    // minimizable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                    {
                        xtype: 'form',
                        name: 'mainForm',
                        autoScroll: true,
                        items: [
                                    this.basicForm(),
                                    this.tabPanel()
                        ]
                    }
            ]
        });
        me.callParent(arguments);
    },

    //basic information
    basicForm:function(){
      var form={
                  xtype: 'form',
                  name: 'sdnInfo',
                  bodyPadding: 10,
                  fieldDefaults: {
                      msgTarget: 'side',
                      width: 350,
                      labelWidth: 100
                  },
                  items: [
                      this.getBasicInfo(),
                      {
                          xtype: 'hiddenfield',
                          name: 'studentId'
                      },{
                          xtype: 'hiddenfield',
                          name: 'lead_id'
                      }
                  ]
      };
        return form;
    },
    getBasicInfo:function(){
        var form={
            xtype: 'container',
            anchor: '100%',
            layout: {type: 'table', columns: 2},
            defaultType: 'textfield',
            items:[
                {
                    xtype: 'container',
                    anchor: '100%',
                    layout: {type: 'table', columns: 2, tdAttrs: {valign: 'top'}},
                    defaultType: 'textfield',
                    items:[
                        {
                            xtype: 'component',
                            html: 'Basic Information',
                            cls:'x-form-check-group-label',
                            colspan:2,
                            width: 720,
                            margin:'0 0 20 0'
                        }, {

                            xtype:'container',
                            colspan:2,
                            layout: {type: 'table', columns: 3},
                            items:[
                                {
                                    xtype:'textfield',
                                    fieldLabel:'Reference. No',
                                    name:'reference_no',
                                    width: 280,
                                    readOnly:true
                                },{
                                    xtype:'button',
                                    text:'...',
                                    margin:'0 5 0 5',
                                    action:'SelectRefAdmission'
                                },{
                                    xtype:'button',
                                    text:'P',
                                    action:'PopulateRefAdmission'
                                }
                            ]
                        },{
                            xtype: 'textarea',
                            height:30,
                            fieldLabel: 'នាមត្រកូល',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            name: 'khr_last_name'
                        },{
                            fieldLabel: 'នាម',
                            allowBlank: false,
                            afterLabelTextTpl: required,
                            xtype: 'textarea',
                            height:30,
                            name: 'khr_first_name'

                        },{
                            xtype: 'textfield',
                            fieldLabel: 'Last Name',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            name: 'last_name'

                        }, {
                            xtype:'container',
                            layout: {type: 'table', columns: 2},
                            items:[
                                {

                                    fieldLabel: 'First Name',
                                    afterLabelTextTpl: required,
                                    allowBlank: false,
                                    name: 'first_name',
                                    xtype: 'textfield',
                                    width: 315

                                },{
                                    xtype: 'button',
                                    style: 'margin-left:5px',
                                    tooltip: 'Select Registered student.',
                                    action: 'BroweRegistration',
                                    text: '...',
                                    width: 30
                                }]
                        },{
                            xtype: 'combo',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            fieldLabel: 'Gender',
                            emptyText: 'Select....',
                            valueField: 'id',
                            displayField: 'name',
                            editable: false,
                            name: 'gender',
                            listeners: Util.firstSelect(),
                            store: Ext.create("Ext.data.Store", {
                                fields: ['id', 'name'],
                                data: [{id: 'M', name: 'Male'}, {id: 'F', name: 'Female'}]
                            })
                        },{
                            xtype: 'datefield',
                            fieldLabel: 'Date of Birth',
                            afterLabelTextTpl: required,
                            allowBlank: false,
                            name: 'date_of_birth',
                            format:'d-M-Y',
                            submitFormat:'Y-m-d',
                            value: new Date()
                        },{
                            xtype: 'textfield',
                            fieldLabel: 'National No.',
                            name: 'national_no'
                        },{
                            xtype: 'textfield',
                            fieldLabel: 'Passport No.',
                            name: 'passport_no'
                        },{
                            xtype: 'textarea',
                            width: 710,
                            colspan: 2,
                            fieldLabel: 'Place of Birth',
                            name: 'place_of_birth'
                        }
                    ]
                },{
                    xtype: 'form',
                    name: 'image',
                    layout: {type: 'table', columns: 2, tdAttrs: {
                        valign: 'top'
                    }},

                    items: [
                        Ext.create('Ext.Img', {
                            width: 200,
                            height: 200,
                            style: 'margin-left:20px',
                            src: 'resources/images/photo/no-picture.gif'
                        }),
                        {
                            xtype: 'filefield',
                            buttonText: '.....',
                            margin: '20 0 0 10',
                            width: 50,
                            buttonOnly: true,
                            name: 'image',
                            action: 'browse'
                        }, {
                            xtype: 'hiddenfield',
                            value:'resources/images/photo/no-picture.gif',
                            name: 'image_url'
                        }
                    ]
                }
            ]
        };
        return form;

    },

    //Tab Panel
    tabPanel:function(){
        var tabPanel={
                      xtype: 'tabpanel',
                      border: false,
                      // layout: 'fit',
                      height: 280,
                      autoScroll: true,
                      items: [
                                  this.personalTab(),
                                  this.contactTab(),
                                  this.getEducation(),
                                  this.getGridDocument(),
                                  this.getAdditionalForm()
                      ]
      };
        return tabPanel;
    },


    contactTab:function(){
      var tab={
                      xtype: 'panel',
                      bodyPadding: 10,
                      title: 'Contact',
                      autoScroll: true,
                      items: [{
                          xtype: 'tabpanel',
                          items: [{
                              xtype: 'FmFamilyWU'
                          }, {
                              xtype: 'FmEmergencyWU'
                          }]
                      }]
      };
        return tab;
    },
    getGridDocument: function() {
        var grid = {
            xtype: 'grid',
            title: 'Document',
            tbar: [
                '->', {
                    text: 'Add',
                    action: 'AddDocument',
                    iconCls: 'icon-add'
                }
            ],
            store: 'sdn.Document',
            viewConfig: {
                getRowClass: function(record, id) {
                    return record.get("is_del") == true ? "hidden" : "row-error";
                },
                 enableTextSelection: true
            },
            columns: [{
                header: 'No',
                xtype: 'rownumberer',
                width: 50,
                align: 'center'
            }, {
                header: 'Doc. Name',
                dataIndex: 'doc_name',
                flex: 1
            }, {
                header: 'Doc. Type',
                dataIndex: 'doc_type',
                flex: 1

            }, {
                header: 'Action',
                align: 'center',
                xtype: 'actioncolumn',
                items: [{
                    xtype: 'button',
                    iconCls: 'icon-depositlist',
                    tooltip: 'Download File',
                    handler: function(grid, rowIndex) {
                        var store = grid.getStore();
                        var rec = store.getAt(rowIndex);
                        window.open(rec.get('file_path'));
                    }
                }, {
                    xtype: 'button',
                    iconCls: 'icon-delete',
                    handler: function(grid, rowIndex) {
                        var controller = ExtDesktop.app.getController('Admission');
                        controller.removeDocument(grid, rowIndex);


                    }
                }]
            }]
        }

        return grid;
    },
    personalTab:function(){
        var tab={
                    xtype:'form',
                    name:'personalInfo',
                    title:'Personal',
                    bodyPadding:10,
                    autoScroll: true,
                    defaultType: 'textfield',
                    fieldDefaults: {msgTarget: 'side', width: 320},
                    layout:{ type: 'table', columns: 3, tdAttrs: { valign: 'top'}},
                    items:[
                            {
                                xtype: 'container',
                                //layout: 'anchor',
                                defaultType: 'textfield',
                                items:[
                                        {
                                            xtype: 'component',
                                            html: 'Personal Contact',
                                            cls:'x-form-check-group-label',
                                            margin:'0 0 20 0',
                                            anchor: '100%'
                                        }, {
                                            xtype: 'textfield',
                                            fieldLabel: 'Phone No.',
                                            afterLabelTextTpl: required,
                                            allowBlank: false,
                                            name: 'phone_no'
                                        },{
                                            xtype: 'textfield',
                                            vtype: 'email',
                                            name: 'email',
                                            fieldLabel: 'Email'
                                        }, {
                                            xtype: 'hiddenfield',
                                            name: 'handler'
                                        },{
                                            xtype:'combo',
                                            fieldLabel:'From City',
                                            name:'from_city_id',
                                            store:'combo.CityState',
                                            queryMode:'remote',
                                            valueField:'id',
                                            displayField:'city_name'
                                        }, {
                                            xtype: 'textarea',
                                            fieldLabel: 'Address',
                                            name: 'address'
                                            //afterLabelTextTpl: required,
                                            //allowBlank: false
                                        }
                                ]
                            },
                            {
                                xtype: 'container',
                                defaultType: 'textfield',
                                margin:'0 0 0 20',
                                defaults: {width: 280, editable: false, queryMode: 'local'},
                                items: [
                                            {
                                                xtype: 'component',
                                                html: 'Others',
                                                cls:'x-form-check-group-label',
                                                margin:'0 0 20 0',
                                                anchor: '100%'
                                            }, {
                                                xtype: 'combo',
                                                name: 'category_id',
                                                valueField: 'id',
                                                displayField: 'name',
                                                store: 'StudentCategory',
                                                fieldLabel: 'Category'
                                            }, {
                                                xtype: 'combo',
                                                store: 'Occupation',
                                                name: 'occupation_id',
                                                valueField: 'id',
                                                displayField: 'name',
                                                fieldLabel: 'Occupation'
                                            },{
                                                xtype: 'combo',
                                                //allowBlank: false,
                                                fieldLabel: 'Religion',
                                                emptyText: 'Select....',
                                                valueField: 'id',
                                                displayField: 'name',
                                                name: 'religion_id',
                                                store: 'lookup.CmbReligion'
                                            }, {
                                                xtype: 'combo',
                                                fieldLabel: 'Nationality',
                                                emptyText: 'Select....',
                                                valueField: 'id',
                                                displayField: 'name',
                                                name: 'national_id',
                                                store: 'Nationality'
                                            }, {
                                                xtype: 'combo',
                                                //allowBlank: false,
                                                fieldLabel: 'Langauge',
                                                emptyText: 'Select....',
                                                valueField: 'id',
                                                displayField: 'name',
                                                name: 'langauge_id',
                                                store: 'Langauge'
                                            }, {
                                                xtype: 'combo',
                                                //allowBlank: false,
                                                fieldLabel: 'Ethnicity',
                                                emptyText: 'Select....',
                                                valueField: 'id',
                                                displayField: 'name',
                                                name: 'ethnicity_id',
                                                store: 'Ethnicity'
                                            }
                                ]
                            },
                            {
                                xtype: 'textarea',
                                name: 'note',
                                margin:'0 0 0 20',
                                height:210,
                                fieldLabel: 'Note',
                                labelAlign: 'top'
                            }
                    ]
        };

        return tab;
    },
    other: function() {
        var panel = {
            xtype: 'panel',
            title: 'Other',
            bodyPadding: 20,
            layout: 'fit',
            items: [{
                    xtype: 'textarea',
                    name: 'note',
                    fieldLabel: 'Note'
                }

            ]
        }

        return panel;
    },
    getEducation: function() {
        var form = {
                    xtype: 'form',
                    title: 'Academic',
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
                        columns: 2,
                        tdAttrs: {
                            valign: 'top'
                        }
                    },
                    items: [{

                        xtype: 'datefield',
                        name: 'admission_date',
                        format: 'd-m-Y',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        submitFormat: 'Y-m-d',
                        editable: true,
                        fieldLabel: 'Admission Date'
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
                        fieldLabel: 'Degree',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        store: 'combo.DegreeWU',
                        valueField: 'id',
                        displayField: 'name',
                        name: 'degree_id'
                    }, {
                        xtype: 'combo',
                        name: 'admission_type',
                        fieldLabel: 'Admission Type',
                        valueField: 'id',
                        displayField: 'name',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        store: Ext.create('Ext.data.Store', {
                            fields: ['id', 'name'],
                            data: [{id: 'N', name: 'Normal'},
                                {id: 'T', name: 'Transfer'},
                                {id: 'S', name: 'Scholarship'}]
                        })


                    }, {
                        xtype: 'combo',
                        name: 'course_id',
                        store: 'acd.Faculty',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        displayField: 'name',
                        valueField: 'id',
                        fieldLabel: 'Faculty'

                    },{

                        xtype: 'combo',
                        name: 'class_shift_id',
                        store: 'combo.ClassShift',
                        valueField: 'id',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        displayField: 'name',
                        fieldLabel: 'Shift'
                    }, {
                        xtype: 'combo',
                        name: 'major_id',
                        fieldLabel: 'Major/Skill',
                        afterLabelTextTpl: required,
                        store: 'combo.Major',
                        queryMode:'local',
                        allowBlank: false,
                        valueField: 'id',
                        displayField: 'name'


                    }, {
                        xtype: 'combo',
                        fieldLabel: 'Batch',
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        valueField: 'id',
                        displayField: 'name',
                        name: "batch_id",
                        store: 'combo.Batch'
                    }, {
                        xtype: 'textarea',
                        name: 'note',
                        fieldLabel: 'Note',
                        maxlength: 250,
                    }, {
                        xtype: 'combo',
                        fieldLabel: 'Academic Year',
                        store: "combo.AcademicYear",
                        afterLabelTextTpl: required,
                        allowBlank: false,
                        valueField: 'id',
                        displayField: 'name',
                        name: 'start_acd_year_id'

                    }]
                };
                return form;
    },
    getAdditionalForm: function() {
        var panel = {
            xtype: 'form',
            title: 'Additional',
            name: 'additional',
            bodyPadding: 10,
            autoScroll: true,
            items: [{
                xtype: 'tabpanel',

                items: [

                    {
                        xtype: 'panel',
                        border: true,
                        title: 'Personal',
                        height: 180,
                        defaults: {
                            labelWidth: 130,
                            width: 400,
                            style: 'margin-left:10px'
                        },
                        layout: {
                            type: 'table',
                            columns: 2
                        },
                        bodyPadding: 10,
                        items: [{
                            xtype: 'container',
                            layout: 'hbox',
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
                            style: 'margin-left:10px'
                        },
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
                        },{
                            xtype:'textfield',
                            name: 'diploma_exam_place',
                            maxLength: 100,
                            fieldLabel: 'មណ្ឌលប្រលង'
                        }, {
                            xtype: 'combo',
                            name: 'diploma_grade',
                            maxLength: 100,
                            fieldLabel: 'និទេស',
                            store: ['A', 'B', 'C', 'D', 'E', 'F']
                        }, {
                            xtype: 'container',
                            layout: 'hbox',
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
                    }
                ]
            }]
        }
        return panel;
    },
    buttons: [
        {
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
    /*}, {
        text: 'Save & Close',
        action: 'SaveClose',
        iconCls: 'icon-save'*/
    }, {
        text: 'Cancel',
        iconCls: 'icon-cancel',
        action: 'Cancel'
    }]

});
