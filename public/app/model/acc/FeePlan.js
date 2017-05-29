Ext.define('ExtDesktop.model.acc.FeePlan', {
    extend: 'Ext.data.Model',
    fields: [
		 "id",
        "plan_cat_id",
        "batch_id",
        "tuition_time_id",
        "plan_code",
        "plan_name",
        "degree_id",
        "course_id",
        "description",
        "is_active",
        "is_delleted",
        "plan_type",
        "user_id",
        "campus_id",
        "created_at",
        "updated_at",

        "degree_name",
        "course_name"
		]
});