Ext.define('ExtDesktop.view.module.classTC.WinClass', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmClassTC',
	title: 'T.C Class',
	modal:'true',
	height:500 ,
	items:[
        {
            xtype:'form',
            bodyPadding:20,
            defaults: { labelWidth: 115,width:400, margin:'0 0 10px 10px', allowBlank:false},
            layout:{ type:'table',columns:2,tdAttrs:{valign:'top'}},
            items:[
				{
					xtype:'textfield',
					fieldLabel:'Class Code',
					maxLength:15,
					name:'class_code'
                },{
                    xtype:'combo',
                    name:'degree_id',
                    store:'combo.DegreeTC',
                    queryMode:'local',
                    valueField:'id',
                    displayField:'name',
                    editable:false,
                    fieldLabel:'Degree'
                },{
                    xtype:'textfield',
                    fieldLabel:'Class Name',
                    maxLength:50,
                    name:'class_name'
				},{
					xtype:'combo',
					fieldLabel:'Course',
					name:'course_id',
					valueField:'id',
                    queryMode:'local',
					store:'combo.CourseTC',
					editable:false,
					displayField:'name'
				},{
					xtype:'combo',
					fieldLabel:'Academic Year',
					name:'academic_year_id',
					store:'combo.AcademicYear',
					valueField:'id',
                    queryMode:'remote',
					editable:false,
					displayField:'name'

				},{
					xtype:'combo',
					fieldLabel:'Course Level',
					name:'course_level_id',
                    queryMode:'local',
					store:'combo.CourseLevel',
					valueField:'id',
					editable:false,
					displayField:'name'

				},{
					xtype:'combo',
					fieldLabel:'Room',
					valueField:'id',
					displayField:'name',
                    queryMode:'remote',
					editable:false,
					store:'combo.Room',
					name:'room_id'
				},{
					xtype:'combo',
					fieldLabel:'Term',
					name:'term_id',
					store:'combo.Term',
					valueField:'id',
					displayField:'term_name'
				},{
					xtype:'combo',
					name:'tuition_time_id',
					store:'combo.TuitionTime',
					valueField:'id',
					displayField:'tuition_name',
					fieldLabel:'Tuition Time'
				},{
					xtype:'combo',
					name:'session_id',
					store:'combo.ClassShift',
					valueField:'id',
                    queryMode:'remote',
					displayField:'name',
					editable:false,
					fieldLabel:'Class Shift'
				},{
					xtype:'datefield',
					name:'start_date',
					value:new Date() ,
					submitFormat:'Y-m-d',
					format:'d-M-Y',
                    allowBlank:true,
					fieldLabel:'Start Date'
				},{
					xtype:'datefield',
					name:'end_date',
					submitFormat:'Y-m-d',
					format:'d-M-Y',
					value:new Date() ,
                    allowBlank:true,
					fieldLabel:'End Date'
				},{
					xtype:'timefield',
					name:'study_start_time',
					editable:false,
					fieldLabel:'Start Time'
                },{
                    xtype:'textarea',
                    fieldLabel:'Description',
                    rowspan:2,
                    height:120,
                    allowBlank:true,
                    name:'description'
                },{
                    xtype:'fieldset',
                    title:'Class Status',
                    layout:'hbox',

                    //style:'margin-left:115px',
                    defaults:{
                        style:'margin:20px 0px 20px 25px'
                    },
                    items:[
                        {xtype:'radiofield',inputValue:'S',boxLabel:'Started',checked:true, name:'status'},
                        {xtype:'radiofield',inputValue:'F',boxLabel:'Finished', name:'status'},
                        {xtype:'radiofield',inputValue:'P',boxLabel:'Pending', name:'status'},
                        {xtype:'radiofield',inputValue:'C',boxLabel:'Cancel', name:'status'}
                    ]

				}
            ]
        }
    ],
	buttons:[
         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	]
});

