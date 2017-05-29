Ext.define('ExtDesktop.view.module.admission.WinDocument', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinDocument',
    title:'Document Form',
    modal:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          items:[
            {
                xtype:'form',
                url: 'SdnStudent/addDocument',
                bodyPadding:20,
                defaults:{
                    width: 350 ,
                    allowBlank:false,
                    labelWidth:120
                },
                items:[
                    {
                        xtype:'textfield',
                        name:'doc_name',
                        fieldLabel:'Document Name'
                    },{
                        xtype:'combo',
                        name:'doc_type_id',
                        fieldLabel:'Document Type',
                        valueField:'id',
                        displayField:'type_name',
                        editable:false,
                        store:'combo.DocumentType',
                        queryMode:'local'
                    },{
                        xtype:'filefield',
                        fieldLabel:'Select File',
                        name:'file'
                    }
                ],
                bbar:[
                   {
                    xtype:'displayfield',
                    value:'<span style="color:red"> Note: </span>File Support word, image and pdf '
                   },
                ]
            }

          ]
        });
        me.callParent(arguments);
    },

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
