Ext.define('ExtDesktop.store.acc.CashTran', {
    extend : 'Ext.data.Store',
    queryMode : 'local',
    autoLoad    :false,
    model: 'ExtDesktop.model.CashTran',
    proxy: {              
              type: 'rest',
              url:'/acc_cash_drawer_trans',                     
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