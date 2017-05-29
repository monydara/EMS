Ext.define('ExtDesktop.view.module.registration.WinRegistration', {
    extend: 'Ext.window.Window',
    alias: 'widget.winRegistration',
    title:'Registration From1',
    closable:true,
    height: 550,
    width:1020,
    autoScroll:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me,{
            items:[{
                    xtype:'panel',
                    border:false,
                    bodyPadding:10,
                    items:[{
                        	   xtype:'form',
                        	   items:[this.studentInfo(), this.personalContactForm(),]
                           }]
            }],
            buttons:[
                        {text:'Save & New',action:'SaveAndNew',iconCls:'icon-save'},
                        {text:'Save',action:'Save',iconCls:'icon-save'},
                        {text:'Cancel',action:'Cancel',iconCls:'icon-cancel'}
            ]
        });

        me.callParent(arguments);
    },

    studentInfo: function(){
      var form={
          xtype:'fieldset',
          title:'<b>Student Information',
//          width:950,
         padding:10,
          layout:{
              type:'table',
              columns:2
          },
          items:[
              {
                  xtype:'container',
                  defaultType:'textfield',
                defaults:{labelWidth:85,width:300,height:34},
                  items:[
                      {
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Title',
                          emptyText:'Select....',
                          valueField:'id',
                          allowBlank:false,
                          displayField:'name',
                          name:'titleId',
                          store:'lookup.CmbTitle',
                          listeners:Util.firstSelect()
                      },{
                          fieldLabel:'First Name<font color="red">*</font>',
                          allowBlank:false,
                          name:'firstName'
                      },{
                          fieldLabel:'Last Name<font color="red">*</font>',
                          allowBlank:false,
                          name:'lastName'
                      },{
                          fieldLabel:'គោត្តនាម<font color="red">*</font>',
                          allowBlank:false,
                          name:'firstNameKHR'
                      },{
							xtype:'textfield',
						    fieldLabel:'នាម<font color="red">*</font>',
						    allowBlank:false,
						    name:'lastNameKHR'

						},{
						    xtype:'combo',

						    allowBlank:false,
						    fieldLabel:'Gender',
						    emptyText:'Select....',
						    valueField:'id',
						    displayField:'name',
						    name:'genderId',
						    listeners:Util.firstSelect(),
						    store:'lookup.CmbGender'
						},{
	                        xtype:'numberfield',
	                        fieldLabel:'ID No.',
	                        name:'idCardNo'
	                      },{
	                    	 xtype:'textfield',
	                    	 name:'passportNo',
	                    	 fieldLabel:'Passport No'
	                      }
                  ]
              },{
                  xtype:'container',
                  style:'padding-left:10px',
                  layout:{
                    type:'table',
                    columns:2
                  },

                  defaults:{labelStyle:'margin-left:10px',width:300},
                  items:[
						{
                          xtype:'datefield',
                          fieldLabel:'Date of Birth',
                          name:'dateOfBirth',
                          value:new Date()
                      },{
                    	  xtype:'form',
                    	 layout:'hbox',
                    	 rowspan:5,
                    	 items:[{
	                    		 xtype:'image',
	 							width:150,
	 							height:140,
	 							style:'margin-left:105px',

	 							src:'resources/images/photo/no-picture.gif'

                    	 		},
								{
									  xtype:'filefield',
									  buttonText:'.....',
									  margin:'margin-top:100px',
									  width:30,
									  name:'file',
									  action:'browe'
								},
                    	        ]
						},
						{
	                    	  xtype:'textfield',
	                    	  fieldLabel:'Place of Birth',
	                    	  name:'placeOfBirth',
	                    	  emptyText:'-- Place Of Birth --',


	                      },

                      {
	                          xtype:'combo',
	                          allowBlank:false,
	                          fieldLabel:'Langauge',
	                          emptyText:'Select....',
	                          valueField:'langaugeId',
	                          listeners:Util.firstSelect(),
	                          displayField:'name',
	                          name:'langaugeId',
	                          store:'Langauge'
	                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Nationality',
                          emptyText:'Select....',
                          valueField:'nationalityId',
                          listeners:Util.firstSelect(),
                          displayField:'name',
                          name:'nationalityId',
                          store:'Nationality'
                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Ethnicity',
                          emptyText:'Select....',
                          valueField:'ethnicityId',
                          listeners:Util.firstSelect(),
                          displayField:'name',
                          name:'ethnicityId',
                          store:'Ethnicity'
                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Religion',
                          emptyText:'Select....',
                          listeners:Util.firstSelect(),
                          valueField:'id',
                          displayField:'name',
                          name:'religionId',
                          store:'lookup.CmbReligion'
                      },     {
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Apply For',
                          emptyText:'Select....',
                          valueField:'id',
                          displayField:'name',
                          name:'degreeId',
                          store:'Degree'
                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Category',
                          emptyText:'Select....',
                          valueField:'studentCatId',
                          displayField:'category',
                          name:'studentCatId',
                          listeners:Util.firstSelect(),
                          store:'StudentCategory'
                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Course',
                          emptyText:'Select....',
                          valueField:'id',
                          displayField:'name',
                          name:'courseId',
                          store: Ext.create('ExtDesktop.store.Course')
                      },{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Occupation',
                          emptyText:'Select....',
                          valueField:'occupationId',
                          displayField:'occupation',
                          name:'occupation',
                          listeners:Util.firstSelect(),
                          store:'Occupation'
                      } ,{
                          xtype:'combo',
                          allowBlank:false,
                          fieldLabel:'Session',
                          emptyText:'Select....',
                          valueField:'id',
                          displayField:'name',
                          name:'sessionId',
                          store:'lookup.Sessions'
                      },/*{
                          xtype:'fieldset',
                          title:'Plac of Birth',
                          padding:10,
                          colspan:2,
                          layout:'hbox',
                          defaults:{labelAlign:'right'},
                          items:[
                              {
                                  xtype:'textfield',
                                  fieldLabel:'Address',
                                  name:'pobAddress',
                                  labelWidth:60  ,
                                  width:350
                              },{
                                    xtype:'combo',
                                    allowBlank:false,
                                    fieldLabel:'City',
                                    emptyText:'Select....',
                                    valueField:'cityId',
                                    displayField:'city',
                                    name:'pobCityId',
                                    labelWidth:40,
                                    store:'City'
                                }

                          ]
                      }*/
                  ]
              }



          ]

      }

      return form;
    },
    contract: function(){

      return {xtype:'tabpanel',
    	  border:true,
    	  width:950,
    	  items:[
    	         {
    	        	 xtype:'form',
    	        	 title:'Personal Contact',
    	        	 name:'presonalContact',
    	        	 bodyPadding:10,
    	        	 items:[this.personalContactForm()]
    	         },{
    	        	 xtype:'panel',
    	        	 title:'Parent Contact',
    	        	 name:'parentContact',
    	        	 items:[

    	        	        this.getParentForm()
    	        	        ]
    	         },{
    	        	 xtype:'fmEmergencyContact',

    	         }


    	         ]
    	  } ;
    },
    getParentForm: function(){
    	var form={
    			xtype:'panel',
    			border:false,
    			layout:'hbox',
    			bodyPadding:10,
    			items:[
    			      {
    			    	  xtype:'fmFatherContact'
    			      },{
    			    	  xtype:'fmMotherContact',
    			    	  style:'margin-left:20px'
    			      }
    			 ]
    	} ;


    	return form ;
    },
    personalContactForm:function(){
    	var form={
    	          xtype:'fieldset',
    	          title:'<b>Contact',
    	          layout:'hbox',
    	          padding:10,
    	          items:[
    	              {
    	            	  defaults:{labelWidth:85,width:300},
    	                  items:[
    	                     {
	                            xtype:'textfield',
	                            fieldLabel:'Address<font color="red">*</font>',
	                            name:'address',
	                            allowBlank:false
	                        }, {
	                            xtype:'combo',
	                            allowBlank:false,
	                            fieldLabel:'City',
	                            emptyText:'-- Select City --',
	                            valueField:'cityId',
	                            displayField:'city',
	                            name:'city',
	                            store:'City'
	                        },{
	                            xtype:'combo',
	                            allowBlank:false,
	                            fieldLabel:'District',
	                            emptyText:'-- Select District --',
	                            valueField:'districtId',
	                            displayField:'district',
	                            name:'district',
	                            store:Ext.create('ExtDesktop.store.District')
	                        },{
	                            xtype:'combo',
	                            allowBlank:false,
	                            fieldLabel:'Commune',
	                            emptyText:'-- Select Commune --',
	                            valueField:'communeId',
	                            displayField:'commune',
	                            name:'commune',
	                            store:Ext.create('ExtDesktop.store.Commune')
	                        }
    	                  ]
    	              },{
    	                  style:'margin-left:10px',
    	                  defaults:{labelWidth:70,width:300},
    	                  items:[
    	                         {
    	    	                        xtype:'textfield',
    	    	                        fieldLabel:'Phone No.<font color="red">*</font>',
    	    	                        allowBlank:false,
    	    	                        name:'phone'
    	    	                    },
    	                      {
    	                            xtype:'textfield',
    	                            fieldLabel:'Post Code',
    	                            name:'postCode'
    	                        },{
        	                        xtype:'textfield',
        	                        vtype:'email',
        	                        name:'email',
        	                        fieldLabel:'Email'
        	                     },{
        	                        xtype:'textfield',
        	                        fieldLabel:'Website',
        	                        name:'website'
        	                    }
    	                  ]
    	              },{xtype:'textarea',width:300,labelWidth:70,name:'note',height:110,labelAlign:'top',fieldLabel:'<b>Note</b>',style:'margin-left:10px'}

    	              /*{
    	                  style:'margin-left:10px',
    	                  defaults:{labelWidth:85,width:300},
    	                  items:[

    	                  ]
    	              }*/




    	      ]
    	      };

    	return form;

    },
});
