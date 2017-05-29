Ext.define('ExtDesktop.store.acc.AccountMaster', {
	extend: 'Ext.data.Store',
	autoLoad: false,
	model: 'ExtDesktop.model.acc.AccountMaster',
	queryMode: 'local',
	// controllerLoad: false,
	proxy: {
		type: 'rest',
		url: '/acc_account_masters',
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
