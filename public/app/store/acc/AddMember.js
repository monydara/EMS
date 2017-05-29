Ext.define('ExtDesktop.store.acc.AddMember', {
	extend: 'Ext.data.Store',
	autoLoad: false,
	model: 'ExtDesktop.model.User',
	queryMode: 'local',
	controllerLoad: false,
	proxy: {
		type: 'rest',
		url: '/AccCashDrawers/getValidUser',
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
