Ext.define('ExtDesktop.view.module.academicYear.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridAcademicYear',    
    collapsible: false,
    store: 'AcademicYear',
    title:'Academic Year',
    closable:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                  	'->', {
                            xtype:'button',
                            text:'Create',
                            action:'Create',
                            iconCls:'icon-add'
                        },{
                            xtype:'button',
                            text:'Edit',
                            action:'Edit',
                            iconCls:'icon-edit'
                        },{
                            xtype:'button',
                            text:'Delete',
                            action:'Delete',
                            iconCls:'icon-delete'
                        }
            ],
            columns: [
                     {
                        xtype:'rownumberer',
                        text:'No',
                        align:'center',
                        width:50
                     } ,{ 
                         dataIndex: 'id',
                         text: 'ID',
                         hidden: true
                     },{
                         sortable: true,
                         dataIndex: 'code',
                         text: 'Code',
                         width: 200
                     },{
                         dataIndex: 'name',
                         text: 'Description',
                         flex:1
                     },{
                         xtype: 'datecolumn',
                         width: 200,
                         dataIndex: 'start_date',
                         text: 'Start Date',
                         format:'d-M-Y'
                     },{
                         xtype: 'datecolumn',
                         dataIndex: 'end_date',
                         text: 'End Date',
                         format:'d-M-Y',
                         width: 200,
                         flex:1
                     }
            ],          
            bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'AcademicYear',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: 'View 0'
                    })
        });
        me.callParent(arguments);
    }
});