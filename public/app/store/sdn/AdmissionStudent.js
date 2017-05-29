Ext.define('ExtDesktop.store.sdn.AdmissionStudent', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.sdn.AdmissionStudent',
    proxy: {              
              type: 'ajax',
              api:{
                read: 'SdnAdmission/get_students_to_enrollment',
                create: 'SdnAdmission/get_students_to_enrollment',
                update: 'SdnAdmission/get_students_to_enrollment'
              },
              // url:'/SdnAdmission/get_students_to_enrollment',                     
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