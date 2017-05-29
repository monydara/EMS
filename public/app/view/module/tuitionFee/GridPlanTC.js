Ext.define('ExtDesktop.view.module.tuitionFee.GridPlanTC', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.tuitionFeeGridPlanTC',
    title: 'Plan TC',   
    width: '58%',
    border: true,
    style: 'margin-right:10px',
    tools: [

       /* {
            xtype: 'combo',
            name: 'term_id',
            store: 'combo.Term',
            valueField: 'id',
            allowBlank: false,
            displayField: 'term_name',
            fieldLabel: 'Term'
        }, */{
            xtype: 'combo',
            fieldLabel: 'Tuition Time',
            name: 'tuition_time_id',
            store: 'combo.TuitionTime',
            allowBlank: false,
            queryMode: 'local',
            valueField: 'id',
            displayField: 'tuition_name'
        },{
            xtype: 'button',
            tooltip: 'Create New Plan',
            action: 'Create',
            iconCls: 'icon-add'
        },{
            xtype:'button',
            tooltip:'Edit Plan',
            iconCls:'icon-edit',
            action:"Edit",
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
    store: 'acc.FeePlanTC',
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
        text: 'Plan Name',
        dataIndex: 'plan_name'
    }, {
        text: 'Degree',
        dataIndex: 'degree_name',
        width:200 
    }, {
        text: 'Course',
        dataIndex: 'course_name',
        width:200 
        
    }, {
        text: 'Description',
        dataIndex: 'description',
        width: 300 
        
    }, {
        header: 'Status',
        dataIndex: 'is_active',
        width:200 ,

        renderer: function(value) {
            if (value == 0) {
                return "<span style='color:red'><b>Deactive</b></span>"
            } else {
                return "<span style='color:green'><b> Active</b> </span>"
            };
        }
    }],
})