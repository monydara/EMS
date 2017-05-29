Ext.define('ExtDesktop.store.sdn.FeeCharge', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.sdn.FeeCharge',
    proxy: {              
              type: 'rest',
              url:'/s',                     
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