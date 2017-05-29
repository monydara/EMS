Ext.define('ExtDesktop.store.acc.BatchProcess', {
	extend: 'Ext.data.Store',
	autoLoad: false,
	model: 'ExtDesktop.model.acc.BatchProcess',
	queryMode: 'local',
	// controllerLoad: false,
	proxy: {
		type: 'rest',
		url: '/acc_batch_process',
		reader: {
			type: 'json',
			root: 'data',
			successProperty: 'success'
		},
		writer: {
			getRecordData: function(record) {
				return {
					data: record.data
				};
			}
		},
		listeners: {
			exception: function(proxy, response, operation) {
				Util.sessionTimeOut(response.responseText);
			}
		}
	}

});
