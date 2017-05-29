Ext.define('ExtDesktop.view.module.tuitionFeeTC.Index',{
    extend: 'Ext.panel.Panel',
    alias: 'widget.tuitionTC',
    collapsible: false,
    title:'T.C. Fee',
    closable:true,
    bodyPadding:10 ,
    layout : {
        type  : 'vbox',
        align : 'stretch',
        pack: 'start'
    },
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          items:[
                    this.getGridMain(),
                    this.getGridDetail()
            ]
        });
        me.callParent(arguments);
    },
    getGridDetail:function(){
        var grid ={
            xtype:'grid',
            name : 'gridFeePlan',
            flex: 1,
            forceFit : true,
           store:'acc.FeePlanTC',
            border:true,
            columnLines:true,
            tools:[{
                    xtype:'textfield',
                    name:'searchFeePlan',
                    emptyText:'-- Search -- '
                },{
                    xtype:'button',
                    action:'CreateFeePlan',
                    iconCls:'icon-add'
                },{
                        xtype:'button',
                        action:'CopyPlanFee',
                        iconCls:'icon-copy'
                },{
                    xtype:'button',
                    action:'EditFeePlan',
                    iconCls:'icon-edit'
                }
            ],
            title:'T.C. Fee Datail',
            columns:[
                        {header:'No',xtype:'rownumberer',width:50 , align:'center'},
                        {header:'acc_plan_master_id',hidden:true,dataIndex:'acc_plan_master_id'},
                        {header:'Code',width:80,dataIndex:'plan_code',align:'center'},
                        {header:'Plan Name',flex:1,dataIndex:'plan_name'},
                        {header:'Degree',width:180,dataIndex:'degree_name'},
                        {header:'Course',width:180,dataIndex:'course_name'},
                        {
                           header:'Term Fee ($)',
                           align:'center',
                           columns:[
                               {header:'Term One',width:100,dataIndex:'term_one_fee',align:'right'},
                               {header:'Term Two',width:100,dataIndex:'term_two_fee',align:'right'},
                               {header:'Term Three',width:100,dataIndex:'term_three_fee',align:'right'},
                               {header:'Term Four',width:100,dataIndex:'term_four_fee',align:'right'}
                           ]
                        },
                        {header:'Status',width:100,dataIndex:'status',align:'center'},
                        /*{
                            header:'TC Level',
                            xtype:'actioncolumn',
                            align:'center',
                            items:[
                                {
                                    iconCls:'icon-ok',
                                    tooltip:'Fee Level Setup',
                                    handler: function(grid, rowIndex, colIndex) {

                                    }
                                }]
                        }*/
            ]
        };

        return grid ;
    },
    getGridMain: function(){
    	var grid  ={
    			xtype:'grid',
                flex: 1,
                forceFit : true,
                name : 'gridPlanMaster',
                title:'T.C. Fee Detail',
                border:true,
                style:'margin-bottom:10px',
                autoScroll:true,
                store: 'acc.PlanMasterTC',
                columnLines:true,
                tools:[{
                        xtype:'textfield',
                        name:'SearchMaster',
                        emptyText:'-- Search -- '
                    },{
                        xtype:'button',
                        action:'Create',
                        iconCls:'icon-add'
                    },{
                        xtype:'button',
                        action:'Edit',
                        iconCls:'icon-edit'
                    },{
                        xtype:'button',
                        action:'Copy',
                        iconCls:'icon-copy'
                    },{
                        xtype:'button',
                        action:'Delete',
                        iconCls:'icon-delete'
                    }
                ],
    			columns:[
                             {header:'No', xtype:'rownumberer',width:50 , align:'center'},
                             {header:'Plan Master Name',flex:1,dataIndex:'plan_master_name'},
                             {header:'Fiscal Year',width:100,dataIndex:'fiscal_year'},
                             {header:'Effective Date',width:120,
                                 xtype:'datecolumn',
                                 format:'d-M-Y',
                                 dataIndex:'effective_date',align:'center'},
                             {header:'Expired Date',width:120,
                                 xtype:'datecolumn',
                                 format:'d-M-Y',
                                 dataIndex:'expired_date',align:'center'},
                             {header:'Rate(KHR)',width:120,dataIndex:'khr_rate',align:'right'},
                             {header:'Description',flex:1,dataIndex:'description'},
                             {
                                header:'Action',
                                xtype:'actioncolumn',
                                align:'center',
                                items:[
                                    {
                                        iconCls:'icon-ok',
                                        tooltip:'Active ',
                                        handler: function(grid, rowIndex, colIndex) {
                                            var store = grid.getStore(),
                                            rec = store.getAt(rowIndex);
                                            ExtDesktop.app.getTuitionFeeController().activeTutionFee(store , rec ,  grid);

                                        },
                                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                                            var isDisabled = record.get('is_active') == 1;
                                            return isDisabled;
                                        }
                                    },{
                                        iconCls:'icon-cancel',
                                        tooltip:'Deactive',
                                        handler: function(grid, rowIndex, colIndex) {
                                            var store = grid.getStore(),
                                            rec = store.getAt(rowIndex);
                                            ExtDesktop.app.getTuitionFeeController().deactiveTutionFee(store , rec , grid);

                                        },
                                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                                            var isDisabled = record.get('is_active') != 1;
                                            return isDisabled;
                                        }
                                    }
                                ]
                            }
    			],
                 bbar: Ext.create('Ext.PagingToolbar', {
                    store: 'acc.PlanMasterTC',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
                })
    	};

    	return grid;


    }

});


