Ext.define('ExtDesktop.model.KeyAccount', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"code",
		"name",
		"refer_type",
		"campus_id",
        "is_deleted",
        {
            name:'refer_type_desc',
            mapping:'refer_type',
            convert : function (v, rec) {
                var t = rec.data.refer_type;
                if (t=='S') {
                    return "To student";
                } else if (t=='E') {
                    return "To employee";
                } else {
                    return "Other";
                }
            }
        }
	]
});