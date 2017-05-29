Ext.define('ExtDesktop.store.acc.FeePlanWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    controllerLoad:false, 
    model: 'ExtDesktop.model.acc.FeePlan',   
    proxy: {              
              type: 'rest',
              url:'/acc_fee_plans', 
              extraParams:{
                  plan_type:'TC' 
              },                       
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