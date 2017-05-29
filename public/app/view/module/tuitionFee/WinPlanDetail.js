Ext.define('ExtDesktop.view.module.tuitionFee.WinPlanDetail', {
    extend: 'Ext.window.Window',
    alias: 'widget.winPlanDetail',
    title: 'Plan Detail',    
    // bodyPadding:20 ,
    layout: 'fit',
    height: "100%",
    width: "100%",
    autoScroll: true,
    items: [{
        xtype: 'tabpanel',
        autoScroll:true,
        items: [{
            title: 'Plan TC',
            bodyPadding: 10,
            layout:'hbox',
            items: [{

                xtype: 'tuitionFeeGridPlanTC', 
                height:'100%' 
            },{
                xtype:'tuitionFeeGridPlanTcDetail',
                height:'100%' 
            }]
        }, {
            title: 'Plan WU',
            bodyPadding: 10,
            layout:'hbox',
            items: [{

                xtype: 'tuitionFeeGridPlanWU', 
                height:'100%' 
            },{
                xtype:'tuitionFeeGridPlanWuDetail',
                height:'100%' 
            }]
        }]
    }, {
        xtype: 'hiddenfield',
        name: 'plan_cat_id'
    }],
    buttons: [{
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            iconCls: 'icon-cancel',
            action: 'Cancel'
        }

    ]

});