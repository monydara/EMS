Ext.define('ExtDesktop.view.module.registration.FmFatherContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.fmFatherContact',    
    items:[           
           {
	    	   xtype:'fieldset',
	    	   title:'Father Information',    			    	  
	    	   defaultType:'textfield',
	    	   padding:10,
	    	   defaults:{width:400,labelWidth:70},
	    	   items:[
	    	        {
	    	        	fieldLabel:'Fist Name',
	    	        	name:'firstName'
	    	        },{
	    	        	fieldLabel:'Last Name',
	    	        	name:'lastName'
	    	        },{
                        xtype:'combo',
                        allowBlank:false,
                        fieldLabel:'Occupation',
                        emptyText:'Select....',
                        valueField:'occupationId',
                        displayField:'occupation',
                        name:'occupationId',
                        listeners:Util.firstSelect(),
                        store:'Occupation'
                    },{
                        xtype:'combo',
                        allowBlank:false,
                        fieldLabel:'Nationality',
                        emptyText:'Select....',
                        valueField:'nationalityId',
                        displayField:'name',
                        name:'nationalityId',
                        listeners:Util.firstSelect(),
                        store:'Nationality'
                    },{
                    	fieldLabel:'Phone ',
                    	name:'phone'
                    },/*{
                    	fieldLabel:'Email',
                    	name:'email',
                    	vtype:'email'
                    },{
                    	fieldLabel:'website',
                    	name:'website'
                    },{
                    	fieldLabel:'Address',
                    	name:'address'
                    }*/

	    	          ]
	       }
           
           
           ]

    
}
)