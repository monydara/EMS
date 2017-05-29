Ext.define('ExtDesktop.view.module.lead.WinAdvanceSearch',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinAdvanceSearch',    
    title:'Form Advance Search',
    // modal:true,      
  
    items:[
        {
            xtype:'form',
            defaults:{width:370,labelWidth:70 , style:'margin-left:10px'},            
            layout:{
                type:'table',
                columns:2
            },
            bodyPadding:20,    
            items:[
                {
                    xtype:'combo',
                    fieldLabel:'Degree',
                    name:'degree_id',
                    store:'combo.Degree',
                    valueField:'id',
                    displayField:'name',
                    editable:false
                },{
                    xtype:'combo',
                    fieldLabel:'Course',
                    store:'combo.CourseTC',
                    valueField:'id',
                    displayField:'name',
                    queryMode:'local',
                    name:'course_id'
                },{
                    xtype:'combo',
                    fieldLabel:'Class Shift',
                    name:'class_shift_id',
                    store:'combo.ClassShift',
                    queryMode:'local',
                    valueField:'id',
                    displayField:'name'
                },{
                    xtype:'container',
                    layout:'hbox',
                    defaultType:'radiofield',
                    defaults:{
                        name:'status'
                    },
                    items:[
                        {
                            fieldLabel:'Status',
                            boxLabel:'Registered',
                            inputValue:'R',
                            labelWidth:70 , 
                            checked:true
                        },{
                            boxLabel:'Admission', 
                            style:'margin-left:5px',
                            inputValue:'A'
                        },{
                            boxLabel:'Cancelled',
                            style:'margin-left:5px',                            
                            inputValue:'C'
                        }
                    ]
                },{
                    xtype:'datefield',
                    fieldLabel:'Start Date',
                    name:'start_date',
                    format:'d-M-Y',
                    submitFormat:'Y-m-d'
                },{
                    xtype:'datefield',
                    fieldLabel:'End Date',
                    name:'end_date',
                    format:'d-M-Y',
                    submitFormat:'Y-m-d'
                }
            ]
        }
        
        
    ],
    buttons:[
        {
            text:'Search',
            iconCls:'icon-search',
            action:'Search'
        },{
            text:'Close',
            iconCls:'icon-cancel',
            action:'Close'
        }
        
    ]

});