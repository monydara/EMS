Ext.define('ExtDesktop.view.module.tuitionFee.GridPlanTcDetail', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.tuitionFeeGridPlanTcDetail',
    title: 'Plan Tc Detail',
    width: '40%',
    height: '100%',
    border: true,
    store: 'acc.FeeCatDetailTC',
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
        text: 'Code',
        dataIndex: "plan_num",
        width:70 , 
        field: {
            xtype: 'textfield',
        }
    }, {
        text: 'Description',
        width:200,
        dataIndex: 'description',
        field: {
            xtype: 'textfield'
        },
        
    }, {
        text: 'Term',
        width: 100 ,

        dataIndex: 'term_id',
        field: {
            xtype: 'combo',
            store: 'combo.Term',
            queryMode: 'local',
            valueField: 'id',            
            displayField: 'term_name',

        },
        renderer: function(value) {
            if (value) {
                var store = ExtDesktop.app.getController("TuitionFee").getComboTermStore();
                var rec = store.getById(value);

                return rec.get("term_name");
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