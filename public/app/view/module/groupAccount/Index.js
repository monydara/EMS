/**
 * Created by IT on 2/24/2016.
 */
Ext.define('ExtDesktop.view.module.groupAccount.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GroupAccount',
    store: 'acc.GroupAccount',
    title:'Group Accounts',
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
                },'->',{
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add'
                }, {
                    text: 'Edit',
                    action: 'Edit',
                    iconCls: 'icon-edit'
                }, {
                    text: 'Close',
                    action: 'Close',
                    iconCls: 'icon-delete'
                }
            ],
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    dataIndex:'group_code',
                    text:'Group Code',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'group_name',
                    text:'Group Name',
                    flex:1
                },{
                    dataIndex:'group_type',
                    text:'Group Type',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'account_type',
                    text:'Account Type',
                    align:'center',
                    width: 120
                },{
                    dataIndex:'description',
                    text:'Description',
                    flex:1
                },{
                    dataIndex:'status',
                    text:'Status',
                    align:'center',
                    renderer: function(value, raw, record) {
                        var data = record.data;
                        var status = data.status == "O" ? "Open" : "Closed";
                        return status;
                    },
                    width: 120
                }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'acc.GroupAccount',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    }

});
