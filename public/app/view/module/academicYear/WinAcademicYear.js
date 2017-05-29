Ext.define('ExtDesktop.view.module.academicYear.WinAcademicYear', {
    extend: 'Ext.window.Window',
    alias: 'widget.FmAcademicYear',
    title: 'AcademicYear',
    modal:'true',
    layout:'fit',    
    items:[
                {
                	xtype:'form',
                    bodyPadding:20,
                    defaults:{width:450,height:30},
                    fieldDefaults: {
                        labelWidth: 125
                    },
                    items:  [
                             {
								  	xtype:'textfield',
								  	name:'code',
                                    maxLength:6,
								    emptyText:'Enter code',
								    fieldLabel:'Code'
							  },{
							       xtype:'textfield',
							       name:'name',
                                   maxLength:50,
							       emptyText:'Enter academic year',
							       fieldLabel:'Academic Year'
							  },{
								    xtype: 'datefield',
							        fieldLabel: 'Start Date',
							        name: 'start_date',
							        value: new Date(),
							        submitFormat: 'Y-m-d',
							        format: 'd-M-Y'
							        
							  },{
								    xtype: 'datefield',
							        fieldLabel: 'End Date',
							        name: 'end_date',
							        value: new Date(),
							        format: 'd-M-Y',
							        submitFormat: 'Y-m-d'
							  }
                            ]
                }
        ],
    buttons:[
             {text:'<b>Save</b>',action:'save',iconCls:'icon-save'},
             {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
    ],
});