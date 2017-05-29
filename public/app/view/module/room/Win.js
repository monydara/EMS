Ext.define('ExtDesktop.view.module.room.Win',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinRoom',    
    title:'Form Room',
    modal:true,
    columnLines: true,
    items:[
        {
            xtype:'form',
            defaults:{width:450, allowBlank:false},
            fieldDefaults: {
                labelWidth: 125
            },
            bodyPadding:20,    
            items:[{
                    xtype:'textfield',
                    name:'code',
                    fieldLabel:'Code',
                    maxLength:6,
                    emptyText:'Enter classroom code'
                },{
                    xtype:'textfield',
                    name:'name',
                    maxLength:50,
                    emptyText:'Enter classroom name',
                    fieldLabel:'Room name'
                },{
                    xtype:'textfield',
                    name:'khr_name',
                    fieldLabel:'ឈ្មោះបន្ទប់',
                    emptyText:'Khmer name',
                    maxLength:50
                },{
                    xtype:'numberfield',
                    name:'max_seat',
                    fieldLabel:'Maximum Seat',
                    value: 0 , 
                    minValue: 0
                },{
                    xtype:'textarea',
                    name:'description',
                    allowBlank:true,
                    grow: true,                             
                    fieldLabel:'Description',
                    maxLength:250
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