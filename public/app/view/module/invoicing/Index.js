/**
 * Created by IT on 2/24/2016.
 */
Ext.define('ExtDesktop.view.module.invoicing.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.BatchProcess',
    store: 'acc.BatchProcess',
    title:'Invoicing',
    closable:true,
    autoScroll:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                {
                    xtype:'textfield',
                    name:'SearchBasic',
                    emptyText:'Enter search keyword here...',
                    width: 450
                },'->',
                {
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add'
                }, {
                    text: 'Edit',
                    action: 'Edit',
                    iconCls: 'icon-edit'
                },{
                    text:'Invoice',
                    action:'Invoice',
                    iconCls:'icon-simulator'
                },{
                    text:'Cancel',
                    action:'Cancel',
                    iconCls:'icon-cancel'
                }
            ],
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    dataIndex:'batch_proc_code',
                    text:'Batch Code',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'batch_proc_name',
                    text:'Batch Name',
                    flex:1
                },{
                    dataIndex:"group_name",
                    text:"Group Name",
                    width:200 ,
                },{
                    dataIndex:'proc_date',
                    text:'Process Date',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'total_invoices',
                    text:'Total Invoices',
                    align:'right',
                    width: 120
                },{
                    dataIndex:'status',
                    text:'Status',
                    align:'center',
                    width: 120,
                    renderer:function(value){
                        if (value=="N") {
                            return "New"
                        }else if(value =="S"){
                            return "Success" 
                        }else{
                            return "Unknow"
                        }
                    }
                }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
               store: 'acc.BatchProcess',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    }

});
