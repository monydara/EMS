Ext.define('ExtDesktop.view.Main', {
    extend: 'Ext.container.Container',
    requires:[
        'Ext.tab.Panel',
        'Ext.layout.container.Border',
        'Ext.tree.Panel',
        'Ext.data.TreeStore',
        'Ext.layout.container.Accordion'
    ],
    alias: 'widget.mainlayout',
    xtype: 'main_win',
    layout: {
        type: 'border'
    },
    initComponent: function() {
        this.items= [{
            region: 'center',
            xtype: 'tabpanel',
            frame:true,
            items:[Ext.create('ExtDesktop.view.HomePage')]
        }],
            this.callParent(arguments);
    }
});