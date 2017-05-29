Ext.define('ExtDesktop.view.module.standard.WinStandard',{
    extend: 'Ext.window.Window',
    alias: 'widget.FrmStandard',    
    title:'Standard​​ Form',
    modal:true,       
    items:[
        {
            xtype:'form',
            defaults:{width:380,height:30 ,allowBlank:false , style:'margin-left: 5px'},
            fieldDefaults: {
                labelWidth: 125
            },
            bodyPadding:20,    
            items:[
                {
                    xtype:'textfield',
                    name:'code',
                    maxLength:6,
                    emptyText:'Enter standard code',
                    fieldLabel:'Code<font color="red">*</font>'
                },{
                    xtype:'textfield',
                    name:'name',
                    maxLength:50,
                    emptyText:'Enter standard name',
                    fieldLabel:'Name<font color="red">*</font>'
                },{
                	xtype:'textfield',
                    name:'khr_name',
                    emptyText:'ឈ្មោះ',
                    maxLength:50,
                    fieldLabel:'ឈ្មោះ<font color="red">*</font>'
                },{
                    xtype:'numberfield',
                    name:'sequence',
                    value: 0,
                    minValue:0 ,                   
                    fieldLabel:'Sequence'
                }
            ]
    }],
    
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