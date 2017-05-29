Ext.define('ExtDesktop.model.CashTran', {
    extend: 'Ext.data.Model',
    fields: [
			'id',
			'acc_cash_drawer_id',
			'user_name',
            'open_date',
			'open_by',
            'open_by_name',
			'open_amount',
            'open_amount_khr',
            'closed_amount',
            'closed_amount_khr',
            'closed_by',
            'closed_by_name',
            'closed_date'
	]
});