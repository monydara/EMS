Ext.define('ExtDesktop.store.acc.ChargeItemTypeS', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.acc.ChargeItemTypeM',   

    // model: 'ExtDesktop.model.CashTran',
    proxy: {              
              type: 'rest',
              url:'/acc_charge_item_types',                     
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