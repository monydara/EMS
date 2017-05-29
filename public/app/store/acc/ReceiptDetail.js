Ext.define('ExtDesktop.store.acc.ReceiptDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:true,

    model: 'ExtDesktop.model.acc.ReceiptDetail',
    proxy: {              
              type: 'rest',
              url:'/AccReceipts/get_detail',                     
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