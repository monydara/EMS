Ext.define('ExtDesktop.store.sdn.DiscountItem', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    controllerLoad:false, 
    model: 'ExtDesktop.model.sdn.DiscountItem',
    proxy: {              
              type: 'rest',
              url:'/SdnAdmission/get_discount',                     
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