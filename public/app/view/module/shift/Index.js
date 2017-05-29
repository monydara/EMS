Ext.define('ExtDesktop.view.module.shift.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridShift',
    store: 'Shift',
    title:'Shift List',
    closable:true,  
    columnLines: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[                
                  '->',{                  
	                    text:'Create',
	                    action:'Create',
	                    iconCls:'icon-add'
                  },{                 
	                    text:'Edit',
	                    action:'Edit',
	                    iconCls:'icon-edit'
                  },{                  
	                    text:'Delete',
	                    action:'Delete',
	                    iconCls:'icon-delete'
                  }
            ],
            autoScroll:true,
            columns: [{
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{ 
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{                         
                            dataIndex: 'shift_name',
                            text: 'Shift Name',
                            flex:1
                        },{                                 	
                            dataIndex: 'shift_type',
                            text: 'Shift Type',
                            width: 120,
                            renderer:function(value){
                                return value == "FT" ? "Full Time":"Part Time";
                            }

                        },{                                 	
	                        dataIndex: 'start_time',
	                        text: 'Start Time',
	                        width: 120
                        },{                                 	
	                        dataIndex: 'end_time',
	                        text: 'End Time',
	                        width: 120
                        },{                         
                        	dataIndex: 'description',
                        	text: 'Description',
                        	flex:1
                        }],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Shift',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});