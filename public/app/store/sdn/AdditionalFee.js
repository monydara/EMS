Ext.define('ExtDesktop.store.sdn.AdditionalFee', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    controllerLoad:false,
    model: 'ExtDesktop.model.sdn.AdditionalFee',
    proxy: {              
              type: 'rest',
              url:'/SdnAdmission/get_additional_charge',                     
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