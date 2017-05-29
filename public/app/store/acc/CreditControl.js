Ext.define('ExtDesktop.store.acc.CreditControl', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.CreditControl',
    ControllerLoad:false,
     proxy: {
        		type: 'rest',
        		url:'/acc_credit_controls',
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
