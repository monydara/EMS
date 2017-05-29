Ext.define('ExtDesktop.store.DegreeWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:true,
    model: 'ExtDesktop.model.Degree',
    proxy: {
            type: 'rest',
            url:'/acd_degrees/degreeWU',
            extraParams: {
                type: 'WU'
            },
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