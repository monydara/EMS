Ext.define('ExtDesktop.store.sdn.StudentMovement', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.sdn.StudentMovement',
    proxy: {
              type: 'rest',
              url:'/sdn_status_logs',
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
