Ext.define('ExtDesktop.view.module.subject.WinSubject',{
	extend: 'Ext.window.Window',
	alias: 'widget.FrmSubject',
	title: 'Subject',
	modal:'true',
	items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:400,allowBlank:false},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:[
                           	{
                                 xtype:'textfield',
                                 name:'code',
                                 emptyText:'Enter subject code',
                                 maxLength:6,
                                 fieldLabel:'Code'
                           	},{
                                xtype:'textfield',
                                name:'name',
                                maxLength:50,
                                emptyText:'Enter subject name',
                                fieldLabel:'Subject'
                            },{
                                xtype:'textfield',
                                name:'khr_name',
                                maxLength:50,
                                fieldLabel:'មុខវិជ្ជា',
                                emptyText: 'ឈ្មោះមុខវិជ្ជា'
                            },{
                                xtype:'combo',
                                fieldLabel:'Type',
                                emptyText:'Select Subject type....',
                                valueField:'id',
                                displayField:'name',
                                listeners:Util.firstSelect(),
                                name:'subject_type_id',
                                store:'SubjectType'
                            },{
                                xtype:'numberfield',
                                name:'credit',
                                fieldLabel:'Total Credit',
                                minValue: 0,
                                value:1
                            },{
                                xtype:'numberfield',
                                name:'sessions',
                                fieldLabel:'Total Sessions',
                                minValue: 0,
                                value:15
                            },
                            {
                              	xtype:'textarea',
                              	name:'description',
                                maxLength:250,
                                emptyText:'Description',
                                fieldLabel:'Description',
                                allowBlank:true
                            }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

