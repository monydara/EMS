Ext.define('ExtDesktop.controller.StudentDetail', {
    extend: 'Ext.app.Controller',
     stores: [
          'sdn.StudentDetail',
          'sdn.Document',

        //     'combo.CourseTC',
        // 'combo.DegreeTC',
        // 'combo.Major',
        // 'combo.Term',
        // 'combo.TuitionTime',
        // 'combo.CourseLevel',
        // 'combo.ClassShift',
        // 'combo.AcademicYear',
        // 'combo.Batch',

    ],
    views: [
            'module.studentDetail.Index',
            'module.studentDetail.WinAdmission'  ,
             'module.studentDetail.WinDrop'  ,
             'module.studentDetail.WinSuspend' ,
             'module.studentDetail.WinAdmissionWU'
    ],
    init: function(app) {

        this.control({
        	'studentDetailGrid textfield[name=filter]':{
        		change: this.searchString
        	},
        	'studentDetailGrid button[action=AdvanceSearch]':{
        		click: this.showAdvanceSearch
        	},
        	'studentDetailGrid button[action=Search]':{
        		click: this.searchAdvance
        	},
        	'studentDetailGrid button[action=Edit]':{
        		click: this.showFormEdit
        	},
        	'studentDetailGrid button[action=Suspend]':{
        		click: this.suspend
        	},
        	'studentDetailGrid button[action=Drop]':{
        		click: this.dropStudent
        	},
        	'studentDetailGrid button[action=Reactive]':{
                click: this.reactiveStudent
            },
            'studentDetailGrid button[action=ViewStudent]':{
        		click: this.viewStudent
        	},
            // event on drop form
            'WinStudentDetailTC button[action=drop]':{
                click: this.showFormDrop
            },

            'winDrop button[action=Save]':{
                click: this.closeForm
            },
            'winDrop button[action=Cancel]':{
                click : this.closeForm
            },
            // event on suspend form
            'WinStudentDetailTC button[action=suspend]':{
                click: this.showFormSuspend
            },
            'winSuspend button[action=Save]':{
                click: this.closeForm
            },
            'winSuspend button[action=Cancel]':{
                click : this.closeForm
            }


        });

    },
    viewStudent:function(btn){
        var record = Util.getRecord(btn),
        me = this ;
        me.getSdnDocumentStore().load({
            params:{
                student_id : record.get('id')
            }
        });
      
        if(record.get('handler') == "TC"){
            var win = Ext.create('ExtDesktop.view.module.studentDetail.WinAdmission');
            win.show();
            win.down("form").loadRecord(record);
            win.down('image').setSrc(record.get("image_url"));

            // load student contact
            Util.ajax("/SdnAdmission/get_khr_value",{ student_id:record.get("id") , type:'TC'}, me.setValueToForm, win );

        }else{
            var win = Ext.create('ExtDesktop.view.module.studentDetail.WinAdmissionWU');
            win.show();
            win.down("form").loadRecord(record);
            win.down('image').setSrc(record.get("image_url"));

            // load student khr form
            Util.ajax("/SdnAdmission/get_khr_value",{ student_id:record.get("id") }, me.setValueToForm, win );
        }


    },
    setValueToForm:function(obj , win){
      
        if ( obj.data ) {
            win.down('form[name=additional]').getForm().setValues(obj.data);
        };
        win.down('form[name=emergency]').getForm().setValues(obj.emergencyContact);
        win.down('form[name=father]').getForm().setValues(obj.fatherContact);
        win.down('form[name=mother]').getForm().setValues(obj.motherContact);
    },
    closeForm:function(btn){
        var win = btn.up('window');
        win.close();
    },
    showFormDrop:function(btn){
        var win = Ext.create('ExtDesktop.view.module.studentDetail.WinDrop');
        win.show();
        win.center();
    },
    showFormSuspend:function(btn){
        var win = Ext.create('ExtDesktop.view.module.studentDetail.WinSuspend');
        win.show();
        win.center();
    },
    showFormEdit: function(btn){
    	var win = Ext.create("ExtDesktop.view.module.studentDetail.WinAdmission");
    	win.show();
    	win.center();

    },
    suspend: function(btn){
    	var win= Ext.create("Ext.window.Window",{
    		title:'Suspend Student',
    		modal: true,
    		layout:'fit',
    		closable:false,
    		items:[
    		       {
    		    	   xtype:'form',
    		    	   bodyPadding:20,
    		    	   defaults:{width:350},
    		    	   items:[
    		    	          {
    		    	        	  xtype:'combo',
    		    	        	  fieldLabel:'Suspend Type',
    		    	        	  emptyText:'-- Select Type --'
    		    	          },{
    		    	        	  xtype:'datefield',
    		    	        	  fieldLabel:'From',
    		    	        	  value: new Date()
    		    	          },{
    		    	        	  xtype:'datefield',
    		    	        	  fieldLabel:'To'
    		    	          },{
    		    	        	  xtype:'textarea',
    		    	        	  fieldLabel:'Reason'
    		    	          }


    		    	          ]
    		       }

    		       ],
    		       buttons:[
    		                {text:'Save',iconCls:'icon-save',action:'Save'},
    		                {text:'Cancel',iconCls:'icon-cancel',action:'Cancel',handler:function(){win.close()}}
    		                ]

    	});

    	win.show();


    },

    dropStudent: function(btn){
    	var win = Ext.create("Ext.window.Window",{
    		title:'Drop Student',
    		modal:true,
    		layout:'fit',
    		closable:false,
    		items:[
    		       {
    		    	   xtype:'form',
    		    	   bodyPadding:20,
    		    	   defaults:{width:350},
    		    	   items:[
    		    	          {
    		    		    	   xtype:'combo',
    		    		    	   fieldLabel:'Drop Type',
    		    	          },{
    		    	        	  xtype:'textarea',
    		    	        	  fieldLabel:'Reason'
    		    	          }

    		    	          ]
    		       }

    		       ],
    		 buttons:[
    		          {text:'Save',iconCls:'icon-save',action:'Save'},
    		          {text:'Cancel',iconCls:'icon-cancel',action:'Cancel',handler:function(){win.close()}}
    		          ]
    	});

    	win.show();
    	win.center();

    },
    reactiveStudent: function(btn){
    	Ext.Msg.show({
    	     title:'Reactive Student?',
    	     msg: 'Student has been suspend. Would you like to reactive this student?',
    	     buttons: Ext.Msg.YESNO,
    	     icon: Ext.Msg.QUESTION
    	});
    },

    searchAdvance: function(btn){
    	var values = btn.up('form').getValues();
    	var store = btn.up('grid').getStore();
    	Util.loadStore(store,values);
    },
    showAdvanceSearch:function(btn){
        var win = Ext.create('ExtDesktop.view.module.studentDetail.WinAdvanceSearch');
        win.show();
        win.center();

    },
    searchString: function(field,value){
    	var grid = field.up('grid');
    	var store = grid.getStore();
    	var searchString =grid .down('textfield[name=filter]').getValue();

    	Util.loadStore(store,{ filter:searchString});

    }


});

