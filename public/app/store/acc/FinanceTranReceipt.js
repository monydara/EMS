Ext.define('ExtDesktop.store.acc.FinanceTranReceipt', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:true,

    model: 'ExtDesktop.model.acc.FinanceTranReceiptM',
    proxy: {              
              type: 'rest',
              url:'/acc_receipts',                     
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