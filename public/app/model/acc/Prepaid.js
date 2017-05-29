Ext.define('ExtDesktop.model.acc.Prepaid', {
    extend: 'Ext.data.Model',
    fields: [
		        'id','lead_id','fin_tran_id','trn_date','currency','trn_amount','ex_rate','lcy_amount',
                'remark','user_name','checker','name','status','course_name','degree_name','receipt_no']
});
