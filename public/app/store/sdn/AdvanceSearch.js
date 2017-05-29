Ext.define('ExtDesktop.store.sdn.AdvanceSearch', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.sdn.AdvanceSearch',
    proxy: {              
              type: 'rest',
              url:'/sdn_student_requests',                     
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
                      Ext.MessageBox.show(
                      {
                          title : 'REMOTE EXCEPTION', 
                          msg : operation.getError(), 
                          icon : Ext.MessageBox.ERROR, 
                          buttons : Ext.Msg.OK
                      });
                  }
              } 
      }      
});