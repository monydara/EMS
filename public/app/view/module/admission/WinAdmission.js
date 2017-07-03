Ext.define('ExtDesktop.view.module.admission.WinAdmission', {
	extend: 'Ext.window.Window',
	alias: 'widget.WinAddmission',
	title: 'Student Admission',
	width: 1020,
	height: 610,
	modal: true,
	autoScroll: true,
	initComponent: function() {
		var me = this;
		Ext.applyIf(me, {

			items: [{
				xtype: 'Form',
				name: 'mainForm',
				items: [{
					xtype: 'Form',
					name: 'studnetInfo',
					bodyPadding: 10,
					items: [
						this.studentInfo(), {
							xtype: 'hiddenfield',
							name: 'studentId'
						}
					]
				}, {
					xtype: 'tabpanel',
					border: false,
					height: 310,
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
									border: true
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
						},


					]
				}]
			}]
		});
		me.callParent(arguments);
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
	getPersonalInfo: function() {
		var form = {
			xtype: 'Form',
			name: 'personalInfo',
			title: 'Personal',
			border: false,
			// autoScroll:true,
			bodyPadding: 5,
			items: [{
				xtype: 'fieldset',
				title: 'Personal Contact',
				padding: 5,
				items: [{
					xtype: 'form',
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
						xtype: 'hiddenfield',
						name: 'handler'
					}, {
						xtype: 'textfield',
						width: 350,
						fieldLabel: 'Phone No.'+redStar,
						allowBlank: false,
						name: 'phone_no'
					}, {
						xtype: 'textarea',
						rowspan: 3,
						style: 'margin-left:10px',
						width: 580,
						fieldLabel: 'Address',
						height: 80,
						name: 'address',
						allowBlank: true
					}, {
						xtype: 'textfield',
						vtype: 'email',
						width: 350,
						name: 'email',
						fieldLabel: 'Email'
					}, {
						xtype: 'combo',
						fieldLabel: 'From City',
						width: 350,
						name: 'from_city_id',
						store: 'combo.CityState',
						queryMode: 'Remote',
						valueField: 'id',
						displayField: 'city_name'
					}]
				}]
			}, {
				xtype: 'fieldset',
				title: 'Others',
				padding: 5,
				items: [{
					xtype: 'form',
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
						listeners: Util.firstSelect(),
						width: 350,
						valueField: 'id',
						displayField: 'name',
						store: 'StudentCategory',
						fieldLabel: 'Category',
						// allowBlank: false
					}, {
						xtype: 'combo',
						style: 'margin-left:10px',
						listeners: Util.firstSelect(),
						store: 'Occupation',
						name: 'occupation_id',
						valueField: 'id',
						displayField: 'name',
						fieldLabel: 'Occupation',
						//allowBlank: false
					}, {
						xtype: 'combo',
						// allowBlank: false,
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
						// allowBlank: false,
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
						//allowBlank: false,
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
						// allowBlank: false,
						fieldLabel: 'Ethnicity',
						emptyText: 'Select....',
						style: 'margin-left:10px',

						valueField: 'id',
						listeners: Util.firstSelect(),
						displayField: 'name',
						name: 'ethnicity_id',
						store: 'Ethnicity'
					}]
				}]
			}]
		}


		return form;
	},
	studentInfo: function() {
		var form = {
			padding: 10,
			xtype: 'container',
			layout: {
				type: 'table',
				columns: 2
			},
			items: [{
				xtype: 'form',
				name: 'sdnInfo',
				//style: 'padding-left:10px; padding-top:10px',
				layout: {
					type: 'table',
					columns: 2
				},
				defaults: {
					labelStyle: 'margin-left:10px',
					width: 350,
					xtype: 'textfield',
					allowBlank: false
				},
				items: [
                    {

                        fieldLabel: 'គោត្តនាម'+redStar,
                        allowBlank: false,
                        name: 'khr_first_name'


                }, {
                        xtype: 'textfield',
                        fieldLabel: 'នាម'+redStar,
                        allowBlank: false,
                        name: 'khr_last_name'

                }, {
                        xtype: 'textfield',
                        fieldLabel: 'Last Name'+redStar,
                        allowBlank: false,
                        name: 'last_name'
				}, {
					xtype: 'container',
					layout: {
						type: 'table',
						columns: 2
					},
					items: [{
						labelStyle: 'margin-left:10px',
						xtype: 'textfield',
						fieldLabel: 'First Name'+redStar,
						allowBlank: false,
						name: 'first_name',
						width: 310
					}, {
						xtype: 'button',
						style: 'margin-left:5px',
						tooltip: 'Browse From Registration',
						action: 'BrowseRegistration',
						text: '...',
						width: 30
					}]
                }, {

					xtype: 'combo',
					allowBlank: false,
					fieldLabel: 'Gender',
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
				}, {
					xtype: 'datefield',
					fieldLabel: 'Date of Birth'+redStar,
					name: 'date_of_birth',
					format: 'd-M-Y',
					submitFormat: 'Y-m-d',
					value: new Date()


				}, {
					xtype: 'textfield',
					fieldLabel: 'National No.',
					name: 'national_no',
					allowBlank: true
				}, {
					xtype: 'textfield',
					fieldLabel: 'Passport No.',
					name: 'passport_no',
					allowBlank: true
				}, {
					xtype: 'textfield',
					width: 700,
					colspan: 2,
					fieldLabel: 'Place of Birth',
					name: 'place_of_birth',
					allowBlank: true

				}]
			}, {
				xtype: 'form',
				name: 'image',
				layout: 'hbox',
				width: 180,
				items: [
					Ext.create('Ext.Img', {
						width: 140,
						height: 140,
						style: 'margin-left:10px',
						src: 'resources/images/photo/no-picture.gif'
					}), {
						xtype: 'filefield',
						buttonText: '...',
						margin: 'margin-top:100px',
						width: 30,
						name: 'image',
						buttonOnly: true,
						action: 'browse'
					}, {
						xtype: 'hiddenfield',
						value:'resources/images/photo/no-picture.gif',
						name: 'image_url'
					}
				]
			}]
		}

		var container = {
			xtype: 'fieldset',
			title: 'Basic Info.',
			items: form
		}
		return container;
	},
	other: function() {
		var panel = {
			xtype: 'panel',
			title: 'Other',
			bodyPadding: 10,
			layout: 'fit',
			items: [{
				xtype: 'textarea',
				name: 'note',
				fieldLabel: 'Note'
			}]
		}

		return panel;
	},
	getEducation: function() {
		var form = {
			xtype: 'Form',
			title: 'Academic',
			name: 'academic',
			bodyPadding: 10,
			defaults: {
				width: 400,
				style: 'margin-left: 10px',
				queryMode: 'remote',
				editable: false,
				labelWidth: 120
			},
			layout: {
				type: 'table',
				columns: 2
			},
			items: [{
				xtype: 'combo',
				fieldLabel: 'Degree',
				allowBlank: false,
				store: 'combo.DegreeTC',
				queryMode: 'local',
				valueField: 'id',
				displayField: 'name',
				name: 'degree_id'
			}, {
				xtype: 'combo',
				fieldLabel: 'Academic Year',
				store: "combo.AcademicYear",
				valueField: 'id',
				displayField: 'name',
				allowBlank: false,
				name: 'start_acd_year_id'

			}, {
				xtype: 'combo',
				name: 'course_id',
				store: 'combo.CourseTC',
				queryMode: 'local',
				allowBlank: false,
				displayField: 'name',
				valueField: 'id',
				fieldLabel: 'Course'
			}, {
				xtype: 'combo',
				name: 'term_id',
				store: 'combo.Term',
				queryMode: 'local',
				valueField: 'id',
				allowBlank: false,
				displayField: 'term_name',
				fieldLabel: 'Term'
			}, {
				xtype: 'combo',
				name: 'major_id',
				fieldLabel: 'Major/Skill',
				store: 'combo.Major',
				queryMode: 'local',
				allowBlank: false,
				valueField: 'id',
				displayField: 'name'
			}, {
				xtype: 'combo',
				name: 'class_shift_id',
				store: 'combo.ClassShift',
				queryMode: 'local',
				valueField: 'id',
				allowBlank: false,
				displayField: 'name',
				fieldLabel: 'Shift'
			}, {
				xtype: 'combo',
				name: 's_level_id',
				store: 'combo.CourseLevel',
				valueField: 'id',
				allowBlank: false,
				displayField: 'name',
				queryMode: 'local',
				fieldLabel: 'Start Level'
			}, {
				xtype: 'combo',
				fieldLabel: 'Tuition Time',
				name: 'tuition_time_id',
				store: 'combo.TuitionTime',
				allowBlank: false,
				queryMode: 'local',
				valueField: 'id',
				displayField: 'tuition_name'
			}, {
				xtype: 'combo',
				name: 'admission_type',
				listeners: Util.firstSelect(),
				fieldLabel: 'Admission Type',
				allowBlank: false,
				valueField: 'id',
				displayField: 'name',
				queryMode: 'local',
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
				xtype: 'datefield',
				name: 'admission_date',
				format: 'd-M-Y',
				value: new Date(),
				allowBlank: false,
				submitFormat: 'Y-m-d',
				editable: true,
				fieldLabel: 'Admission Date'
			}, {
				xtype: 'textarea',
				name: 'note',
				fieldLabel: 'Note',
				colspan: 2,
				width: 810
			}]
		};

		return form;
	},
	buttons: [

		{
			text: 'Save',
			iconCls: 'icon-save',
			action: 'Save'
				/* }, {
			text: 'Save & Close',
			action: 'SaveClose',
			iconCls: 'icon-save'*/
		}, {
			text: 'Cancel',
			iconCls: 'icon-cancel',
			action: 'Cancel'
		}

	]

});
