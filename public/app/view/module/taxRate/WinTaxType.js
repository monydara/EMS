Ext.define('ExtDesktop.view.module.taxRate.WinTaxType',{
    extend: 'Ext.window.Window',
    alias: 'widget.FrmTaxType',
    title:'Tax Type',
    modal:true,
    width:550,
    height:400,
    layout:'fit',
    items:[

        {
            xtype:'grid',
            name:'gridTaxType',
            store:'TaxType',
            autoScroll:true,
            columnLines: true,
            anchor:'100%',
            tbar:[
                {
                    xtype:'textfield',
                    width:320 ,
                    name:'search',
                    emptyText:'Enter keyword to search...'
                }
            ],
            columns:[
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{
                            dataIndex: 'code',
                            text: 'Code',
                            width: 100,
                            align:'center'
                        },{
                            dataIndex: 'name',
                            text: 'Name',
                            width: 200
                        },{
                            dataIndex: 'description',
                            text: 'Description',
                            allowBlank:false,
                            flex:1
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'TaxType',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        }
    ],
    buttons:[
        {
            text:'Ok',
            iconCls:'icon-save',
            action:'Ok'
        },{
            text:'Close',
            iconCls:'icon-cancel',
            action:'Close'
        }
    ]

});