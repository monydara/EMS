Ext.define('ExtDesktop.store.acc.PaymentMethodS', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:true,

    model: 'ExtDesktop.model.acc.PaymentMethodM',
    proxy: {              
              type: 'rest',
              url:'/acc_payment_methods',                     
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