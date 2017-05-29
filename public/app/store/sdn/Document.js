Ext.define('ExtDesktop.store.sdn.Document', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    controllerLoad:false, 
    model: 'ExtDesktop.model.sdn.Document',
    proxy: {              
              type: 'rest',
              url:'/SdnStudent/getDocument',                     
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