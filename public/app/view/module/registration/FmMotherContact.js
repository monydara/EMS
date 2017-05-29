Ext.define('ExtDesktop.view.module.registration.FmMotherContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.fmMotherContact',    
    items:[           
           {
	    	   xtype:'fieldset',
	    	   title:'Mother Information',
	    	   padding:10,
	    	   defaultType:'textfield',
	    	   defaults:{width:450,labelWidth:70},
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
                        listeners:Util.firstSelect(),
                        name:'occupationId',
                        store:'Occupation'
                    },{
                        xtype:'combo',
                        allowBlank:false,
                        fieldLabel:'Nationality',
                        emptyText:'Select....',
                        valueField:'nationalityId',
                        displayField:'name',
                        listeners:Util.firstSelect(),
                        name:'nationalityId',
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