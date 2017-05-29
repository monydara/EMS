Ext.define('ExtDesktop.view.module.admission.FmEmergencyContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmEmergency',
    title:'Emergency',
    name:'emergency',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
              items:[
                     this.getEmergencyContact()
                   ]
        });
        me.callParent(arguments);
    },
    getEmergencyContact: function(){
    	var panel ={
    		    	bodyPadding:20,
		           defaults:{width:400,style:'margin-left:10px'},
		           layout:{
		        	   type:'table',
		        	   columns:2
		           },

		           items:[
		                  	{
                                    xtype:'textfield',
                                    name:'contact_name',
                                    fieldLabel:'Name',

		                  	},{
		                  		layout:'hbox',
		                  		border:false,
		                  		items:[
		                  		       {
		                  		    	   xtype:'radio',
		                  		    	   fieldLabel:'Gender',
		                  		    	   inputValue:'M',
		                  		    	   boxLabel  :'Male',
		                  		    	   name:'gender',
		                  		    	   checked:true
		                  		       },{
		                  		    	   xtype:'radio',
		                  		    	   boxLabel:'Female',
		                  		    	   inputValue:'F',
		                  		    	   style:'margin-left: 10px',
		                  		    	   name:'gender'
		                  		       }
		                  		]
		                  	},{
		                         xtype:'textfield',
		                         name:'phone',
		                         fieldLabel:'Phone',
                                 maxLength:30
                            }, {
                                   xtype:'textarea',
                                   name:'address',
                                   fieldLabel:'Address',
                                   rowspan:2,
                                   maxLength:250

                               },{
                                   xtype:'textfield',
                                   vtype:'email',

                                   name:'email',
                                   maxLength:100,
                                   fieldLabel:'Email'
	                         }

		       ]

    	}

    	return panel;

    }


});
