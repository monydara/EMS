Ext.define('ExtDesktop.model.CashDrawer', {
    extend: 'Ext.data.Model',
    fields: [
			'id',
			'cdg_id',
			'user_id',
			'is_active',
			'is_deleted',
			'create_by',
			'created_at',	
			'updated_at',
			'user_name',
			'staff_name'
	]
});