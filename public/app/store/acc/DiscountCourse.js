Ext.define('ExtDesktop.store.acc.DiscountCourse', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.acc.DiscountCourse',
    queryMode:'local',
    controllerLoad:false,
     proxy: {
        		type: 'rest',
        		url:'/AccDiscountItems/getDiscountCourseDetail',
		        reader: {
		            type: 'json',
		            root: 'data',
		            successProperty: 'success'
		        },
		        writer: {
		        	getRecordData: function(record) {
        				return { data: record.data };
        			}
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
