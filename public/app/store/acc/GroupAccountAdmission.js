Ext.define('ExtDesktop.store.acc.GroupAccountAdmission', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    controller: true,
    model: 'ExtDesktop.model.admission.Admission',
    proxy: {
        type: 'rest',
        url: '/AccAccountMasters/get_admission_by_group_account',

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