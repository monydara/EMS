/**
 * Created by HENG SOPHAT on 2/7/2016.
 */
Ext.define('ExtDesktop.view.module.accountMaster.Winstudent', {
    extend: 'Ext.window.Window',
    alias: 'widget.accountMasterWinStudent',
    title:'Student List',
    modal:true,       
    width: 800 , 
    height: 500 , 
    layout:'fit',
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
           items:[
            {
                xtype:'grid',
                tbar:[
                    {
                        xtype:'textfield',
                        name:'Search',
                        emptyText:"-- Type for Search Student -- ", 
                        width: 400 , 
                    }
                ],
                store:'sdn.Student',
                columns:[
                    {
                        text:'NO',
                        xtype:'rownumberer' ,
                        width: 50 , 
                        align:'center' , 
                    },{
                        text:'Student ID' , 
                        dataIndex:'student_no'
                    },{
                        text:'Name',
                        dataIndex:'first_name',
                        width: 200 , 
                        renderer:function(value , raw, record){
                            var data = record.getData() ;
                            return value +" "+ data.last_name ;

                        },
                    },{
                        text:'Gender',
                        dataIndex:'gender',
                        renderer:function(value){
                            if (value == "M") {
                                return "Male";
                            }else{
                                return "Female";
                            }
                        }
                    },{
                        text:'DOB',
                        dataIndex:'date_of_birth'
                    },{
                        text:'Phone' , 
                        dataIndex: 'phone'
                    },{
                        flex: 1 , 
                        text:'Address',
                        dataIndex:'address'
                    }

                ], 
                bbar: Ext.create('Ext.PagingToolbar', {
                  store: 'sdn.Student',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
                })
            }
           ]

        });
        me.callParent(arguments);
    },

    buttons:[
        {
            text:'OK',
            iconCls:'icon-ok',
            action:'OK'
        },{
             text:'Cancel',
             iconCls:'icon-cancel',
             action:'Cancel',
             handler:function(){this.up("window").close()}
        }
    ]

});
