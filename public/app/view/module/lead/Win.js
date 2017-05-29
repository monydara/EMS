Ext.define('ExtDesktop.view.module.lead.Win',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinLead',
    title:'Student Registration',
    bodyPadding:10,
    minimizable:true,
    items:[
        {
            xtype:'Form',
            defaults:{width:380,style:'margin-right:10px;margin-left:10px',height:34},
            defaultType:'textfield',
            layout:{
                        type:'table',
                        columns:2
            },

            items:[
                {
                    fieldLabel:"នាមត្រកូល",
                    name:'khr_last_name',
                    allowBlank:true,
                    maxLength: 50
                },{
                  xtype:'form',
                 layout:'hbox',
                 rowspan:4,       
                 height:140,
                 items:[
                    {
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
                          name:'image',
                          action:'browe'
                    },
                    {
                        xtype: 'hiddenfield',
                        value:'resources/images/photo/no-picture.gif',
                        name: 'image_url'
                    }]
                },{
                    fieldLabel:'នាម',
                    name:'khr_first_name',
                    allowBlank:true,
                    maxLength: 50
                },{
                    fieldLabel:'Last Name',
                    allowBlank:false,
                    name:'last_name',
                    maxLength: 50
                },{
                    fieldLabel:'First Name',
                    allowBlank:false,
                    name:'first_name',
                    maxLength: 50
                },{
                    xtype:'container',
                    layout:'hbox',
                    defaults:{xtype:'radiofield', name:'gender'},
                    items:[
                        {
                            fieldLabel:'Gender',
                            boxLabel:'Male',
                            checked:true,
                            // labelAlign:'right',
                            inputValue:'M'
                        },{
                            boxLabel:'Female',
                            style:'margin-left: 10px',
                            inputValue:'F'
                        }
                    ]
               },{
                    xtype:'datefield',
                    name:'date_of_birth',
                    fieldLabel:'DOB',
                    format:'d-M-Y',
                   // value:new Date(),
                    altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
                    allowBlank:true,
                    submitFormat:'Y-m-d'
               },{
                    xtype:'datefield',
                    name:'registered_date',
                    value:new Date(),
                    fieldLabel:'Register',
                    format:'d-M-Y',
                    altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
                    submitFormat:'Y-m-d'
               },{
                    xtype:'textfield',
                    name:'place_of_birth',
                    fieldLabel:'Place Of Birth'
               },{
                    xtype:'textfield',
                    name:'phone_no',
                    fieldLabel:'Phone',
                    allowBlank:false
               },{
                    xtype:'textfield',
                    vtype:'email',
                    allowBlank:true,
                    fieldLabel:'Email'
               },{
                    name:'address',
                    fieldLabel:'Address'
               },{
                    xtype:'combo',
                    name:'degree_id',
                    store:'combo.Degree',
                    queryMode:'local',
                    valueField:'id',
                    displayField:'name',
                    listeners:Util.firstSelect(),
                    editable:false,
                    fieldLabel:'Degree',
                    allowBlank:false
               },{
                    xtype:'combo',
                    fieldLabel:'Course',
                    allowBlank:false,
                    name:'course_id',
                    valueField:'id',
                    store:'combo.Course',
                    queryMode:'local',
                    editable:false,
                    displayField:'name',
                    emptyText:'-- Select Course --'
               },{
                    xtype:'combo',
                    name:'class_shift_id',
                    store:'combo.ClassShift',
                    queryMode:'local',
                    valueField:'id',
                    displayField:'name',
                    editable:false,
                    fieldLabel:'Class Shift'

                },/*{
                    xtype: 'fileuploadfield',
                    fieldLabel:'Photo',
                    colspan:2,
                    width:740,
                    name: 'avatar'
                },*/{
                    xtype:'textarea',
                    name:'note',
                    colspan:2,
                    width:740,
                    fieldLabel:'Note',
                    maxLength: 250
               }
            ]
        }
    ],
    buttons:[
        {
            text:'Save & New',
            iconCls:'icon-save',
            action:'SaveAndNew'
        },{
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
