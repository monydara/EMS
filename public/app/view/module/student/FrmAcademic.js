Ext.define('ExtDesktop.view.module.student.FrmAcademic', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.FmAcademic',
    name:'basicInfo',
    layout: {type: 'table', columns: 3},
    defaultType: 'textfield',
    autoScroll: true,
    title:'Academic',
    store:Ext.create("ExtDesktop.store.admission.Admission"),
    height:270,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
               tbar:[
                   {
                       text: 'Drop',
                       //iconCls: 'icon-delete',
                       action: 'DropAdmission'
                   },{
                       text: 'Suspend',
                       //iconCls: 'icon-delete',
                       action: 'SuspendAdmission'
                   },{
                       text: 'More Action',
                       //iconCls: 'icon-delete',
                       action: 'More',
                       menu: [
                           {
                               text:'Show Detail',
                               id:'ShowDetail'
                           },{
                                text:'Re-Activate',
                                id:'ReActivate'
                           },{
                                text:'Change Course',
                                id:'ChangeCourse'
                           },{
                                text:'Change Level',
                                id:'ChangeLevel'
                           }/*,{
                               text:'Upgrade',
                               id:'Upgrade'
                           }*/,{
                               text:'Transfer Out',
                               id:'TransferOut'
                           },/*{
                               text:'Enroll Class',
                               id:'enrollClass'
                           }*/
                       ]
                   }
               ],
               columns:[
                   {
                       header: 'No',
                       xtype: 'rownumberer',
                       width: 50,
                       align: 'center'
                   },{
                       header: 'Admission No',
                       dataIndex:'admission_no',
                       width: 120,
                       align: 'center'
                   },{
                       header: 'Reference No',
                       dataIndex:'reference_no',
                       width: 120,
                       align: 'center'
                   },{
                       header: 'Degree',
                       dataIndex:'degree_name',
                       width: 120
                   }, {
                       header: 'Course',
                       dataIndex: 'course_name',
                       flex:1,
                   }, {
                       header: 'Academic Year',
                       dataIndex: 'acd_year',
                       width: 120
                   },{
                       header: 'Shift',
                       dataIndex: 'shift',
                       width: 120
                   },{
                       header: 'Status',
                       dataIndex:'status',
                       width: 100,
                       align: 'center',
                       renderer: function(value, raw, record) {
                           var status = value;
                           if (status == "N") {
                               status = "New";
                           } else if (status == "A") {
                               status = "Active";
                           }else if (status == "F") {
                               status = "Finished";
                           }else if (status == "S"){
                              status ="Suspend"
                           }else if (status == "D"){
                              status = "Drop"
                           } else {
                               status = "Cancel"
                           };
                           return status;
                       }
                  }
                   /* ,{
                       xtype: 'actioncolumn',
                       width: 100,
                       header:'Action',
                       items:[
                           {
                               xtype:'button',
                               text:'View',
                               tooltip: 'Academic Detail'
                           }
                       ]
                   }*/
               ],
                bbar: Ext.create('Ext.PagingToolbar', {
                    //store: 'sdn.StudentDetail',
                    displayInfo: true,
                    displayMsg: 'View {0} - {1} of {2}',
                    emptyMsg: "View 0"
                }),
                viewConfig: {
                    enableTextSelection: true
                }

        });
        me.callParent(arguments);
    }
});