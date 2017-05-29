Ext.define('ExtDesktop.view.module.division.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridDivision',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Division',
    title:'Division List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                  '->',{
                    xtype:'button',
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add',
                    width: 80
                },
                    {
                    xtype:'button',
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit',
                    width: 80
                }
            ],
            columns: [
                      {
                          xtype:'rownumberer',
                          text:'No.',
                          align:'center',
                          width:50
                      },{ 
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{
                            sortable: true,
                            dataIndex: 'code',
                            text: 'Code',
                            width: 120
                        },{
                            dataIndex: 'name',
                            text: 'Name',
                            flex: 1  
                        },{
                            dataIndex: 'khr_name',
                            text: 'Khmer Name',
                            flex: 1  
                        },{
                            dataIndex:'sequence',
                            header:'Sequence',
                            align:'center'
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Division',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});