Ext.define('ExtDesktop.view.module.openCashDrawer.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.GridOpenCashDrawers',
    collapsible: false,
    title: 'Open Cash Drawer',
    closable: true,
    layout: 'fit',
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            xtype: 'container',
            layout: 'fit',
            items: [
                this.getGridOpenCashDrawer()
            ]
        });
        me.callParent(arguments);
    },
    getGridOpenCashDrawer:function(){
        var grid={
            xtype: 'grid',
            store: 'acc.CashTran',
            tbar: [{
                            xtype: 'datefield',
                            fieldLabel:'From Date',
                            name:'from_date',
                            width: 280,
                            value:new Date(),
                            format: 'Y-m-d'
                            

                    },{
                            xtype: 'datefield',
                            fieldLabel:'To Date',
                            name:'to_date',
                            width: 280,
                            value:new Date(),
                            format: 'Y-m-d'
                    },{
                            text: 'Search',
                            iconCls: 'icon-search',
                            action: 'Search'
                    },'->',{
                            text: 'Open Drawer',
                            iconCls: 'icon-preview',
                            action: 'OpenDrawer'
                    },{
                            text: 'Edit',
                            iconCls: 'icon-edit',
                            action: 'Edit'
                    }],
            columns:[
                {
                    xtype: 'rownumberer',
                    header: 'No.',
                    width: 50,
                    align: 'center'
                },{
                    header: 'Drawer Name',
                    flex:1,
                    dataIndex: 'user_name'
                },{
                    header: 'Open Date',
                    width: 120,
                    dataIndex: 'open_date',
                    type: 'date',
                    renderer: Ext.util.Format.dateRenderer('d-M-Y')
                },{
                    header: 'Open By',
                    width: 120,
                    dataIndex: 'open_by_name'
                },{
                    header: 'Open Amount($)',
                    width: 140,
                    dataIndex: 'open_amount'
                },{
                    header: 'Open Amount(R)',
                    width: 140,
                    dataIndex: 'open_amount_khr'
                },{
                    header: 'Closed Amount($)',
                    width: 140,
                    dataIndex: 'closed_amount'
                },{
                    header: 'Closed Amount(R)',
                    width: 140,
                    dataIndex: 'closed_amount_khr'
                },{
                    header: 'Closed Date',
                    width: 120,
                    dataIndex: 'closed_date',
                    type: 'date',
                    renderer: Ext.util.Format.dateRenderer('d-M-Y')
                },{
                    header: 'Closed By',
                    width: 120,
                    dataIndex: 'closed_by'
            }],
            bbar: Ext.create('Ext.PagingToolbar', {
                store:'acc.CashTran',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        };

        return grid;
    }
});