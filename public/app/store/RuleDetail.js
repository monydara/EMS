Ext.define('ExtDesktop.store.RuleDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.RuleDetail',
    proxy: {              
              type: 'rest',
              url:'/exm_assessment_rule',               
              reader: {
                  type: 'json',
                  root: 'data',
                  successProperty: 'success',
                  messageProperty: 'message'
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