Ext.define('ExtDesktop.model.DiscountItemDetailM', {
    extend: 'Ext.data.Model',
    fields: [
                'id',                
				'discount_value',
                'discount_unit',
                'is_allow_edit',
                'note',                                            
                'is_del', 
                {
		            name    : 'discount_item', 
		            convert : function (v, rec) {
		            	var custom = rec.get('is_allow_edit');
		            	if (custom) {
		            		custom = "(Allow Adjustment)"
		            	}else{
		            		custom = "";
		            	};

		            	if (rec.get('discount_unit') == "P") {

			               return rec.get('discount_value') + ' % '+custom;
		            	}else{
			               return rec.get('discount_value') + ' $ ' + custom;		            		
		            	};
		            }
		        }
	]
});