Ext.define('ExtDesktop.store.admission.Admission', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,   
    controller:true,
    model: 'ExtDesktop.model.admission.Admission',
    proxy: {              
              type: 'rest',
              url:'/sdn_admission', 
              extraParams: {
                    type: 'TC'                    
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