Ext.define('ExtDesktop.model.acc.FinanceTranM', {
    extend: 'Ext.data.Model',
    fields: [
		"id",		
		"receipt_no",
		"acc_tran_type_id",
		"acc_reason_type_id",
		"acc_cash_drawer_tran_id",
		"acc_payment_method_id",
		"ref_no",
		"tran_date",
		"amount_usd",
		"amount_khr",
		"commited_date",		
		"rollback_date",
		"tranRemark",
		"campus_id"
		]
});