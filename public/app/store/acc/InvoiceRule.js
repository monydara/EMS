Ext.define('ExtDesktop.store.acc.InvoiceRule', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.acc.InvoiceRule',
    controllerLoad:false,
     proxy: {
        		type: 'rest',
        		url:'/acc_invoice_rule',
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
