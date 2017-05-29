Ext.define('ExtDesktop.view.module.classEnrollment.WinSelectMember', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinSelectMember',
    title: 'Admission List',
    layout: 'fit',
    width: 800,
    height: 450,
    initComponent: function() {
        var me = this;
        var winAdmission = this.winAdmission;
        var store = Ext.create("ExtDesktop.store.admission.Admission"); 
        store.proxy.extraParams ={
            type: 'TC' , 
            admission_status:"A"
        }; 
        store.load();

        Ext.applyIf(me, {
            items: [
                {
                    xtype:'grid',
                    store:store,
                    columnLines:true,
                    tbar: [{
                        xtype: 'textfield',
                        emptyText: '-- Type Here To Search --',
                        name: 'filter',
                        labelAlign: 'right',
                        width: 380
                    }],
                    columns:[
                        {
                            header: 'No',
                            align: 'center',
                            width: 50,
                            xtype:'rownumberer'
                        },{
                            header:'Student ID',
                            dataIndex:'student_no',
                            width:100,
                            align:'center'
                        },{
                            header:'Admission No.',
                            dataIndex:'admission_no',
                            width:120,
                            align:'center'
                        },{
                            header:'Name',
                            dataIndex:'student_name',
                            flex:1
                       /* },{
                            header:'Degree',
                            dataIndex:'degree',
                            width:120
                        },{
                            header:'Course',
                            dataIndex:'course',
                            flex:1*/
                        },{
                            header:'Status',
                            dataIndex:'status',
                            width:100,
                            align:'center',
                            renderer: function(value, raw, record) {
                                var status='';
                                switch (value) {
                                    case "N":
                                        status= "New";
                                        break;
                                    case "A":
                                        status = "Active";
                                        break;
                                    case "D":
                                        status = "Drop";
                                        break;
                                    case "S":
                                        status = "Suspend";
                                        break;
                                    case "C":
                                        status = " Cancel";
                                        break;

                                }
                                return status;
                            }
                        },{
                            header:'Record Status',
                            dataIndex:'record_stat',
                            width:100,
                            align:'center',
                            renderer: function(value, raw, record) {
                                var status='';
                                switch(value){
                                    case "C":
                                        status='Closed'
                                        break;
                                    case "O":
                                        status='Open'
                                        break;
                                };

                                return status;
                            }
                        }
                    ],
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: store,
                        displayInfo: true,
                        displayMsg: 'view {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })

                }
            ]
        });
        me.callParent(arguments);
    }
});
