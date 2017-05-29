Ext.define('ExtDesktop.view.module.holiday.Win',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinHoliday',    
    title:'Form Holiday',
    modal:true,       
    items:[
        {
            xtype:'form',
            //defaults:{width:350,labelWidth:150},
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'code',
                    emptyText:'-- Code --',
                    fieldLabel:'Code<font style="color:red">*</font>',
                    maxLength:6,
                    allowBlank:false
                },
                {
                    xtype:'textfield',
                    name:'name',
                    emptyText:'-- Holiday khmer Name --',
                    fieldLabel:'English name<font style="color:red">*</font>',
                    allowBlank:false
                },
                 {
                    xtype:'textfield',
                    name:'khr_name',
                    emptyText:'-- Holiday Khmer Name --',
                    fieldLabel:'Khmer name<font style="color:red">*</font>',
                    height:40,
                    allowBlank:false
                },
                {    
                   
                     xtype: 'combo',  
                    // forceSelection:true , //true : user can input text but the value can only select from dropdown list . by default it is false
                    fieldLabel: 'Academic Year<font style="color:red">*</font>',
                    emptyText: 'Select....',   
                    allowBlank: false,
                    displayField: 'name',  // (text to show to user in combo) this is name field of table cfg_academic_year
                    valueField: 'id',      // (value to submit correspondent to the displayField) this is id field of table cfg_academic_year
                    name: 'academic_year_id',      // name to submit with value of valueField , id , .
                    allowBlank:false,
                   // listeners: Util.firstSelect(),
                    store: 'AcademicYear'
                },
                {
                    xtype:'datefield',
                    name:'start_date',
                    format: 'd-M-Y',                   
                    emptyText:'-- Start Date --',
                    fieldLabel:'Start Date<font style="color:red">*</font>',
                    allowBlank:false,
                    submitFormat: 'Y-m-d'
                },{
                    xtype:'datefield',
                    name:'end_date',
                    format: 'd-M-Y',                 
                    emptyText:'-- End Date --',
                    fieldLabel:'End Date<font style="color:red">*</font>',
                    allowBlank:false,
                    submitFormat: 'Y-m-d'
                },{
                    xtype:'textfield',
                    name:'description',
                    format: 'd-M-Y',                 
                    emptyText:'-- Description --',
                    fieldLabel:'Description'
                }
            ]
        }
        
        
    ],
    buttons:[
        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel'
        }
        
    ]

});