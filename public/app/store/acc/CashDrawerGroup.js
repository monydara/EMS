Ext.define('ExtDesktop.store.acc.CashDrawerGroup', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.acc.CashDrawerGroup',
     proxy: {
        		type: 'rest',
        		url:'/acc_cash_drawer_groups',
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
