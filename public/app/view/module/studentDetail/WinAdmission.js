Ext.define('ExtDesktop.view.module.studentDetail.WinAdmission', {
  extend: 'Ext.window.Window',
  alias: 'widget.studentDetailAdmission',
  title: 'T.C Student Admission',
  width: 1020,
  height: 620,
  modal: true,
  autoScroll: true,
  initComponent: function() {
    var me = this;
    Ext.applyIf(me, {

      items: [{
          xtype: 'form',
          name: 'mainForm',
          items: [{
            xtype: 'form',
            name: 'studnetInfo',
            bodyPadding: 20,
            items: [
              this.studentInfo(), {
                xtype: 'hiddenfield',
                name: 'studentId'
              }
            ]
          }, {
            xtype: 'tabpanel',
            border: false,
            layout: 'fit',
            height: 290,
            items: [
              this.getPersonalInfo(),
              this.getEducation(),
              // this.getAdmissionInfo(),
              {
                xtype: 'panel',
                bodyPadding: 10,
                title: 'Contact',
                items: [{
                  xtype: 'tabpanel',
                  // height:260,                                                    
                  items: [{
                    xtype: 'FmEmergency',
                    border: true,
                  }, {
                    xtype: 'FmFamily',
                    border: true
                  }]
                }]
              },
              // this.getAccountTab(),
              this.getGridDocument(), {
                xtype: 'panel',
                bodyPadding: 20,
                title: 'Note',
                layout: 'fit',
                items: [{
                  xtype: 'textarea',
                  name: 'note',
                  fieldLabel: 'Note',
                  labelAlign: 'top'
                }]

              }, {
                xtype: 'panel',
                title: 'Account'
              }, {
                xtype: 'panel',
                title: 'Attendance'
              }, {
                xtype: 'panel',
                title: 'Audit'
              }


            ]
          }]
        }


      ]
    });
    me.callParent(arguments);
  },

  getGridDocument: function() {
    var grid = {
      xtype: 'grid',
      title: 'Document',
      store: 'sdn.Document',
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
  getPersonalInfo: function() {
    var form = {
      xtype: 'form',
      name: 'personalInfo',
      title: 'Personal',
      border: false,
      // autoScroll:true,
      bodyPadding: 10,
      items: [{
          xtype: 'fieldset',
          title: 'Personal Contact',
          padding: 10,
          defaults: {
            labelWidth: 80,
            style: 'margin-left:10px'
          },
          layout: {
            type: 'table',
            columns: 2
          },
          items: [{
            xtype: 'hiddenfield',
            name: 'lead_id'
          }, {
            xtype: 'textfield',
            width: 350,
            fieldLabel: 'Phone No.(<font color="red">*</font>)',
            allowBlank: false,
            name: 'phone_no'
          }, {
            xtype: 'textarea',
            rowspan: 3,
            style: 'margin-left:10px',
            width: 580,
            fieldLabel: 'Address(<font color="red">*</font>)',
            height: 60,
            name: 'address',
            allowBlank: false
          }, {
            xtype: 'textfield',
            vtype: 'email',
            width: 350,
            name: 'email',
            fieldLabel: 'Email'
          }]
        }, {
          xtype: 'fieldset',
          title: 'Others',
          padding: 20,
          layout: {
            type: 'table',
            columns: 3
          },
          defaults: {
            labelWidth: 80,
            width: 280,
            editable: false,
            queryMode: 'local'
          },
          items: [{
            xtype: 'combo',
            name: 'category_id',
            width: 350,
            valueField: 'id',
            displayField: 'name',
            store: 'StudentCategory',
            fieldLabel: 'Category',
          }, {
            xtype: 'combo',
            style: 'margin-left:10px',
            store: 'Occupation',
            name: 'occupation_id',
            valueField: 'id',
            displayField: 'name',
            fieldLabel: 'Occupation',
          }, {
            xtype: 'combo',
            allowBlank: false,
            fieldLabel: 'Religion',
            emptyText: 'Select....',
            style: 'margin-left:10px',

            listeners: Util.firstSelect(),
            valueField: 'id',
            displayField: 'name',
            name: 'religion_id',
            store: 'lookup.CmbReligion'
          }, {
            xtype: 'combo',
            allowBlank: false,
            width: 350,
            fieldLabel: 'Nationality',
            emptyText: 'Select....',
            valueField: 'id',
            listeners: Util.firstSelect(),
            displayField: 'name',
            name: 'national_id',
            store: 'Nationality'
          }, {
            xtype: 'combo',
            allowBlank: false,
            fieldLabel: 'Langauge',
            emptyText: 'Select....',
            style: 'margin-left:10px',
            valueField: 'id',
            listeners: Util.firstSelect(),
            displayField: 'name',
            name: 'langauge_id',
            store: 'Langauge'
          }, {
            xtype: 'combo',
            allowBlank: false,
            fieldLabel: 'Ethnicity',
            emptyText: 'Select....',
            style: 'margin-left:10px',

            valueField: 'id',
            listeners: Util.firstSelect(),
            displayField: 'name',
            name: 'ethnicity_id',
            store: 'Ethnicity'
          }]
        }

      ]
    }


    return form;
  },

  studentInfo: function() {
    var form = {
      xtype: 'fieldset',
      title: '<b>Student Information',
      padding: 10,
      layout: {
        type: 'table',
        columns: 2
      },
      items: [{
          xtype: 'container',
          defaultType: 'textfield',
          defaults: {
            labelWidth: 85,
            width: 350
          },
          items: [{
            fieldLabel: 'First Name(<font color="red">*</font>)',
            allowBlank: false,
            name: 'first_name'
          }, {
            fieldLabel: 'គោត្តនាម(<font color="red">*</font>)',
            allowBlank: false,
            name: 'khr_first_name'
          }, {
            xtype: 'combo',
            allowBlank: false,
            fieldLabel: 'Gender(<font color="red">*</font>)',
            emptyText: 'Select....',
            valueField: 'id',
            displayField: 'name',
            editable: false,
            name: 'gender',
            listeners: Util.firstSelect(),
            store: Ext.create('Ext.data.Store', {
                fields: ['id', 'name'],
                data: [{
                  id: 'F',
                  name: "Female"
                }, {
                  id: 'M',
                  name: 'Male'
                }]
              })
              // store: 'lookup.CmbGender'
          }, {
            xtype: 'textfield',
            fieldLabel: 'National No.',
            name: 'national_no'
          }]
        }, {
          xtype: 'container',
          style: 'padding-left:10px; padding-top:10px',
          layout: {
            type: 'table',
            columns: 2
          },

          defaults: {
            labelStyle: 'margin-left:10px',
            width: 350
          },
          items: [{

              xtype: 'textfield',
              fieldLabel: 'Last Name(<font color="red">*</font>)',
              allowBlank: false,
              name: 'last_name'
            }, {
              xtype: 'form',
              name: 'image',
              layout: 'hbox',
              rowspan: 4,
              items: [
                Ext.create('Ext.Img', {
                  width: 150,
                  height: 120,
                  style: 'margin-left:20px',
                  src: 'resources/images/photo/no-picture.gif'
                }), {
                  xtype: 'hiddenfield',
                  name: 'image_url',
                }
              ]
            }, {
              xtype: 'textfield',
              fieldLabel: 'នាម(<font color="red">*</font>)',
              allowBlank: false,
              name: 'khr_last_name',

            }, {
              xtype: 'datefield',
              fieldLabel: 'Date of Birth(<font color="red">*</font>)',
              name: 'date_of_birth',
              value: new Date()
            }, {
              xtype: 'textfield',
              fieldLabel: 'Passport No.',
              name: 'passport_no'
            },


          ]
        }, {
          xtype: 'textfield',
          width: 710,
          labelWidth: 85,
          colspan: 2,
          fieldLabel: 'Place of Birth',
          name: 'place_of_birth',
          emptyText: '-- Place Of Birth --'
        },



      ]

    }

    var container = {
      xtype: 'form',
      name: 'sdnInfo',
      layout: 'fit',
      items: form
    }

    return container;
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
        labelWidth: 120,
        readOnly: true,
      },
      layout: {
        type: 'table',
        columns: 2

      },
      items: [{
        xtype: 'combo',
        fieldLabel: 'Batch(<span style="color:red">*</span>)',
        allowBlank: false,
        valueField: 'id',
        displayField: 'name',
        name: "batch_id",
        store: Ext.create('ExtDesktop.store.combo.Batch',{autoLoad:true}),
      }, {
        xtype: 'combo',
        fieldLabel: 'Degree(<span style="color:red">*</span>)',
        allowBlank: false,
        store: Ext.create('ExtDesktop.store.combo.DegreeTC',{autoLoad:true}),
        valueField: 'id',
        displayField: 'name',
        name: 'degree_id'
      }, {
        xtype: 'combo',
        name: 'course_id',
        store: Ext.create('ExtDesktop.store.combo.CourseTC',{autoLoad:true}),
        allowBlank: false,
        displayField: 'name',
        valueField: 'id',
        fieldLabel: 'Course(<span style="color:red">*</span>)',
      }, {
        xtype: 'combo',
        name: 'term_id',
        store: Ext.create('ExtDesktop.store.combo.Term',{autoLoad:true}),
        valueField: 'id',
        allowBlank: false,
        displayField: 'term_name',
        fieldLabel: 'Term(<span style="color:red">*</span>)'
      }, {
        xtype: 'combo',
        name: 'major_id',
        fieldLabel: 'Major/Skill(<span style="color:red">*</span>)',
        store: Ext.create('ExtDesktop.store.combo.Major',{autoLoad:true}),
        allowBlank: false,
        valueField: 'id',
        displayField: 'name'
      }, {
        xtype: 'combo',
        fieldLabel: 'Tuition Time(<span style="color:red">*</span>)',
        name: 'tuition_time_id',
        store: Ext.create('ExtDesktop.store.combo.TuitionTime',{autoLoad:true}),
        allowBlank: false,
        valueField: 'id',
        displayField: 'tuition_name'

      }, {
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
        store: Ext.create('ExtDesktop.store.combo.ClassShift',{autoLoad:true}),
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
        name: 's_level_id',
        store: Ext.create('ExtDesktop.store.combo.CourseLevel',{autoLoad:true}),
        valueField: 'id',
        allowBlank: false,
        displayField: 'name',
        fieldLabel: 'Start Level(<span style="color:red">*</span>)'
      }, {
        xtype: 'combo',
        fieldLabel: 'Academic Year',
        store: Ext.create("ExtDesktop.store.combo.AcademicYear",{autoLoad:true}),
        valueField: 'id',
        displayField: 'name',
        name: 'start_acd_year_id'
      }, {
        xtype: 'textfield',
        name: 'note',
        fieldLabel: 'Note',
        // width:810 , 

      }]
    };

    return form;
  },

  buttons: [

    {
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