Ext.define('ExtDesktop.view.module.tuitionFee.WinPlanTC', {
    extend: 'Ext.window.Window',
    alias: 'widget.tuitionFeeWinPlanTC',
    title:'Plan TC Form',
    bodyPadding:20 ,     
    modal:true,
    items:{
    	xtype:'form',     	
	    defaults:{
	    	width: 400 , 
	    	
	    	allowBlank:false 
	    },
	    defaultType: 'textfield',
	    items:[
	    	{
	    		xtype:'hiddenfield',
	    		name:'tuition_time_id'
	    	},{
	    		xtype:'hiddenfield',
	    		name:'plan_cat_id'
	    	},
	    	{
	    		fieldLabel: 'Tuition Time',
	    		name:'tuition_time_name',
	    		readOnly:true,
	    	},{
	    		fieldLabel:'Plan Code'+ redStar, 
	    		name: 'plan_code'

	    	},{
	    		fieldLabel:'Plan Name'+redStar,
	    		name:'plan_name'
	    	},{
    		  	xtype:'combo',
                name:'degree_id',
                store:'combo.DegreeTC',
                queryMode:'local',
                valueField:'id',
                displayField:'name',
                editable:false,
                fieldLabel:'Degree'+redStar
	    	},{
	    		xtype:'combo',
				fieldLabel:'Course'+redStar,
				name:'course_id',
				valueField:'id',
                queryMode:'local',
				store:'combo.CourseTC',
				editable:false,
				displayField:'name'
	    	},{
	    		xtype: 'textarea',
	    		name:'description', 
	    		fieldLabel: 'Description',
	    		allowBlank:true
	    	},{
	    		xtype:'container',
	    		layout:'hbox',
	    		border:false , 
	    		items:[
	    			{
	    				xtype:'radiofield',
	    				name:'is_active',
	    				inputValue:1 , 
	    				boxLabel:"Active",
	    				fieldLabel: "Status",
	    				checked:true
	    			},{
	    				xtype:'radiofield',
	    				name:'is_active',
	    				inputValue: 0 ,
	    				boxLabel: "Deactive",
	    				style: "margin-left: 10px "
	    			}
	    		]
	    	}
	    ], 
    },
    buttons:[
    	{
    		xtype:'button', 
    		action:'Save',
    		iconCls:'icon-save',
    		text:'Save'
    	},{
    		xtype:"button",    		
    		text:'Cancel',
    		iconCls:'icon-cancel',
    		handler:function(){
    			this.up("window").close();
    		}
    	}
    ]


})