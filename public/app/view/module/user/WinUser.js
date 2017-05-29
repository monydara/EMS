Ext.define('ExtDesktop.view.module.user.WinUser', {
	extend: 'Ext.window.Window',
	id:'WinUser',
	alias: 'widget.FrmUser',
	title: 'User​ Maintenance',
	modal:'true',
	resizable:false,
	height:600,
	layout:'fit',
	width:880,
	autoShow: false,
	initComponent: function() {
	        var me = this;


	        Ext.applyIf(me,{
	            items:[
						{
							xtype:'panel',
							border:false,
							items:[ this.userForm(),this.userTab()]
						}
	                   ],
	            buttons:[
	                     {text:'Save',action:'Save',iconCls:'icon-save'},
                         {text:'Save & New',action:'SaveNew',iconCls:'icon-save'},
	                     {text:'Cancel',action:'Cancel',iconCls:'icon-cancel'}               
	                 ]
	        });
	        me.callParent(arguments);
	 },
	 userForm:function(){
		 var form={
					 xtype:'form',
					 bodyPadding:10,
	                 items:[
	                        {
	                        	 xtype:'fieldset',
	                             title:'User Detail',
	                             padding:10,
	                             layout:'hbox',
	                             items:[
	                                    {
	                                    	 defaults:{width: 350},
	                                    	 fieldDefaults: {
	                    	                     //labelAlign: 'right',
	                    	                     labelWidth: 125
	                    	                 },
	                                    	items:[
	                                    	       	{
	                                    	       		xtype:'hidden',
	                                    	       		name:'id'
	                                    	       	},
													{
													    xtype:'textfield',
													    fieldLabel:'User Name <font style="color:red">*</font>',
													    name:'user_name',
													    emptyText:'Name...'
													 
													},{
													    xtype:'textfield',
													    fieldLabel:'Address',
													    name:'address',
													    emptyText:'Address...'
													},{
													    xtype:'textfield',
													    fieldLabel:'Phone',
													    name:'phone',
													    emptyText:'Phone...'
													}]
	                                    },{
	                                    	 defaults:{width: 350},
	                                    	 margin:'0px 0px 0px 30px',
	                                    	 items:[{
														    xtype:'textfield',
														    fieldLabel:'Email',
														    name:'email',
														    emptyText:'Email...'
														},{
															xtype:'combo',
														    fieldLabel:'Position <font style="color:#ff0000">*</font>',
														    emptyText:'Select....',
														    valueField:'id',
														    allowBlank:false,
														    displayField:'position',
														    name:'hr_position_id',
														    store:'Position'
														},{
														    xtype:'combo',
														    fieldLabel:'Department <font style="color:#ff0000">*</font>',
														    emptyText:'Select....',
														    valueField:'id',
														    allowBlank:false,
														    displayField:'department',
														    name:'hr_department_id',
														    store:'Department'
													}]
	                                    }]
	                        },{
	                        	
	                        	xtype:'panel',
	                        	layout:'hbox',
	                        	items:[
	                        	       {
	                        	    	 xtype:'fieldset',
	      	                             title:'Login Detail',
	      	                             padding:10,
	      	                             defaults:{width: 350},
                                         fieldDefaults: {labelWidth: 125},
	      	                             items:[{
	      										    xtype:'textfield',
	      										    fieldLabel:'User ID <font style="color:red">*</font>',
	      										    name:'user_id',
	      										    allowBlank:false,
	      										    emptyText:'User ID...'
	      										},{
	      										    xtype:'textfield',
	      										    inputType:'password',
	      										    allowBlank:false,
	      										    fieldLabel:'Password <font style="color:red">*</font>',
	      										    name:'password'
	      										},{
	      										    xtype:'textfield',
	      										    inputType:'password',
	      										    allowBlank:false,
	      										    fieldLabel:'Confirm Password <font style="color:red">*</font>',
	      										    name:'confirmPassword'
                                                },{
                                                	xtype:'button',
                                                	text:'Set New Password',
                                                	action:'setNewPassword', 
                                                	fieldField:' ',
                                                	iconCls:'icon-edit',
                                                	disabled:true
                                                },{
                                                    xtype:'checkbox',
                                                    margin:'0 0 0 125px',
                                                    name:'is_force_pass',
                                                    width: 225,
                                                    boxLabel:'Force Password'
	      										}]
	                        	        },

                                    {
                                                xtype:'container',
                                                defaults:{width: 300},
                                                fieldDefaults: {labelWidth: 150},
                                                margin:'20px 0px 0px 20px',
                                                items:[
                                                        {
                                                            xtype:'combo',
                                                            fieldLabel:'Main Campus<font style="color:red">*</font>',
                                                            emptyText:'Select....',
                                                            valueField:'id',
                                                            allowBlank:false,
                                                            displayField:'campus_name',
                                                            name:'home_campus_id',
                                                            store:'Campus'
                                                        },{
                                                            xtype: 'datefield',
                                                            fieldLabel: 'Start Date',
                                                            name: 'start_date',
                                                            emptyText: 'DD-MM-YYYY',
                                                            format:'d-M-Y',
                                                            allowBlank: false
                                                        },{
                                                            xtype:'textfield',
                                                            fieldLabel:'Last Updated',
                                                            name:'updated_at'
                                                            //readOnly:true
                                                        }, {
                                                            xtype:'combo',
                                                            fieldLabel:'User Type <font style="color:red">*</font>',
                                                            emptyText:'Select....',
                                                            valueField:'id',
                                                            allowBlank:false,
                                                            displayField:'name',
                                                            name:'user_type',
                                                            store:['Staff','Admin']

                                                        }
                                                ]

                                        },

                                    {
	                        	    	   
											    xtype: 'radiogroup',
											    vertical: true,
											    columns: 1,
											    margin:'20px 0px 0px 20px',
											    //width: 300,
											    items: [
											            	{xtype: 'component', html: 'Status', cls:'x-form-check-group-label'},
											            	{boxLabel: 'Active',padding:'0px 0px 0px 20px', name: 'status_id', inputValue: 29,checked:true},
											            	{boxLabel: 'Lock',padding:'0px 0px 0px 20px', name: 'status_id', inputValue: 30},
											            	{boxLabel: 'Suspend',padding:'0px 0px 0px 20px', name: 'status_id', inputValue: 31},
											            	{boxLabel: 'Disable',padding:'0px 0px 0px 20px', name: 'status_id', inputValue: 32}
											    ]
	                        	       }]
	                        }]
		 }

		 return form;
	 },
	 //End User Form
	 
	 userTab:function(){
		 var usertab={
						 xtype:'tabpanel',
						 height:200,
						 items:[
						         this.tabRole(),
						         this.tabLocation(),
						         this.tabDegree()
						        ]
		 			}
		 return usertab;
	 },
	 
	 tabRole:function(){
		var roletab={
                        title:'Roles',
                        xtype:'panel',
                        items:[{
                                    xtype: 'grid',
                                    autoScroll:true,
                                    store: 'UserRoles',
                                    border:false,
                                    name:'GridUserRoles',
                                    columnLines :  true ,
                                    height: 170,
                                    tbar:[
                                        '->',
                                        {
                                            xtype:'button',
                                            iconCls:'icon-add',
                                            tooltip:'Add role to user',
                                            action:'addRole'
                                        },{
                                            xtype:'button',
                                            iconCls:'icon-delete',
                                            tooltip:'Remove Role from user',
                                            action:'removeRole'
                                        }
                                    ],
                                    viewConfig: {
                                        getRowClass: function(record, id) {
                                            return record.get("_destroy") == true ? "hidden" : "row-error";
                                        }
                                    },
                                    columns:[
                                                {text:'ID',hidden:true,dataIndex:'id'},
                                                {xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                                {dataIndex :'role_id',hidden:true},
                                                {dataIndex :'user_id',hidden:true},
                                                {text:'Name',dataIndex:'name',flex:1}
                                    ]
                        }]
		} 
		return roletab;
	 },
	 
	 tabLocation:function(){
		 var location={
				 title:'Location',
                 xtype:'panel',    
                 items:[{
                             xtype: 'grid',
                             autoScroll:true,
                             store: 'UserLocations',
                             name:'UserLocation',
                             border:false,
                             columnLines :  true ,
                             viewConfig: {
                                 getRowClass: function(record, id) {
                                     return record.get("_destroy") == true ? "hidden" : "row-error";
                                 }
                             },
                             tbar:[
                                       '->',
                                     {
                                         xtype:'button',
                                         iconCls:'icon-add',
                                         tooltip:'Add location to user',
                                         action:'addLocation'
                                     },{
                                         xtype:'button',
                                         iconCls:'icon-delete',
                                         tooltip:'Remove location from user',
                                         action:'removeLocation'
                                     }
                             ],
                             columns:[
		                                {text:'id',hidden:true,dataIndex:'id'},
                                        { xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                        {dataIndex:'campus_id',hidden:true},
                                        {dataIndex:'user_id',hidden:true},
		                                {text:'Name',dataIndex:'name',flex:1}
                             ]
                 }]
		 }
		 return location;
	 },
	 
	 tabDegree:function(){
		 var degree={
				 title:'Degree',
                 xtype:'panel',
                 //layout:'fit',
                 items:[{
                             xtype: 'grid',
                             store: 'UserDegrees',
                             name:'UserDegrees',
                             border:false,
                             columnLines :  true ,
                             tbar:[
                                 '->',
                                 {
                                     xtype:'button',
                                     iconCls:'icon-add',
                                     tooltip:'Add degree to user',
                                     action:'addDegree'
                                 },{
                                     xtype:'button',
                                     iconCls:'icon-delete',
                                     tooltip:'Remove degree from user',
                                     action:'removeDegree'
                                 }
                             ],
                             viewConfig: {
                                 getRowClass: function(record, id) {
                                     return record.get("_destroy") == true ? "hidden" : "row-error";
                                 }
                             },
                             columns:[

		                                {text:'ID',hidden:true,dataIndex:'id'},
		                                {hidden:true,dataIndex:'degree_id'},
		                                {hidden:true,dataIndex:'user_id'},
                                        {xtype:'rownumberer',text  :'No.',align :'center',width :50},
		                                {text:'Name',dataIndex:'name',flex:1}]
                 }]
		 }
		 return degree;
	 }

});

