Ext.define('ExtDesktop.view.module.faculty.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridFaculty',
    store: 'acd.Faculty',
    title:'Faculty List',
    closable:true, 
    autoScroll:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[    
                  
	                  {
		                xtype:'textfield',
		                name:'search',
		                emptyText:'Enter search keyword here...',
		                width: 450
	                  },'->',{
	                             
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
	                }],
       
            columns: [
                {
                  xtype:'rownumberer',
                  text:'No.',
                  align:'center',
                  width:50
                },{
                    sortable: true,
                    dataIndex: 'code',
                    text: 'Code',
                    width: 120
                },{
                    dataIndex: 'name',
                    text: 'Faculty',
                    flex: 1  
                },{
                    dataIndex: 'khr_name',
                    text: 'មហាវិទ្យាល័យ',
                    flex: 1
                },{
                    sortable: true,
                    dataIndex: 'abbr',
                    text: 'Abbreviation',
                    width: 120
                }
            ],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'acd.Faculty',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});