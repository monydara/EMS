Ext.define('ExtDesktop.store.CloseCashDrawer', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    groupField:'groupName',
    data:[

          {id:1, groupName:'Book Payment', course:'English Course', amount:1500},
          {id:2, groupName:'Book Payment', course:'Doctor Degree', amount:2000},
          {id:3, groupName:'Book Payment', course:'Master Degree', amount:3500},
          {id:4, groupName:'Book Payment', course:'Associate Degree', amount:220},
          {id:5, groupName:'Book Payment', course:'Short Course', amount:300},
          {id:6, groupName:'Book Payment', course:'Bachelor Degree', amount:400},
          {id:7, groupName:'Pre-Payment', course:'Admission', amount:500},
          {id:8, groupName:'Pre-Payment', course:'Invoice', amount:700  },
          {id:13, groupName:'Service Charge', course:'Reqeust Transcript', amount:800},
          {id:14, groupName:'Service Charge', course:'Certicate Foundation', amount:700},
          {id:15, groupName:'Service Charge', course:'Supplymentary Exam', amount:600},
          {id:15, groupName:'Credit Note', course:'Wrong Invoice', amount:'-600'},
          {id:15, groupName:'Credit Note', course:'Wrong Discount', amount:'-600'},
          {id:15, groupName:'Write Off', course:'Bad Debt', amount:'-600'},
          {id:15, groupName:'Write Off', course:'Unpaid', amount:'-600'},
          
        ],
    model: 'ExtDesktop.model.CloseCashDrawer',
    proxy:{
 	    	type: 'ajax',
 	    	api:{
 	    		read: 'class/list.action',
 	    		create: 'class/save.action',
 	    		update: 'class/save.action'
 	    	},
 	    	reader: {
	            type: 'json',
	            root: 'data',
	            rootProperty: 'data',
	            totalProperty: 'total',
	            successProperty: 'success',
                messageProperty: 'message',
                getData:function(data){
	            	data=data.data
	                for(i = 0; i < data.length; i++){	                	
	                    data[i].startDate = Ext.Date.format(new Date(data[i].startDate), "Y-m-d");
	                    data[i].endDate = Ext.Date.format(new Date(data[i].endDate), "Y-m-d");
	                    data[i].endDate = Ext.Date.format(new Date(data[i].createdDate), "Y-m-d");
	                }
	               
	                return data;
	            },
	        },
	        actionMethods: {
				create  : 'POST',
			    read    : 'POST',
			    update  : 'POST',
			    //destroy : 'POST'
			},
                writer: {
                        type: 'json',
                        writeAllFields: true,
                        root: 'data',
                        encode: true
	        },
	        listeners : 
                {
                    exception : function(proxy, response, operation) 
                    {
                        Util.sessionTimeOut(response.responseText);
                    }
                }
    }
});