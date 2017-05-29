Ext.define('ExtDesktop.view.module.tuitionFee.Index',{
    extend: 'Ext.panel.Panel',
    alias: 'widget.IndexFeeCatalogue',
    collapsible: false,
    title:'Fee Catalogue',
    closable:true,
    layout:'fit',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          items:[
                this.getGridCatalogue()
         
            ]
        });
        me.callParent(arguments);
    },
    getGridCatalogue:function(){
        var grid ={
            xtype:'grid',
            store:'acc.FeeCatalogue',
            // title:'Catalogue',
            tbar:[
                {
                    xtype:'textfield',
                    text:'Search',
                    emptyText:'Search Fee Catalogue...',
                    name:'Search',
                    width:380
                },'->',
                {
                    iconCls:'icon-detail',
                    tooltip:'Plan Detail', 
                    text:'Plan Detail',
                    action:'Detail'
                },
                {
                    iconCls:'icon-add',
                    tooltip:'Create Catalog',
                    action:'Create',
                    text:'Create'
                },{
                    iconCls:'icon-copy',
                    tooltip:'Create Catalog With Copy',
                    action:'Copy',
                    text:'Copy'
                },{
                    iconCls:'icon-edit',
                    tooltip:'Edit Catalog',
                    action:'Edit',
                    text:'Edit'
                },{
                    iconCls:'icon-delete',
                    tooltip:'Delete Catalog',
                    action:'Delete',
                    text:'Delete'
                }

            ],
            columns:[
                {
                    header:'No',
                    xtype:"rownumberer",
                    width:50,
                    align:'center'
                }, {
                    header:'Name',
                    dataIndex:'catalogue_name',
                    width:250 
                },{
                    header:'Fiscal Year',
                    dataIndex:'fiscal_year',
                    width:160

                },{
                    header:'Effective Date',
                    dataIndex:'effective_date',
                    width:160
                },{
                    header:'Expire Date',
                    dataIndex:'expired_date',
                    width:160
                },{
                    header:'Description',
                    dataIndex:'description',
                    flex:1 
                },{
                    header:'Status',
                    dataIndex:'is_active',
                    renderer:function(value){
                        if (value == 0 ) {
                            return "<span style='color:red'><b>Deactive</b></span>"
                        }else{
                            return "<span style='color:green'><b> Active</b> </span>"
                        };
                    }
                }

            ],
            bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'acc.FeeCatalogue',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        }

        return grid;
    }
    
});


