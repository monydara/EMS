Ext.define('ExtDesktop.controller.Employee', {
    extend: 'Ext.app.Controller',
    stores: [
             
             'hr.Employee',
             'lookup.EmpType',
             // 'EmployeeLevel',
             'combo.ClassShift',

             // 'lookup.CmbDocumentType',
             // 'employee.Document',

             
             'combo.EmployeeLevel'
            ],
    views: [
                'module.employee.Index',
                'module.hr',
                'module.employee.WinEmployee'
           ],
    refs: [
	        {
	            ref : 'GridEmployee' , 
	            selector : 'GridEmployee'
	        },{
	            ref : 'FrmEmployee' , 
	            selector : 'FrmEmployee'
	        }
    ],
    init: function(app) {
        
        this.control({
            'GridEmployee button[action=Create]':{
               click: this.showForm
            },
            'GridEmployee button[action=Edit]':{
        	   click: this.edit
           	},
           	'FrmEmployee button[action=Cancel]':{
                click: this.closeForm
            },
            'FrmEmployee button[action=Attachment]':{
            	click: this.showFormAttachedFile
            },
            'FrmEmployee filefield': {
                change: this.uploadTempImage
            },
            // save document 
            
            'FrmAttachedFile button[action=Save]':{
            	click: this.uploadDocument
            },
            'FrmEmployee button[action=Save]':{
            	click: this.save
            },

            // controller on search basic,advance
            'GridEmployee textfield[name=SearchBasic]':{
               change: this.searchKeyword
            }

            
        });
        
    },
    edit:function(btn){
        var record =Util.getRecord(btn , "Please select record to edit");


        if (record) {
            var win=Ext.create('ExtDesktop.view.module.employee.WinEmployee');
            win.down('form').getForm().loadRecord(record);
            win.down('image').setSrc(record.get("photo_path"));
            win.show();
            win.center();
         
        } 
    },
    uploadTempImage: function(field, value) {
        var form = field.up('form').getForm();
        window.imageField = field.up('form').down('image');
        form.submit({
            url: '/SdnStudent/uploadImage',
            waitMsg: 'Uploading your file...',
            success: function(response, o) {
                var objReturn = Ext.decode(o.response.responseText);
                var fileImage = imageField;
                field.up('form').down("hiddenfield[name=photo_path]").setValue(objReturn.data.replace("/", ""));

                fileImage.setSrc(objReturn.data.replace("/", ""));
                console.log(objReturn.data.replace("/", ""));
            }
        });
    },
    save: function(btn){
    	var win = btn.up('window'),
    		form = win.down('form'),
    		values= form.getValues(),
    		record= form.getRecord(),
            store = this.getHrEmployeeStore(),
    		contactValue = win.down('form[name=contact]').getValues(),
    		me = this;
            if (form.getForm().isValid()) {
                Ext.MessageBox.wait("Please Wait....", "System Saving Data");

                if (record) {
                    record.set(values);
                } else{
                    var model = Ext.create("ExtDesktop.model.Employee");
                    model.set(values);
                    store.add(model);
                };

                store.sync({
                    success: function(batch, options) {
                        Ext.MessageBox.hide();
                        if (win) {

                            win.close();
                        }
                        store.load();
                        Ext.MessageBox.show({
                            title: 'Saved',
                            msg: 'Record Save Succeed.',
                            icon: Ext.MessageBox.INFO,
                            buttons: Ext.Msg.OK
                        });

                    },
                    failure: function(batch, options) {
                        Ext.MessageBox.hide();

                        store.rejectChanges();
                        var msg = batch.proxy.reader.rawData.message;

                        Ext.MessageBox.show({
                            title: 'Error',
                            msg: msg,
                            icon: Ext.MessageBox.ERROR,
                            buttons: Ext.Msg.OK
                        });

                    },
                    callback: function(batch, options) {

                    },
                    scope: this
                });
            } else{
                Util.msg("Please enter require field");
            };
    		
    		
    },
    
    showFormAttachedFile:function(btn){
    	var win=Ext.create('ExtDesktop.view.module.employee.WinAttachedFile');
        win.show();
        win.center();
    },
    
    showForm:function(btn){
    	var win=Ext.create('ExtDesktop.view.module.employee.WinEmployee');
        win.show();
        win.center();
    },
    closeForm:function(btn){
    	 var win = btn.up('window');
		 win.close();
    },
    // tmpDocumentStore: Ext.create('ExtDesktop.store.employee.Document'),
    uploadDocument: function(btn){
    	var  win = btn.up('window');
    	var form = win.down('form[name=mainForm]').getForm();
    	if(form.isValid()){    
    		// show in grid
    		var docuemntStore = this.getEmployeeDocumentStore();
    		// store for upload to server
    		// var tmpStore = this.tmpDocumentStore,me = this;
    		
    		form.submit({        	
    	    	url: 'upload/documentEmp.action',	    	
    	    	waitMsg: 'Uploading employee document...',
    	    	success: function(response, o) {        			
    	    		var	objReturn = Ext.decode(o.response.responseText).message;  
    	    		// add file name to store after upload
    	    		var values = form.getValues();
    	    		var fileName = ((win.down('form').down('filefield').lastValue).split('fakepath\\'))[1];
    	    		var model = Ext.create('ExtDesktop.model.EmpDocument');
    	    		values.fileName = fileName;
    	    		values.filePath = objReturn;
    	    		model.set(values);
    	    		// tmpStore.add(model);
    	    		docuemntStore.add(model);
    	    		// TODO after add must be add to tmpstore for save to server side
    	    		win.close();
        		}    	
        	});   
    		
    	}else{    		
    		
    	}
    	
    	
    	
    },

    searchKeyword:function(textfield,newVal,oldVal){
           console.log("****"+newVal + "**"+oldVal);
           var text_search = newVal ;
           var store = this.getHrEmployeeStore();
           var me =  this;
           setTimeout(function() {
             me.show(text_search,store)
           }, 1000);  // measure in millisecond (ms)

          /* if (text_search != ""){   // user input value 
             store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
             
           }else{
             store.load(); 
             
           }*/
    },

   show:function(text_search,store){
        if (text_search != ""){   // user input value 
         store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
         
       }else{
         store.load(); 
         
       }
   }


	

});

