Ext.define('ExtDesktop.store.FinanceTran', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    data:[
{id:1 , credit:300 , receiptNo:'00001', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:2 , credit:300 , receiptNo:'00002', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:3 , credit:300 , receiptNo:'00003', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:4 , credit:300 , receiptNo:'00004', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:5 , credit:300 , receiptNo:'00005', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:6 , credit:300 , receiptNo:'00006', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
{id:7 , credit:300 , receiptNo:'00007', tranDate:'2014-Jan-01', referenceNo: '123683635', remark:''},
        ],
    model: 'ExtDesktop.model.FinanceTran',
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