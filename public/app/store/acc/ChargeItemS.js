Ext.define('ExtDesktop.store.acc.ChargeItemS', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.acc.ChargeItemM',   

    // model: 'ExtDesktop.model.CashTran',
    proxy: {              
              type: 'rest',
              url:'/acc_charge_items',                     
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