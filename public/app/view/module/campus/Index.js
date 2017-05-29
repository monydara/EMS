Ext.define('ExtDesktop.view.module.campus.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCampus',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'Campus',
    title:'Campus List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                  	'->',
                {
                    xtype:'button',
                    text:'Create',
                    action:'Create',
                    iconCls:'icon-add',
                    width: 80
                },{
                    xtype:'button',
                    text:'Edit',
                    action:'Edit',
                    iconCls:'icon-edit',
                    width: 80
                },{
                        xtype:'button',
                        text:'Re-Open',
                        action:'Reopen',
                        iconCls:'icon-refresh',
                        width: 80
                },{
                	xtype:'button',
                    text:'Close',
                    action:'Close',
                    iconCls:'icon-cancel',
                    width: 80
                
                },{
                	xtype:'button',
                    text:'Delete',
                    action:'Delete',
                    iconCls:'icon-delete',
                    width: 80
                }
            ],
            columns: [
                        { 
                            dataIndex: 'id',
                            text: 'ID',
                            hidden: true
                        },{
                            sortable: true,
                            dataIndex: 'campus_code',
                            text: 'CODE',
                            width: 120
                        },{
                            dataIndex: 'campus_name',
                            text: 'CAMPUS',
                            flex: 1  
                        },{
                            dataIndex: 'abbr',
                            text: 'ABBREVIATE',
                            width: 100,
                        },{
                            dataIndex: 'address',
                            text: 'ADDRESS',
                            flex: 1 
                        },{
                            dataIndex: 'phone',
                            text: 'PHONE',
                            width: 120,
                        },{
                            dataIndex: 'email',
                            text: 'EMAIL',
                            width: 120,
                        },{
                            dataIndex: 'director',
                            text: 'DIRECTOR',
                            width: 120,
                        },{
                        	dataIndex: 'status',
                        	text:'STATUS',
                        	width: 80
                        
                        },{
                            xtype: 'datecolumn',
                            width: 120,
                            dataIndex: 'start_date',
                            text: 'CREATED DATE',
                            //format:'d-M-Y'
                        }
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'Campus',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});