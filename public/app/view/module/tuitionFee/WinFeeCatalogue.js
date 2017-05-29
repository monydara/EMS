Ext.define('ExtDesktop.view.module.tuitionFee.WinFeeCatalogue', {
    extend: 'Ext.window.Window',
    alias: 'widget.winFeeCatalogue',
    title:'Catalogue',
    modal:true,
    items:[
        {
            xtype:'form',
            bodyPadding:20 ,
            defaults:{
                labelWidth:150,
                width:350
            },
            items:[ 
                {
                    xtype:'hiddenfield', 
                    name:'catalogue_id'
                }, 
                {
                    xtype:'textfield',
                    name:'catalogue_name',
                    fieldLabel:"Catalogue Name"+redStar, 
                    allowBlank:false 

                },{
                    xtype:'textfield',
                    name:"fiscal_year",
                    fieldLabel:'Fiscal Year'+redStar,
                    allowBlank:false 
                },{
                    xtype:"datefield",
                    name :'effective_date',
                    fieldLabel:'Effective Date'+redStar,
                    allowBlank:false ,
                    value:new Date()
                },{
                    xtype:'datefield',
                    name:'expired_date',
                    fieldLabel:'Expire Date'
                },{
                    xtype:"textareafield",
                    name:'description',
                    fieldLabel:'Description'
                },{
                    xtype:'container',
                    layout:'hbox',
                    items:[
                        {
                            xtype:'radiofield',
                            name:'is_active',
                            fieldLabel:'Status ',
                            boxLabel:'Active',
                            inputValue:1 , 
                            checked:true
                        },{
                            xtype:'radiofield',
                            name:'is_active',
                            inputValue:0  ,
                            style:'margin-left:5px',
                            boxLabel:'Deactive'
                        }
                    ]
                }

            ],
            
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
