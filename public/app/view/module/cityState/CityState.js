Ext.define('ExtDesktop.view.module.cityState.CityState', {
    extend: 'Ext.window.Window',
    alias: 'widget.FrmCityState',    
    title:'City State',
    width:500,
    modal:true,
    autoScroll:true,
    bodyPadding: 20,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
              items:[{
	                	  xtype:'form',
	                	  name:'cityState',
	            		  items:[
                              {
	            			  			xtype:'textfield',
	            			  		    name:'city_code',
	            			  		    allowBlank: false,
	            			  		    maxLength:6,
	            			  		    anchor : '100%', 
	            			  		    fieldLabel:'City Code'
	            		     },{
                                        xtype:'textfield',
                                        allowBlank: false,
	            			  		    name:'city_name',
	            			  		    maxLength:50,
	            			  		    anchor : '100%',
	            			  		    fieldLabel:'City Name'
                              },{
                                        xtype:'textfield',
	            			  		    name:'city_name_khr',
	            			  		    allowBlank: false,
	            			  		    maxLength:50,
	            			  		    anchor : '100%',
	            			  		    fieldLabel:'ឈ្មោះទីក្រុង'
	            		     },{
		        			  			xtype:'textarea',
		        			  			name:'description',
		        			  			allowBlank: false,
		        			  			anchor : '100%',		        			  			
		        			  			fieldLabel:'Description'
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