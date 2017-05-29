/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.classEnrollmentWU.Index', {
    extend: 'Ext.panel.Panel',
    modal: true,
    closable: true,
    alias: 'widget.WUClassMembers',
    title: 'Class Members WU',
    autoScroll: true,
    resizeable: false,
    maximized: true,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items: [
                      me.formClass(),
                      me.gridStudentList()
            ],
            buttons: [
                    {text: '<b>Save</b>', action: 'Save', iconCls: 'icon-save',disabled:true},
                    {text: '<b>Unlock</b>', action: 'Unlock', iconCls: 'icon-save'}
                ]
        });
        me.callParent(arguments);
    },

    formClass:function(){
        var form={
                    xtype:'form',
                    defaultType:'textfield',
                    fieldDefaults:{
                                    width:350,
                                    readOnly:true,
                                    labelAlign:'right'
                    },
                    margin:10,
                    layout:{
                        type:'table',
                        columns:3,
                        tdAttrs: {
                            valign: 'top'
                        }
                    },
                    items:[
                        {
                            name:'class_id',
                            hidden:true
                        },{
                            name:'class_code',
                            fieldLabel:'Class Code'
                        }, {
                            xtype: 'fieldcontainer',
                            layout: 'hbox',
                            items: [
                                {
                                    name: 'class_name',
                                    fieldLabel: 'Class Name',
                                    xtype: 'textfield',
                                    width: 280
                                }, {
                                    xtype: 'button',
                                    text: '...',
                                    margin: '0 0 0 5',
                                    action: 'SelectClass'
                                },{
                                    xtype:'button',
                                    text:'P',
                                    margin:'0 0 0 5',
                                    action:'Populate'
                                }
                            ]
                        },{
                            name:'batch',
                            fieldLabel:'Batch'
                        },{
                            name:'academic_year',
                            fieldLabel:'Academic Year'
                        },{
                            name:'standard',
                            fieldLabel:'Standard'
                        },{
                            name:'division_name',
                            fieldLabel:'Division'
                        },{
                            name:'session',
                            fieldLabel:'Shift'

                        }, {
                            name:'class_room',
                            fieldLabel:'Room'
                        },{
                            name: 'status',
                            fieldLabel:'Status'
                        },{
                            name:'status', 
                            xtype:'hiddenfield'
                        }
                    ]
                };
        return form;
    },


    gridStudentList:function(){
        var grid={
        xtype:'grid',
        autoScroll:true,
        store: 'sdn.StudentListEnrollmentWU',
        title:'Student List',
        name:'GridEnrolledStudents',
        columnLines :  true ,
        viewConfig: {
            getRowClass: function(record, id) {
                //console.log("testing in grid row ",record.get("is_del") == true  )
                return record.get("is_del") == true ? "hidden" : "row-error";
            }
        },
        tbar:[
            '->',{
                xtype: 'button',
                text: 'Add Members',
                action: 'Add',
                iconCls: 'icon-add', 
                disabled:true , 
            },{
                xtype: 'button',
                text: 'Remove Members',
                disabled:true , 
                action: 'Remove',
                iconCls: 'icon-delete'
            },{
                xtype: 'button',
                text: 'Refresh',
                action: 'Refresh',
                iconCls: 'icon-refresh'
            }],
            columns: [
                        {
                            xtype: 'rownumberer',
                            text: 'No.',
                            align: 'center',
                            width: 50
                        },{
                            dataIndex:'id',
                            name:'id',
                            hidden:true
                        },{
                            dataIndex:'student_id',
                            name:'student_id',
                            hidden:true
                        },{
                            dataIndex:'admission_id',
                            name:'admission_id',
                            hidden:true
                        },{
                            dataIndex:'student_no',
                            name:'student_no',
                            header:'Student ID',
                            width:160,
                            align:'center'
                        },{
                            dataIndex:'admission_no',
                            header:'Admission No.',
                            width:160
                        }, {
                            dataIndex: 'name',
                            header: 'Name',
                            flex: 1
                        },{
                            dataIndex: 'enroll_date',
                            header: 'Member Date',
                            format:'d-M-Y',
                            width: 120
                        },{
                            header:'Status',
                            dataIndex:'status',
                            width:140,
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
                        }
                    ]
                };
                return grid;
            }
});
