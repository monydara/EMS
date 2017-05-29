Ext.define('ExtDesktop.store.combo.FeeCatDetailWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    // controllerLoad:false, 
    model: 'ExtDesktop.model.acc.FeeCatDetailWU',   
    proxy: {              
              type: 'rest',
              url:'/AccFeeCatDetailWu/combo',                     
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