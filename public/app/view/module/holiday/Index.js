Ext.define('ExtDesktop.view.module.holiday.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridHoliday',
    store: 'hr.Holiday',
    title:'Holiday List',
    closable:true,    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                {
                    xtype:'textfield',
                    name:'Search',
                    emptyText:'Enter search keyword here...',
                    width: 450
                },'->',{
                    text:'Advance',
                    action:'ShowAdvanceSearchForm',
                    iconCls:'icon-search'
                },{
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
            columns: [
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },
                        {                           
                            dataIndex: 'code',
                            text: 'Code',
                            flex:1,
                        },
                        {                           
                            dataIndex: 'name',
                            text: 'Holiday Name',
                            flex:1,
                        },
                        {                           
                            dataIndex: 'khr_name',
                            text: 'Holiday Khmer Name',
                            flex:1,
                        },
                        {               
                        	xtype:'datecolumn',
                            dataIndex: 'start_date',
                            text: 'Start Date',
                            width: 200,
                            format:'d-M-Y'
                        },{ 
                        	xtype:'datecolumn',
                            dataIndex: 'end_date',
                            text: 'End Date',
                            width: 200,
                            format:'d-M-Y'
                        },
                        {                           
                            dataIndex: 'acd_year',
                            text: 'Academic Year',
                            flex:1,
                        },
                         {                           
                            dataIndex: 'description',
                            text: 'Description',
                            flex:1,
                        }
            ], 
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
                    store: 'hr.Holiday',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    }

});