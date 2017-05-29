Ext.define('ExtDesktop.view.module.aRMonitor.Index',{
    extend: 'Ext.panel.Panel',
    alias: 'widget.arMonitor',
    collapsible: false,
    title:'AR Monitor',
    closable:true,
    layout:'hbox',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          
          items:[
                
                this.getGridInvoice(),
                this.getGridComment()
              
                 
            ]
        });
        me.callParent(arguments);
    },
    getGridComment:function(){
        var grid ={
            xtype:'grid',
            width:'29%',
            border:true,
            height:'100%',
            style:'margin-left:10px',
            tools:[
                {   
                    xtype:'button',
                    iconCls:'icon-add',
                    handler:function(){
                        var win = Ext.create('Ext.window.Window',{
                            title:'Comment Form',
                            bodyPadding:20 , 
                            items:[
                                {
                                    xtype:"textarea",
                                    fieldLabel:'Comment',
                                    width:400
                                }

                            ],
                            modal:true,
                            buttons:[
                                {
                                    text:'Save',
                                    iconCls:'icon-save',
                                    handler:function(){
                                        win.close()
                                    }
                                },{
                                    text:'Cancel',
                                    iconCls:'icon-cancel',
                                    handler:function(){
                                        win.close();
                                    }
                                }
                            ]
                        });
                        win.show();
                    }
                }
            ],
            title:'Comment List',
            columns:[
                {
                    text:'Date'
                },{
                    text:'Comment'
                },{
                    text:'By'
                }

            ]
        };

        return grid ;
    },
    getGridInvoice: function(){
    	var grid  ={
    			xtype:'grid',
                width:'70%',
                height:'100%',
                title:'Invoice List',
                border:true,
                autoScroll:true,
                tools:[
                    {
                        xtype:'textfield',
                        emptyText:'-- Search --',
                        style:'border-radius:10px'
                        
                    }
                ],
    			store:Ext.create('Ext.data.Store',{
                    fields:['name','batch','degree','course','phone','inv_no','amount','penalty_amount','issue_date','alert_type','action'],
                    data:[
                        { name:'Chan Da' , batch:'BA-01' , degree:'Bachelor' , course:'IT' , inv_no:'000001' , amount:'200' , penalty_amount:'10.00', issue_date:'01-Mar-2015', alert_type:'None' , action:'Penalty'},
                        { name:'Phea Ro' , batch:'BA-01' , degree:'Bachelor' , course:'IT' , inv_no:'000001' , amount:'200' , penalty_amount:'10.00', issue_date:'01-Mar-2015', alert_type:'Call' , action:'Penalty'},
                        { name:'Pha Den' , batch:'BA-01' , degree:'Bachelor' , course:'IT' , inv_no:'000001' , amount:'200' , penalty_amount:'10.00', issue_date:'01-Mar-2015', alert_type:'SMS' , action:'Penalty'},
                        { name:'Tha Rith' , batch:'BA-01' , degree:'Bachelor' , course:'IT' , inv_no:'000001' , amount:'200' , penalty_amount:'0.00', issue_date:'01-Mar-2015', alert_type:'Email' , action:'Lock'},
                        { name:'Bun Phea' , batch:'BA-01' , degree:'Bachelor' , course:'IT' , inv_no:'000001' , amount:'200' , penalty_amount:'0.00', issue_date:'01-Mar-2015', alert_type:'None' , action:'Warning'},
                    ]

                }),
    			columns:[
			         {header:'Student Name',width:200,dataIndex:'name'},
			         {header:'Batch',width:80,dataIndex:'batch'},
                     {header:'Degree',width:120,dataIndex:'degree'},
                     {header:'Course',width:120,dataIndex:'course'},
                     {header:'Phone',width:120,dataIndex:'phone'},
                     {header:'Invoice No.',width:120,dataIndex:'inv_no'},
                     {header:'Amount',width:120,dataIndex:'amount'},
                     {header:'Penalty Amount',width:120,dataIndex:'penalty_amount'},
                     {header:'Issue Date',width:120,dataIndex:'issue_date'},                        
                     {header:'Alert Type',width:120,dataIndex:'alert_type'},                        
			         {header:'Action',width:160,dataIndex:'action'},
                     {  
                        header:'Extend Date'
                     }  ,
                     {
                        header:'Extend',
                        xtype:'actioncolumn',
                        align:'center',
                        width:100 ,
                        items:[
                            {
                                iconCls:'icon-extend',
                                handler:function(){
                                    var win = Ext.create('Ext.window.Window',{
                                        title:'Extend Form',
                                        bodyPadding:20 ,
                                        items :[
                                            {
                                                xtype:'datefield',
                                                fieldLabel:'Extend Date',
                                                width:400
                                            },{
                                                xtype:'textarea',
                                                width:400,                                                
                                                fieldLabel:'Reason'
                                            }
                                        ],
                                        buttons:[
                                            {
                                                text:'Save',
                                                iconCls:'icon-save',
                                                handler:function(){
                                                    win.close()
                                                }
                                            },{
                                                text:'Cancel',
                                                iconCls:'icon-cancel',
                                                handler:function(){
                                                    win.close();
                                                }
                                            }
                                        ]

                                    });

                                    win.show();
                                    win.left();
                                }
                            }
                        ]

                    }  			        
    			],
                 bbar: Ext.create('Ext.PagingToolbar', {
                  
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
                })
    	};
    	
    	return grid;
    	
    	
    }

});


