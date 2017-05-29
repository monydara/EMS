Ext.define('ExtDesktop.view.module.cashDrawerManager.WinCashDrawerManager', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmClass',
	title: 'Class',
	modal:'true',
	height:400,
	width:500,
	items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:450},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:[
								  {
									  	 xtype:'textfield',
									  	name:'className',
									    emptyText:'-- Class name --',
									    fieldLabel:'Class Name'
								  },{
			                                xtype:'combo',
			                                fieldLabel:'Course',
			                                emptyText:'Select course....',
			                                valueField:'courseId',
			                                displayField:'courseName',
			                                name:'course',
			                                store:'Course',
			                                listeners:Util.firstSelect()
			                               
								  },{
									  	xtype: 'timefield',
							            name: 'startTime',
							            fieldLabel: 'Time In',
							            minValue: '6:00 AM',
							            maxValue: '8:00 PM',
							            increment: 15,
							            anchor: '100%'
								  },{
		                                xtype:'combo',
		                                fieldLabel:'Session',
		                                emptyText:'Select session....',
		                                valueField:'id',
		                                displayField:'name',
		                                name:'session',
		                                store:'lookup.Sessions',
		                                listeners:Util.firstSelect()
								  },{
		                                xtype:'combo',
		                                fieldLabel:'Class room',
		                                emptyText:'Select class room....',
		                                valueField:'id',
		                                displayField:'name',
		                                name:'classRoom',
		                                store:'RoomS', 
		                                listeners:Util.firstSelect()
								  },{
									    xtype: 'datefield',
								        fieldLabel: 'Start Date',
								        name: 'startDate',
								        value: new Date(),
								 
								  },{
									    xtype: 'datefield',
								        fieldLabel: 'End Date',
								        name: 'endDate',
								        value: new Date(),
								 
								  },{
									  	 	xtype:'textarea',
										  	name:'description',
										   // emptyText:'-- Class name --',
										    fieldLabel:'Description'
								  }
                    ]
                }
        ],
	buttons:[
	         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
	         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

