Ext.define('ExtDesktop.store.acc.InvoiceDetail', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.acc.InvoiceDetail',
    controllerLoad:false,
     proxy: {
        		type: 'rest',
        		url:'/acc_invoices',
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
