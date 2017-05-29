Ext.define('ExtDesktop.model.sdn.Document', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"doc_name",
		"doc_type_id",
		"student_id",
		"file_path",
		"orginal_file_name",
		"created_at",
		"updated_at",
		"_destroy",

		"doc_type"
	]
});
