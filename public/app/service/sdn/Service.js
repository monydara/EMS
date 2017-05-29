Ext.define("ExtDesktop.service.sdn.Service",{
	loadClassInfo:function( fm , classId ){
		Util.ajax("/AcdClassTc/get_class_by_id" , { id:classId} , this.afterLoadClass , fm);
	}, 
	loadClassInfoWu:function(fm , classId ){
		
		Util.ajax("/AcdClassWu/get_class_by_id" , { id:classId} , this.afterLoadClass , fm);

	}, 
	afterLoadClass:function(o , fm){
		var data = o.data[0]; 
		if (data) {

			fm.getForm().setValues(data);
		} 
	}
})