Ext.define('ExtDesktop.store.combo.FeeCatDetailTC', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    // controllerLoad:false, 
    model: 'ExtDesktop.model.acc.FeeCatDetailTC',   
    proxy: {              
              type: 'rest',
             
              url:'/AccFeeCatDetailTc/combo',                     
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