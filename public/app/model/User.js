Ext.define('ExtDesktop.model.User', {
    extend: 'Ext.data.Model',
    fields: [
            'id',
            'user_id',
            'user_name',
            'password',
            'confirmPassword',
            'hr_position_id',
            'position',
            'hr_department_id',
            'department',
            'address',
            'phone',
            'email',
            'description',
            'user_type',
            'home_campus_id',
            'home_campus',
            'status_id',
            'start_date',
            'is_force_pass',
            'status',
            'updated_at',
            'sys_role_user_attributes',
            'sys_user_location_attributes',
            'sys_user_degree_attributes'
	]
});