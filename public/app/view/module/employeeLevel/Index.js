Ext.define('ExtDesktop.view.module.employeeLevel.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridEmployeeLevel',
    store: 'EmployeeLevel',
    title: 'Employee Level',
    closable:true, 
    autoScroll:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[    
	                  '->',
	                  { text:'Create',action:'Create',iconCls:'icon-add'},
	                  { text:'Edit',action:'Edit',iconCls:'icon-edit'},
	                  { text:'Delete',action:'Delete',iconCls:'icon-delete'}
	             ],
            columns: [
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{                           
                            dataIndex: 'id',
                            text: 'id',
                            hidden:true
                        },{
                        	dataIndex:'emp_level',
                        	text: 'Level',
                            width:200
                        },{
                        	dataIndex:'khr_emp_level',
                        	text: 'Khr Level',
                        	width:200
                        },{
                        	dataIndex:'description',
                        	text: 'Description',
                        	flex:1
                        },{
                        	dataIndex: 'level_value',
                        	text: 'Value',
                            align:'center'
                        }
            ],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			            store: 'EmployeeLevel',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});