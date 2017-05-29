Ext.define('ExtDesktop.view.module.registration.FmEmergencyContact', {
    extend: 'Ext.form.Panel',
    alias: 'widget.fmEmergencyContact', 
    title:'Emergency Contact',
    bodyPadding:10,
    defaultType:'textfield',
    defaults:{width:400,labelWidth:80, labelStyle: 'padding-left:10px;'},
    layout:{
    	type:'table',
    	columns:2
    },
    items:[ 
	        {
	        	fieldLabel:'Fist Name',
	        	name:'firstName'
	        },{
	        	fieldLabel:'Last Name',
	        	width:500,
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
                width:500,
                store:'Nationality'
            },{
            	fieldLabel:'Phone ',
            	name:'phone'
            },{
            	fieldLabel:'Email',
            	width:500,
            	name:'email',
            	vtype:'email'
            },{
            	fieldLabel:'website',
            	name:'website'
            },{
            	fieldLabel:'Address',
            	width:500,
            	name:'address'
            }

	    	         
           
           ]

    
}
)