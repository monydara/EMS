Ext.define('ExtDesktop.model.acd.SubjectDetail', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"division_id",
		"standard_id",
		"course_id",
		"degree_id",
		"subject_id",
		"total_credits",
		"sessions_per_week",
		"total_sessions",
		"durations_per_session",
		"total_durations",
		"description",
		"is_deleted",
		"campus_id",
		"created_at",

		"name"
	]
});