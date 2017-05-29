Ext.define('ExtDesktop.view.module.admission.FmFamilyContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FmFamily',    
    title:'Family',

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
              items:[
                     this.getFamilyContact()
                   ]   
        });
        me.callParent(arguments);
    },
    getFamilyContact: function(){    	
    	
    	var panel ={
    			xtype:'panel',    	
    			bodyPadding:10,
    			autoScroll:true,
    			layout:'hbox',
    			items:[
    			       {
    			    	   xtype:'fieldset',
    			    	   title:'Father Info',
    			    	   padding:10,
    			    	   items:[{
                                   xtype:'form',
                                   name:'father',
                                   defaultType:'textfield',
                                   defaults:{width:420},
                                   items:[
                                            {
                                                fieldLabel:'Name',
                                                allowBlank:true,
                                                name:'contact_name'
                                            },{
                                                fieldLabel:'Phone No',
                                                name:'phone'
                                            },{
                                                fieldLabel:'Address',
                                                name:'address',
                                                xtype:'textarea'
                                            },


                                          ]
                                        }
                           ]
    			       },{
    			    	   xtype:'fieldset',
    			    	   title:'Mother Info',    			    	   
    			    	   style:'margin-left:20px',
    			    	   padding:10,    			    	   
    			    	   items:[
    			    	          {
    			    	        	  xtype:'form',
    			    	        	  name:'mother',
    			    	        	  defaultType:'textfield',
    			    	        	  defaults:{width:420},
    			    	        	  items:[
											{
                                                fieldLabel:'Name',
                                                allowBlank:true,
                                                name:'contact_name'
                                            },{
                                                fieldLabel:'Phone No',
                                                name:'phone'
                                            },{
                                                fieldLabel:'Address',
                                                name:'address',
                                                xtype:'textarea'
                                            },
    			    	        	         
    			    	        	         
    			    	        	         ]
    			    	          }
                           ]
    			       }
    			       
    			       ]
    	}
    	
    	return panel;
    	
    }
    

});