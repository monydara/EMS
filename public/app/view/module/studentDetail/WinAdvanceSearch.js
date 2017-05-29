Ext.define('ExtDesktop.view.module.studentDetail.WinAdvanceSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.winAdvanceSearch',
    title: 'Advance Search',
    bodyPadding: 20,
    defaults: {
        width: 400
    },
    items: [

        {
            xtype: 'datefield',
            fieldLabel: 'From',
            name: 'startDate',
            emptyText: 'Start Date'
        }, {
            xtype: 'combo',
            emptyText: 'Category',
            name: 'category',
            fieldLabel:'Category',
            store: 'StudentCategory',
            valueField: 'studentCatId',
            displayField: 'category',
        }, {
            xtype: 'datefield',
            name: 'endDate',
            fieldLabel: 'To',
            emptyText: 'To Date'
        }, {
            xtype: 'combo',
            emptyText: 'Nationaly',
            name: 'nationality',
            store: 'Nationality',
            fieldLabel:'Nationality',
            valueField: 'nationalityId',
            displayField: 'name'
        }, {
            xtype: 'combo',
            emptyText: 'Status',
            fieldLabel:'Status',
            name: 'status',
            store: 'lookup.Status',
            valueField: 'id',
            displayField: 'name',
        },

    ],
    buttons: [{
            text: 'Search',
            iconCls: 'icon-search',
            action: 'Search'
        },
    ]

});
