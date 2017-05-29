Ext.define('ExtDesktop.view.module.tuitionFee.GridPlanWuDetail', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.tuitionFeeGridPlanWuDetail',
    title: 'Plan Wu Detail',
    width: '40%',
    height: '100%',
    border: true,
    store: 'acc.FeeCatDetailWU',
    plugins: Ext.create('Ext.grid.plugin.CellEditing', {
        clicksToEdit: 1
    }),
    selModel: {
        selType: 'cellmodel'
    },
    tools: [{
        xtype: 'button',
        tooltip: 'Create New Plan',
        action: 'Create',
        iconCls: 'icon-add'
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

    }],
    columns: [{
        xtype: 'rownumberer',
        width: 40,
        align: 'center',
        text: 'NO'  
    }, {
        text: 'code',
        width: 70 , 
        dataIndex: "plan_num",
        field: {
            xtype: 'textfield',
        }
    }, {
        text: 'Description',
        dataIndex: 'description',
        field: {
            xtype: 'textfield'
        },
        width:200
    }, {
        text: 'Cycle Type',
        width:150 ,
        dataIndex: 'cycle_type_id',
        field: {
            xtype: 'combo',
            allowBlank: false,
            editable: false,
            store: 'combo.CycleType',
            valueField: 'id',
            displayField: 'cycle_name'
        },
        renderer: function(value) {
            if (value) {
                var store = ExtDesktop.app.getController("TuitionFee").getComboCycleTypeStore();
                var rec = store.getById(value);

                return rec.get("cycle_name");
            } else {
                return "";
            }
        }
    }, {
        text: 'Fee Amount',
        width: 100 ,
        dataIndex: 'fee_amount',
        field: {
            xtype: 'numberfield',
            minValue: 0
        }
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