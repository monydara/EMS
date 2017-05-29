Ext.define('ExtDesktop.view.module.holiday.WinAdvanceSearch',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinAdvanceSearch',    
    title:'Form Advance Search',
    modal:true,       
    items:[
        {
            xtype:'form',
            //defaults:{width:350,labelWidth:150},
            bodyPadding:20,    
            items:[
               
                {    
                   
                     xtype: 'combo',  
                    // forceSelection:true , //true : user can input text but the value can only select from dropdown list . by default it is false
                    fieldLabel: 'Academic Year',
                    emptyText: 'Select....',   
                    displayField: 'name',  // (text to show to user in combo) this is name field of table cfg_academic_year,cus we use store AcademicYear
                    valueField: 'id',      // (value to submit correspondent to the displayField) this is id field of table cfg_academic_year
                    name: 'academic_year_id',      // name to submit with value of valueField , id , .
                  //  allowBlank:false,
                    //listeners: Util.firstSelect(),
                    store: 'AcademicYear'
                },
                {
                    xtype:'datefield',
                    name:'start_date',
                    format: 'd-M-Y',                   
                    emptyText:'-- From Date --',
                    fieldLabel:'From Date',
                  //  allowBlank:false,
                    submitFormat: 'Y-m-d'
                },{
                    xtype:'datefield',
                    name:'end_date',
                    format: 'd-M-Y',                 
                    emptyText:'-- To Date --',
                    fieldLabel:'To Date',
                   // allowBlank:false,
                    submitFormat: 'Y-m-d'
                },{
                    xtype:'textfield',
                    name:'text',
                    format: 'd-M-Y',                 
                    emptyText:'-- Keyword --',
                    fieldLabel:'Keyword'
                }
            ]
        }
        
        
    ],
    buttons:[
        {
            text:'Search',
              iconCls:'icon-search',
            action:'AdvanceSearch'
        },
        {
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel',
            listeners:{
            	click: function(btn){
            		var win = btn.up("window");
            		win.close();
            	}
            }
        }
        
    ]

});