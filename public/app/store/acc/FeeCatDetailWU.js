Ext.define('ExtDesktop.store.acc.FeeCatDetailWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    // controllerLoad:false, 
    model: 'ExtDesktop.model.acc.FeeCatDetailWU',   
    proxy: {              
              type: 'rest',
              url:'/acc_fee_cat_detail_wu',                     
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