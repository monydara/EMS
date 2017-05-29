Ext.define('ExtDesktop.store.sdn.StudentDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.admission.Admission',
    proxy: {              
              type: 'rest',
              url:'/sdn_admission',                     
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