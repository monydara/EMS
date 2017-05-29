/**
 * Created by HENG SOPHAT on 10/18/2015.
 */
Ext.define('ExtDesktop.view.search.GridAdmissionList', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridAdmissionList',
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            store:'admissionWU.AdmissionList',
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
                    header:'Name',
                    dataIndex:'name',
                    flex:1
                },{
                    header:'Admission No.',
                    dataIndex:'admission_no',
                    width:120,
                    align:'center'
                },{
                    header:'Degree',
                    dataIndex:'degree',
                    width:120
                },{
                    header:'Course',
                    dataIndex:'course',
                    flex:1
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
                store: 'admissionWU.AdmissionList',
                displayInfo: true,
                displayMsg: 'view {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    }
});
