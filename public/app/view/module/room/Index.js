Ext.define('ExtDesktop.view.module.room.Index',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridRoom',
    store: 'RoomS',
    title:'Room List',
    closable:true,    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[                
				{
				    xtype:'textfield',
				    name:'search',
                    fieldLabel:'Search',
				    emptyText:'Enter search keyword here...',
				    width: 450
				  },'->',{                  
			                    text:'Create',
			                    action:'Create',
			                    iconCls:'icon-add'
                },
                 {                 
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
                        },{
                            dataIndex: 'code',
                            text: 'Code'
                        },{                         
                            dataIndex: 'name',
                            text: 'Room name',
                            width: 200
                        },{                         
                            dataIndex: 'khr_name',
                            text: 'ឈ្មោះបន្ទប់',
                            width: 200
                        },{                                 	
                            dataIndex: 'max_seat',
                            text: 'Maximum Seat',
                            width: 200
                        },{                         	
                            dataIndex: 'description',
                            text: 'Description',
                            flex:1
                        }
            ],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'RoomS',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});