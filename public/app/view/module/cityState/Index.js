Ext.define('ExtDesktop.view.module.cityState.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCityState',
    store: 'sdn.CityState',
    title: 'CityState',
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
                            hidden:true//hide on interface
                        },{
                        	dataIndex:'city_code',
                        	text: 'City Code',
                            
                            width:100
                        },{
                        	dataIndex:'city_name',
                        	text: 'City Name',
                        	width:300
                        },{
                            dataIndex: 'city_name_khr',
                            text: 'City Name khr',
                            width:300
                        },{
                        	dataIndex:'description',
                        	text: 'Description',
                        	flex:1,

                         }
            ],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			            store: 'sdn.CityState',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});