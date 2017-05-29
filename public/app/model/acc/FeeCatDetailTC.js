Ext.define('ExtDesktop.model.acc.FeeCatDetailTC', {
    extend: 'Ext.data.Model',
    fields: [
        "id", 
        "plan_id", 
        "plan_num", 
        "description", 
        "cycle_type_id", 
        "term_id", 
        "currency_id", 
        "fee_amount", 
        "is_active", 
        "is_deleted", 
        "user_id"
     ]
});
