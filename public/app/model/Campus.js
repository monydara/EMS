Ext.define('ExtDesktop.model.Campus', {
    extend: 'Ext.data.Model',
    fields: [
          "id" , 
					"campus_code",
					"campus_name",
					"abbr",
					"address",
					"email",
					"phone",
					"director",
					"start_date",
					"is_deleted",
					"status"
	]
});
