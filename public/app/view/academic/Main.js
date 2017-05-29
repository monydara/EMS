Ext.define('ExtDesktop.view.academic.Main', {
    extend: 'Ext.container.Container',
    requires:[
        'Ext.tab.Panel',
        'Ext.layout.container.Border',
        'Ext.tree.Panel',
        'Ext.data.TreeStore',
        'Ext.layout.container.Accordion'
    ],
    alias: 'widget.main_academic',
    xtype: 'app-main',
    layout: {
        type: 'border'
    },
    initComponent: function() {
        this.items= [{
                        region: 'center',
                        xtype: 'tabpanel',
                        frame:true,
                        items:[Ext.create('ExtDesktop.view.academic.Home')]
                    }],
                 this.callParent(arguments);
    }
});