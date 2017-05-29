Ext.define('ExtDesktop.view.module.taxRate.Win',{
    extend: 'Ext.window.Window',
    alias: 'widget.FrmTaxRate',
    title:'Tax Rate',
    modal:true,
    width:450,
    bodyPadding:20,
    items:[
        {
            xtype:'form',
            defaults:{width:400,height:30},
            fieldDefaults: {
                labelWidth: 125
            },

            items:[
	                {
	                	xtype:'textfield',
	                    name:'code',
	                    emptyText:'Enter tax rate code',
	                    fieldLabel:'Code<font color="red">*</font>',
	                    allowBlank:false,
                        maxLength:6
	                },{
                        xtype:'textfield',
	                    name:'description',
	                    emptyText:'Enter description',
	                    fieldLabel:'Description<font color="red">*</font>',
	                    allowBlank:false
	                },{
                        xtype:'container',
                        layout:'hbox',
                        items:[
                                {
                                    xtype: 'combo',
                                    fieldLabel: 'Tax Type<font style="color:red">*</font>',
                                    emptyText: 'Select....',
                                    valueField: 'id',
                                    allowBlank: false,
                                    displayField: 'name',
                                    name: 'tax_type_id',
                                    width:370,
                                    listeners: Util.firstSelect(),
                                    store: 'TaxType'
                                },{
                                    xtype:'button',
                                    style:'margin-left:2px',
                                    action:'SearchTaxType',
                                    text:'...'
                                }
                        ]

                    },{
                            xtype   : 'numberfield',
                            fieldLabel: 'Rate',
                            allowBlank:false,
                            name:'tax_rate',
                            minValue         : 0.00,
                            value         : 0.00,
                            maxValue         : 100,
                            width:400,
                            decimalPrecision:2
                    },{
                            xtype: 'combo',
                            fieldLabel: 'Status<font style="color:red">*</font>',
                            emptyText: 'Select....',
                           // valueField: 'id',
                            allowBlank: false,
                            displayField: 'name',
                            name: 'status',
                            width:400,
                            listeners: Util.firstSelect(),
                            store:Ext.create('Ext.data.Store', {
                                fields: ['id', 'name'],
                                data: [
                                        {id: 1, name: 'Active'},
                                        {id: 0, name: 'Deactive'}
                                ]
                            })
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