Ext.define('ExtDesktop.view.module.employeeLevel.WinEmployeeLevel', {
    extend: 'Ext.window.Window',
    alias: 'widget.FrmEmployeeLevel',    
    title:'Employee Level',
    width:500,
    modal:true,
    autoScroll:true,
    bodyPadding: 20,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
              items:[{
	                	  xtype:'form',
	                	  name:'employeeLevel',
	            		  items:[
                              {
	            			  			xtype:'textfield',
	            			  		    name:'emp_level',
	            			  		    allowBlank: false,
	            			  		    maxLength:50,
	            			  		    anchor : '100%', 
	            			  		    fieldLabel:'Level Name'
	            		     },{
                                        xtype:'textfield',
                                        allowBlank: false,
	            			  		    name:'khr_emp_level',
	            			  		    anchor : '100%',
	            			  		    fieldLabel:'ឈ្មោះកំរិត'
                              },{
                                        xtype:'textarea',
	            			  		    name:'description',
	            			  		    allowBlank: false,
	            			  		    anchor : '100%',
	            			  		    fieldLabel:'Description'
	            		     },{
		        			  			xtype:'numberfield',
		        			  			name:'level_value',
		        			  			allowBlank: false,
		        			  			anchor : '50%',
		        			  			value: 0,
                                        align:'center',
                                      	minValue: 0,
		        			  			fieldLabel:'Value'
            		  		}]
              }]   
        });
        me.callParent(arguments);
    },
   
    buttons:[{
		            text:'Save',
		            iconCls:'icon-save',
		            action:'Save'
		        },{
		            text:'Cancel',
		            iconCls:'icon-cancel',
		            action:'Cancel'
		        }]
   

});