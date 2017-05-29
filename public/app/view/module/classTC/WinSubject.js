Ext.define('ExtDesktop.view.module.classTC.WinSubject', {
	extend: 'Ext.window.Window',
	alias: 'widget.WinAddSubject',
	title: 'Subject Form',
	modal:'true',
	// height:600 ,
	items:[
        {
            xtype:'form',
            bodyPadding:20,
            defaults: { 
            	labelWidth: 115,
            	width:350, 
            	allowBlank:false
            },
            // layout:{ type:'table',columns:2,tdAttrs:{valign:'top'}},
            items:[
            	{
            		xtype:'combo',
            		name:'subject_id',
            		store:'combo.Subject',
            		valueField:'id',
            		displayField:'name',
                    queryMode:'local',
            		fieldLabel:'Subject'
            	},{
            		xtype:'combo',
            		name:'lecture_id',
            		valueField:'id',
            		displayField:'name',
            		store:'combo.Lecturer',
            		fieldLabel:'Leturer'
            	},{
            		xtype:'numberfield',
            		name:'total_session',
            		fieldLabel:'Total Session',
            		minValue: 0 , 
            		value: 0
            	},{
            		xtype:'numberfield',
            		name:'pass_score',
            		fieldLabel:'Pass Score',
            		minValue:0 , 
            		value:0 
            	},{
            		xtype:'numberfield',
            		name:'max_score',
            		fieldLabel:'Max Score',
            		minValue:0 ,
            		value: 0
            	}
            ]
        }
    ],
	buttons:[
         {text:'<b>Save</b>',action:'save',iconCls:'icon-save',formBind:true,type:"submit"},
         {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
	],
        	
});

