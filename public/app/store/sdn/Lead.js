Ext.define('ExtDesktop.store.sdn.Lead', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'ExtDesktop.model.sdn.Lead',
    proxy: {
              type: 'rest',
              url:'/sdn_lead',
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
                      Util.sessionTimeOut(response.responseText)

                      // Ext.MessageBox.show(
                      // {
                      //     title : 'REMOTE EXCEPTION',
                      //     msg : operation.getError(),
                      //     icon : Ext.MessageBox.ERROR,
                      //     buttons : Ext.Msg.OK
                      // });
                  }
              }
      }
});
