Ext.define('ExtDesktop.view.module.tuitionFee.GridPlanWU', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.tuitionFeeGridPlanWU',
    title: 'Plan WU',
    width: '58%',
    border: true,
    style: 'margin-right:10px',
    tools: [{
            xtype: 'combo',
            fieldLabel: 'Batch',            
            allowBlank: false,
            valueField: 'id',
            displayField: 'name',
            name: "batch_id",
            store: 'combo.Batch'
        }, {
            xtype: 'button',
            tooltip: 'Create New Plan',
            action: 'Create',
            iconCls: 'icon-add'
        }, {
            xtype:'button',
            tooltip:'Edit Plan',
            action: "Edit",
            iconCls: 'icon-edit'
        },{
            xtype: 'button',
            tooltip: 'Create with copy',
            iconCls: 'icon-copy',
            action: 'Copy'
        }, {
            xtype: 'button',
            action: "Active",
            iconCls: 'icon-OK',
            tooltip: 'Active Plan',
        }, {
            xtype: 'button',
            action: 'Deactive',
            iconCls: 'icon-cancel',
            tooltip: 'Deactive Plan'
        }, {
            xtype: 'button',
            action: 'Delete',
            iconCls: 'icon-delete',
            tooltip: 'Delete plan',
        }

    ],
    store: 'acc.FeePlanWU',
    columns: [{
        xtype: 'rownumberer',
        width: 40,
        align: 'center',
        text: 'NO'
    }, {
        text: 'Code',
        width: 70 ,        
        dataIndex: 'plan_code'
    }, {
        width:200 ,
        text: 'Plan Name',
        dataIndex: 'plan_name'
    }, {
        text: 'Degree',
        width:120 , 
        dataIndex: 'degree_name'
    }, {
        text: 'Course',
        width:120 ,
        dataIndex: 'course_name'
    }, {
        text: 'Description',
        dataIndex: 'description',
        width:200 ,
    }, {
        header: 'Status',
        dataIndex: 'is_active',
        renderer: function(value) {
            if (value == 0) {
                return "<span style='color:red'><b>Deactive</b></span>"
            } else {
                return "<span style='color:green'><b> Active</b> </span>"
            };
        }
    }],
})