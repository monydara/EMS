Ext.define('ExtDesktop.view.module.registration.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.registrationGrid',
    collapsible: false,
    store: 'Student',
    title:'Registration List',
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
                	        	style:'border-bottom:2px solid blue; ',
                	        	items:[{
                	        		xtype:'fieldset',
                	        		title:'<b>Advance Search:</b>',
                	        		layout:{type:'table',columns:4},                	        	
//                    	        	border:false,
                    	        	defaults:{labelAlign:'right',width:300},
                    	        	items:[
                    	        	       {xtype:'datefield',labelWidth:60,fieldLabel:'From',name:'startDate'},                    	        	       
                    	        	       {xtype:'combo',emptyText:'Category',name:'category',store:'StudentCategory', valueField:'studentCatId',displayField:'category',},
                    	        	       {xtype:'combo',emptyText:'City',name:'city',store:'City', valueField:'cityId',displayField:'city',},
                    	        	       {xtype:'button',text:'Search',action:'Search',iconCls:'icon-search',width:80,style:'margin-left:10px'},
                    	        	       {xtype:'datefield',labelWidth:60,name:'endDate',fieldLabel:'To'},
                    	        	       {xtype:'combo',emptyText:'Nationaly',name:'nationality',store:'Nationality',valueField:'nationalityId',displayField:'name'},
                    	        	       {xtype:'combo',emptyText:'Status',name:'status',store:'lookup.Status',  valueField:'id',displayField:'name',},                    	        	      
                    	        	       
                    	        	       ]
                	        	}]
                	        	
                	        },{               	        	
                	        	
                	        	xtype:'panel',
                	        	
                	        	bbar:[
                	        	       {xtype:'textfield',fieldLabel:'Filter',name:'filter',emptyText:'-- Type For Search --',labelWidth:50,width:350,labelAlign:'right'},
//                	                   {text:'Advance',action:'AdvanceSearch'}
                	        	       '->',
                	                   {text:'Create',action:'New',iconCls:'icon-add'},
                	                   {text:'Edit',action:'Edit',iconCls:'icon-edit'},
                	                   // {text:'Deposit',action:'Deposit',iconCls:'icon-deposit'},
                	                   {text:"Cancel",action:'Cancel',iconCls:'icon-cancel'}
                	        	       ]
                	        }
                	        ]
                  }
               
            ],
            columns: [
                {header:'No',xtype:'rownumberer',width:50,align:'center'},
                {header:'Name',dataIndex:'efirstName',renderer:function(value,raw){
                	var data = raw.record.data;
                	
                	return data.firstName+' '+data.lastName;
                }},
                {header:'ឈ្មោះ',dataIndex:'klastName',renderer:function(value,raw){
                	var data = raw.record.data;
                	
                	return data.firstNameKHR+' '+data.lastNameKHR;
                }},
                {header:'Gender',dataIndex:'genderId',renderer:function(obj){return obj.name}},
                {header:'Address',flex:1,dataIndex:'address'},
                {header:'Phone',dataIndex:'phone'},
                {header:'Email',dataIndex:'email'},                
                {header:'Category',dataIndex:'studentCatId',renderer:function(obj){return obj.category}},
                {header:'Course',dataIndex:'courseId',width:160,renderer:function(obj){return obj.courseName}},
                {header:'Status' , dataIndex:'statusId',
                	renderer:function(obj){
                		return obj.name;
                	}
                },
                {xtype:'datecolumn',header:'Register',width:160,dataIndex:'registeredDate',
                	renderer:function(obj){ 
                		
                		var newDate = Util.parseDate(obj);
                		
                		return  newDate;
                }},
                
            ],
            bbar: Ext.create('Ext.PagingToolbar', {
		          store: 'Student',
		            displayInfo: true,
		            displayMsg: 'View {0} - {1} of {2}',
		            emptyMsg: "View 0"
		        })
        });

        me.callParent(arguments);
    }

});