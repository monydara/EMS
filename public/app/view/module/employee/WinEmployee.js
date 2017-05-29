Ext.define('ExtDesktop.view.module.employee.WinEmployee', {
    extend: 'Ext.window.Window',
    alias: 'widget.FrmEmployee',    
    title:'Employee Maintenance',
    width:1040,
    height:580,
    modal:true,
    autoScroll:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
              items:[{
                	  xtype:'form',
                	  name:'mainForm',
            		  items:[
            		         		{
            		         			 xtype:'container',
            					       	 name:'employeeInfo',   
            					       	 layout:'hbox',
            					       	 items:[
            					       	        	this.formFaculty(),
            					       	        	this.imageFaculty()
            					       	 ]
            		         		},
            		         		
            		         
            		         {
                            	 xtype:'tabpanel',
//                            	 border:true,
                            	 layout:'fit',
//                            	 height:280,
                            	 items:[this.tabPersonal(),this.tabContact(),this.tabFamily()
                            	       //, this.tabDocument(),this.tabHistory()
                                 ]
                             }]
                     }]   
        });
        me.callParent(arguments);
    },
    imageFaculty:function(){
    	var img={
    			 xtype:'form',
              	 name:'image',
              	 layout:'hbox',
              	 padding:10,
              	 rowspan:5,
              	 items:[
							{
								xtype:'image',
							 	width:140,
							 	height:130,
								style:'margin-left:55px',
								src:'resources/images/photo/no-picture.gif'
							},{
								  xtype:'filefield',
								  buttonText:'.....',	
								  buttonOnly:true,
								  margin:'margin-top:100px',
								  width:30,
								  name:'image',
								  action:'browe'
							},{
								xtype:'hiddenfield',
								name:'photo_path'
							}]
              	        
    	}
    	return img;
    },
    formFaculty:function(){
     var form=	{
			       	 xtype:'container',
			       	 name:'employeeInfo',   
			       	 padding:10,
			       	 defaults:{labelWidth:85,width:710},
			       	 items:[
			       	        {xtype:'hiddenfield',name:'id'},
			       	        {
			       	        	xtype:'container',
			       	            layout:{
			       	                type:'table',
			       	                columns:2
			       	            },
			       	            defaults:{labelWidth:85,width:350,margin:'0 0 5px 10px'},
			       	            items:[
			       	                   	{
				       	                   	xtype:'combo',
				                            allowBlank:false,
				                            fieldLabel:'Title',
				                            emptyText:'Select....',
				                            valueField:'id',
				                            allowBlank:false,
				                            displayField:'name',
				                            name:'title_id',
				                            store:'lookup.CmbTitle',
				                            listeners:Util.firstSelect()
			       	                   	},{
				                         	xtype:'textfield',
				                         	name:'code',
				                         	maxLength:6 ,
				                         	allowBlank:false,
				                         	fieldLabel:'Code<font color="red">*</font>'
				       	                },{
				       	                	 xtype:'textfield',
				                             fieldLabel:'Name<font color="red">*</font>',
				                             allowBlank:false,
				                             name:'name'
				                        },{
				                             fieldLabel:'ឈ្មោះ',
				                             name:'khr_name',
				                             xtype:'textfield'
				                        },{
				                        	xtype:'combo',
			    						    allowBlank:false,
			    						    fieldLabel:'Gender',
			    						    emptyText:'Select....',
			    						    valueField:'id',
			    						    displayField:'name',
			    						    name:'gender',
			    						    value:'M',
			    						    editable:false,
			    						    store:Ext.create('Ext.data.Store',{
			    						    	fields:['id','name'],
			    						    	data:[
			    						    		{ id:'M' , name:'Male'},
			    						    		{ id: 'F' , name:'Female'}
			    						    	]


			    						    })
			       	                   	},{
				       	                   	 xtype:'datefield',
					                    	 name:'birth_date',
					                    	 value: new Date(),
					                    	 fieldLabel:"Date of Birth:",
					                    	 format:'d-M-Y'
					                    
			       	                   	},{
			       	                   		 xtype:'textfield',
				    			    	     name:'size',
				    			    	     fieldLabel:'Size',
				    			        },{
					    			    	   xtype:'textfield',
					    			    	   name:'height',
					    			    	   fieldLabel:'Height',
				    			        },{
				    			        	xtype:'textfield',
				    			        	name:'id_card_no',
				    			        	fieldLabel:'Identify No.',
				    			        },{
											xtype:'combo',
										    fieldLabel:'National <font style="color:red">*</font>',
										    emptyText:'Select....',
										    valueField:'id',
										    allowBlank:false,
										    queryMode:'local',
										    displayField:'name',
										    name:'national_id',
										    store:'Nationality',
										    listeners:Util.firstSelect(),
				    			       }]
			       	        },{
			       	        	padding:'0 0 0 10px',
			       	        	xtype:'textfield',
			       	        	fieldLabel:'Place of Birth',
			       	        	name:'place_of_birth'
			       	        },{
			       	        	padding:'0 0 0 10px',
			       	        	xtype:'textfield',
     	        	    	    name:'description',
     	        	    	    fieldLabel:'Description',
     	        	    	    //height: 120
			       	        },{
			       	        		xtype	:'fieldset',
				       	        	title	:'Status',
				       	        	//margin	:'0 0 0 10px',
				       	        	//padding	:'0 0 0 10px',
				       	        	items:[{
				       	        	    	xtype: 'radiogroup',
										    vertical: true,
										    items: [
										            	{boxLabel: 'Probation',padding:'0px 0px 0px 5px', name: 'status', inputValue:'PB',checked:true},
										            	{boxLabel: 'Permanence',padding:'0px 0px 0px 5px', name: 'status', inputValue:'PN'},
										            	{boxLabel: 'Resigned',padding:'0px 0px 0px 5px', name: 'status', inputValue:'RS'},
										            	{boxLabel: 'Suspend',padding:'0px 0px 0px 5px', name: 'status', inputValue:'SP'},
										            	{boxLabel: 'Drop',padding:'0px 0px 0px 5px', name: 'status', inputValue:'DP'}
										    ]
				       	        	       
				       	        	       }]
     	        	    	    
			       	        }]
       	}
    	return form;
    },
    
    tabFamily:function(){
    	var family={
    			xtype:'panel',
    			title: 'Family Info',
    			bodyPadding:10,
    			defaults:{labelWidth:120,width:400,margin:'0 10px 5px 0'},
   	            items:[
   	                   	{
   	                   		xtype:'fieldset',
		       	        	title:'Marital Status',
		       	        	items:[{
		       	        	    	 xtype: 'radiogroup',
								     items: [
						            	{boxLabel: 'Single',padding:'0px 0px 0px 20px', name: 'marital_status', inputValue: 'S',checked:true},
						            	{boxLabel: 'Married',padding:'0px 0px 0px 20px', name: 'marital_status', inputValue: 'M'},
						            	{boxLabel: 'Widow',padding:'0px 0px 0px 20px', name: 'marital_status', inputValue: 'W'},
						            	]
		       	        	       }]
                   			},{
	   	                   	 	xtype:'textfield',
	 	                	    name:'spouse_name',
	 	                	    fieldLabel:'Spouse Name'
	 	                   },{
	 	                	   xtype:'numberfield',
	 	                	   name:'no_of_child',
	 	                	   fieldLabel:'Num. Of Children',
	 	                	   value: 0
	 	                   },{
	 	                	   xtype:'numberfield',
	 	                	   name:'studied_child',
	 	                	   fieldLabel:'Child Study',
	 	                	   value:0
   	                   	}
   	            ]
    	}
    	
    	return family
    },
    tabPersonal:function(){
    	var personal={
		    			xtype:'panel',
		    			title: 'Employee Info',
		    			bodyPadding:20,
		    			layout:{
		   	                type:'table',
		   	                columns:3
		   	            },
		   	            defaults:{labelWidth:100,width:310,margin:'0 10px 5px 0'},
		    			items:[
		    			       
		    			       {
		    			    	   	xtype		:	'combo',
								    fieldLabel	:	'Type <font style="color:red">*</font>',
								    emptyText	:	'Select....',
								    valueField	:	'id',
								    allowBlank	:	false,
								    displayField:	'name',
								    name		:	'emp_type',
                                   listeners	:	Util.firstSelect(),
								    store		:	Ext.create('Ext.data.Store', {
                                                    fields: ['id', 'name'],
                                                    data: [
                                                            {id: 'L',name: 'Lecturer'},
                                                            {id: 'N',name: 'Normal Staff'}]
                                                })
		    			       },
                            {
                                xtype: 'combo',
                                fieldLabel: 'Level <font style="color:red">*</font>',
                                emptyText: 'Select....',
                                valueField: 'id',
                                allowBlank: false,
                                displayField: 'emp_level',
                                queryMode:'local',
                                name: 'emp_level_id',
                                store: 'combo.EmployeeLevel',
                                listeners: Util.firstSelect()
                            },{
                                xtype		:	'combo',
                                fieldLabel	:	'Working Time <font style="color:red">*</font>',
                                emptyText	:	'Select....',
                                valueField	:	'id',
                                allowBlank	:	false,
                                displayField:	'name',
                                name		:	'working_time',
                                listeners	:	Util.firstSelect(),
                                store		:	Ext.create('Ext.data.Store', {
                                fields      : ['id', 'name'],
                                data        : [
                                                {id: 'FT',name: 'Full Time'},
                                                {id: 'PT',name: 'Part Time'}]
                                })
		    			    },{
		    			    		xtype		:	'combo',
								    fieldLabel	:	'Shift <font style="color:red">*</font>',
								    emptyText	:	'Select....',
								    valueField	:	'id',
								    allowBlank	:	false,
								    displayField:	'shift_name',
								    name		:	'shift_id',
								    store		:	'Shift',
								    listeners	:	Util.firstSelect()
		    			       },{
		    			    	    xtype		:	'numberfield',
							        name		:	'basic_salary',
							        fieldLabel	:	'Basic Salary',
							        value		: 	0,
							        allowBlank	:	false
		    			       },{
		    			    	     xtype:'datefield',
			                    	 name:'hire_date',
			                    	 value: new Date(),
			                    	 fieldLabel:"Hire Date",
			                    	 format:'d-M-Y'
		    			       },{
									xtype:'combo',
								    fieldLabel:'Position <font style="color:red">*</font>',
								    emptyText:'Select....',
								    valueField:'id',
								    allowBlank:false,
								    displayField:'position',
								    name:'position_id',
								    store:'Position',
								    listeners:Util.firstSelect(),
								},{
								    xtype:'combo',
								    fieldLabel:'Department <font style="color:red">*</font>',
								    emptyText:'Select....',
								    valueField:'id',
								    allowBlank:false,
								    displayField:'department',
								    name:'department_id',
								    store:'Department',
								    listeners:Util.firstSelect(),
								
								},{
									xtype:'combo',
								    fieldLabel:'Ethicity <font style="color:red">*</font>',
								    emptyText:'Select....',
								    valueField:'id',
								    allowBlank:false,
								    displayField:'name',
								    name:'ethnicity_id',
								    queryMode:'local',
								    store:'Ethnicity',
								    listeners:Util.firstSelect(),
								},{
									xtype:'combo',
								    fieldLabel:'Language <font style="color:red">*</font>',
								    emptyText:'Select....',
								    valueField:'id',
								    allowBlank:false,
								    displayField:'name',
								    name:'langauge_id',
								    store:'Langauge',
								    queryMode:'local',
								    listeners:Util.firstSelect(),
								},{
									xtype:'combo',
								    fieldLabel:'Religion <font style="color:red">*</font>',
								    emptyText:'Select....',
								    valueField:'id',
								    allowBlank:false,
								    displayField:'name',
								    name:'religion_id',
								    store:'Religion',
								    listeners:Util.firstSelect(),
		    			       }
		    			]
    	}
    	return personal
    },
    
    tabContact: function(){
    	var contact={
    			xtype:'form',
    			name:'contact',
    			title: 'Contact Info',
    			bodyPadding:10,
    			layout:{
   	                type:'table',
   	                columns:3
   	            },
   	             defaults:{labelWidth:100,width:320,margin:'0 10px 5px 0'},
   	             items:[
   	                    
							{
								   xtype:'textfield',
								   name:'phone_no',
								   fieldLabel:'Phone No.'
							},{
								   xtype:'textfield',
								   name:'email',
								   fieldLabel:'Email'
							},{
								   xtype:'textfield',
								   name:'house_no',
								   fieldLabel:'House No.',
							},{
								   xtype:'textfield',
								   name:'street_no',
								   fieldLabel:'Street No.'
							},{
								   xtype:'textfield',
								   name:'group_no',
								   fieldLabel:'Group No.',
							},{
								   xtype:'textfield',
								   name:'village',
								   fieldLabel:'Village'
							},{
								   xtype:'textfield',
								   name:'commune',
								   fieldLabel:'Commune'
							},{
								   xtype:'textfield',
								   name:'district',
								   fieldLabel:'District'
							},{
								   xtype:'textfield',
								   name:'city',
								   fieldLabel:'City'
							},{
								   xtype:'textfield',
								   name:'country',
								   fieldLabel:'Country'
							}
   	             ]
    	}
    	return contact;
    },
    tabHistory: function(){
    	var history={
    					xtype		:	'grid',
    					title		: 	'History',
    					name		: 	'gridHistory',
    					autoScroll	:	true,
    					columnLines	:	true, 
    					columns		:	[
    					    {
    					    	 xtype:'rownumberer',
    					    	 text:'No.',
    					    	 align:'center',
    					    	 width:50
    					    },{
    					    	 dataIndex: 'newDesc',
    					    	 text: 'New Desc.',
    					    	 flex: 1
    					    },{
	   					    	 dataIndex: 'oldDesc',
	   					    	 text: 'Old Desc.',
	   					    	 flex: 1
    					    },{
    					    	dataIndex: 'empHisType',
    					    	text: 'Type',
    					    	width:120
    					    },{
    					    	dataIndex: 'user',
    					    	text: 'Done By',
    					    	width:140
    					    },{
    					    	dataIndex: 'createdDate',
    					    	text: 'Date',
    					    	width:120
    					    }
    					]
    	}
    	
    	return history;
    	
    },
    
    tabDocument:function(){
    	var document={
    			xtype		:	'grid',
    			title		: 	'Document',
    			name		: 	'gridDocument',
    			autoScroll	:	true,
    			columnLines	:	true,
    			tbar		: [
    			    		   	'->',{
    			    		   				text:'Attachment',
    			    		   				action:'Attachment',
    			    		   				iconCls:'icon-add'
							  }],
				// store:'employee.Document',
    			columns		:	[
		    			   {
			                    xtype:'rownumberer',
			                    text:'No.',
			                    align:'center',
			                    width:50
		                   },{
		                	    dataIndex: 'name',
		                	    text: 'Description',
		                	    flex: 1
		                   },{
		                	    dataIndex: 'fileName',
		                	    text: 'File Name',
		                	    flex: 1
		                   },{
		                	    dataIndex	: 'fileSize',
	                	        text		: 'File Size(KB)',
	                	        width		:	120
		                   },{
		                	    dataIndex	: 'uploadBy',
		                	    text		: 'Upload By',
		                	    width		: 120
		                   },{
		                	   dataIndex	: 'uploadDate',
		                	   text			: 'Upload Date',
		                	   width		: 120
		                   }]
    	}
    	
    	return document;
    	
    },
    
    buttons:[{
		            text:'Save',
		            iconCls:'icon-save',
		            action:'Save'
		        },{
		            text:'Cancel',
		            iconCls:'icon-cancel',
		            action:'Cancel'
		        }]
   

});