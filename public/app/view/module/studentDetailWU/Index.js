Ext.define('ExtDesktop.view.module.studentDetailWU.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.studentDetailWUGrid',
    collapsible: false,
    store: 'admissionWU.Admission',
    title:'Student WU Detail List',
    closable:true,
    initComponent: function() {
     var me = this;

        Ext.applyIf(me, {
            tbar:[
                  {
                	 xtype:'container',
                	 width:'100%',
                	 items:[
                	        {
                	        	xtype:'form',
                	        	hidden:true,
                	        	style:'border-bottom:2px solid rgb(0, 100, 255); ',
                	        	items:[{
                	        		xtype:'fieldset',
                	        		title:'<b>Advance Search:</b>',
                	        		layout:{type:'table',columns:4},                	        	
                    	        	defaults:{labelAlign:'right',width:300},
                    	        	items:[
                    	        	       {xtype:'datefield',labelWidth:60,fieldLabel:'From',name:'startDate',emptyText:'Start Date'},                    	        	       
                    	        	       {xtype:'combo',emptyText:'Category',name:'category',store:'StudentCategory', valueField:'studentCatId',displayField:'category',},
                    	        	       {xtype:'combo',emptyText:'City',name:'city',store:'City', valueField:'cityId',displayField:'city',},
                    	        	       {xtype:'button',text:'Search',action:'Search',iconCls:'icon-search',width:80,style:'margin-left:10px'},
                    	        	       {xtype:'datefield',labelWidth:60,name:'endDate',fieldLabel:'To',emptyText:'To Date'},
                    	        	       {xtype:'combo',emptyText:'Nationaly',name:'nationality',store:'Nationality',valueField:'nationalityId',displayField:'name'},
                    	        	       {xtype:'combo',emptyText:'Status',name:'status',store:'lookup.Status',  valueField:'id',displayField:'name',},                    	        	      
                    	        	       
                    	        	       ]
                	        	}]
                	        	
                	        },{               	        	
                	        	
                	        	xtype:'panel',
                	        	
                	        	bbar:[
                	        	       {xtype:'textfield',fieldLabel:'Filter',name:'filter',emptyText:'-- Type For Search --',labelWidth:50,width:350,labelAlign:'right'},
                	                   {text:'Advance',action:'AdvanceSearch'},
                	        	       ]
                	        }
                	        ]
                  }
               
            ],
            columns: [
                {header:'No',xtype:'rownumberer',width:50,align:'center'},
                {
                	header:'Image',
                	dataIndex:'photoPath',
                	width:150,
                	align:'center',
                	renderer: function(value,raw ,record){
                        console.log(record.data);
                		var data = raw.record.data;
	            		 return '<img width=140px height=140px src="resources/images/photo/' +data.student.photoPath+ '" />';
	            	},
                },
                {header:'Student Information',dataIndex:'efirstName',width:300,renderer:function(value,raw){
                	var data = raw.record.data;
                	var studentObj = data.student;
                	    	
                	var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:70px;'><b> Name   <br> St. Code <br> St.	No <br>Gender <br>Email <br>Phone <br> Category</b></div>" ;
                	 var infoString =labelDiv+"<div style='display:inline-block; width:200px;'>:"+studentObj.firstName+" "+studentObj.lastName+
                	 				"<br>:"+studentObj.studentCode+
                	 				"<br>:"+studentObj.studentNum+
                	 				"<br>:"+studentObj.genderId.name+
                	 				"<br>:"+studentObj.email+
                	 				"<br>:"+studentObj.phone+
                	 				"<br>:"+studentObj.studentCatId.category+
                	 				"</div></div>";
                	return infoString;
                }},
                {header:'Admission Infomation',dataIndex:'admissionBy',flex:1,renderer:function(value,raw){
                	var data = raw.record.data;
                	
                	
                	var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:105px;'><b> Apply For   <br> Course <br> Session  <br> Term <br> Academic Year</b></div>" ;
                	 var infoString =labelDiv+"<div style='display:inline-block; width:200px;'>:"+data.degree.name+
                	 				"<br>:"+data.course.courseName+
                	 				"<br>:"+data.student.sessionId.name+
                	 				"<br>:"+data.term.description+
                	 				"<br>:"+data.academicYear.name+                	 				
                	 				"</div></div>";
                	return infoString;
                }},
                
                
            ],
            bbar: Ext.create('Ext.PagingToolbar', {
		          store: 'admissionWU.Admission',
		            displayInfo: true,
		            displayMsg: 'View {0} - {1} of {2}',
		            emptyMsg: "View 0"
		        })
        });

        me.callParent(arguments);
    }

});