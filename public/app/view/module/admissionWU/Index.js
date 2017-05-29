Ext.define('ExtDesktop.view.module.admissionWU.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.admissionWUGrid',
    collapsible: false,
    title: 'Admission WU',
    closable: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar: [{
                xtype: 'container',
                width: '100%',
                items: [
              {

                    xtype: 'panel',

                    bbar: [{
                        xtype: 'textfield',
                        fieldLabel: 'Filter',
                        name: 'filter',
                        emptyText: '-- Type For Search --',
                        labelWidth: 50,
                        width: 350,
                        labelAlign: 'right'
                    }, {
                        text: 'Advance',
                        action: 'AdvanceSearch',
                        hidden:true
                    }, '->',
                    {
                        text:'Active',
                        iconCls:'icon-ok',
                        action:'ActiveAdmission'
                    }, {
                        text: 'Add',
                        iconCls: 'icon-add',
                        action: 'Add'
                    }, {
                        text:'Copy',
                        iconCls:'icon-copy',
                        action:'Copy'
                    },{
                        text: 'Edit',
                        iconCls: 'icon-edit',
                        action: 'Edit'
                    },{
                        text:"Cancel",
                        iconCls:'icon-delete',
                        tooltip:'Cancel Admission ',
                        action:'CancelStudent'
                    }]
                }]
            }

            ],
            columns: [{
                header: 'No',
                xtype: 'rownumberer',
                width: 50,
                align: 'center'
            }, {
                header: 'Image',
                dataIndex: 'photoPath',
                width: 150,
                align: 'center',
                renderer: function(value, raw, record) {

                    return '<img width=140px height=140px src="' + record.get("image_url") + '" />';
                }
            }, {
                header: 'Student Information',
                dataIndex: 'efirstName',
                flex:1,
                renderer: function(value, raw, record) {

                    var studentObj = record.data;
                    var gender = studentObj.gender;

                    if (gender == "M") {
                        gender = "Male";
                    } else {
                        gender = "Female";
                    };
                    var status = studentObj.status;

                    switch (status) {
                        case "N":
                            status = "New";
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

                     var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:70px;'>"+
                        "<div style='padding-bottom:5px'><b>Name <br></div>"+
                        "<div style='padding-bottom:5px'>Student ID <br></div>"+
                        "<div style='padding-bottom:5px'>Gender <br></div>"+
                        "<div style='padding-bottom:5px'>Email <br> </div>"+
                        "<div style='padding-bottom:5px'>Phone <br> </div>"+
                        "<div style='padding-bottom:5px'>Status</div></div></b>";
                        var infoString = labelDiv + "<div style='display:inline-block; width:200px;'> </b>" +
                            "<div style='padding-bottom:5px'>:"+studentObj.first_name + " " + studentObj.last_name +"</div>"+
                            "<div style='padding-bottom:5px'>:<span style='color:blue'> " + studentObj.student_no +"</span>"+"</div>"+
                            "<div style='padding-bottom:5px'>: " + gender +"</div>"+
                            "<div style='padding-bottom:5px'>: " + studentObj.email +"</div>"+
                            "<div style='padding-bottom:5px'>: " + studentObj.phone_no +"</div>"+
                            "<div style='padding-bottom:5px'>: " + status +"</div>"+
                            "</div></div>";
                        return infoString;

                }
            }, {
                header: 'Admission Infomation',
                dataIndex: 'admissionBy',
                flex:1,
                renderer: function(value, raw, record) {
                    var data = record.data;


                    var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:100px;'>"+
                        "<div style='padding-bottom:5px'><b>Batch <br></div>"+
                        "<div style='padding-bottom:5px'>Degree <br></div>"+
                        "<div style='padding-bottom:5px'>Course <br></div>"+
                        "<div style='padding-bottom:5px'>Shift <br> </div>"+
                        "<div style='padding-bottom:5px'>Admission No <br> </div>"+
                        "<div style='padding-bottom:5px'>Reference No <br> </div>"+
                        "<div style='padding-bottom:5px'>Admission Date</div></div></b>";
                        reference_no= data.reference_no == null ? "" : data.reference_no ;
                        var infoString = labelDiv + "<div style='display:inline-block; width:200px;'> </b>" +
                            "<div style='padding-bottom:5px'>: " + data.batch_name+"</div>"+
                            "<div style='padding-bottom:5px'>: " + data.degree_name+"</div>"+
                            "<div style='padding-bottom:5px'>: " + data.course_name +"</div>"+
                            "<div style='padding-bottom:5px'>: " +  data.class_shift_name +"</div>"+
                            "<div style='padding-bottom:5px'>: " +  data.admission_no +"</div>"+
                            "<div style='padding-bottom:5px'>: " +  reference_no +"</div>"+
                            "<div style='padding-bottom:5px'>: " + data.admission_date +"</div>"+
                            "</div></div>";
                        return infoString;


                }
            } ,/*{
                header: "Accounting",
                flex: 1,
                renderer: function(value, raw, record) {
                    var data = record.data;

                    var labelDiv = "<div style='display:flex'><div style='display:inlin-block; width:105px;'><b>"+
                    "<div style='padding-bottom:5px'> Account No.  </div>"+
                    "<div style='padding-bottom:5px'>Cycle Type  </div>"+
                    "<div style='padding-bottom:5px'>Balance </div>"+
                    "<div style='padding-bottom:5px'> Status </div>"+
                    "</b></div>";

                    var infoString = labelDiv + "<div style='display:inline-block; width:200px;'>"+
                        "<div style='padding-bottom:5px'>: " +data.degree_name +"</div>"+
                        "<div style='padding-bottom:5px'>: " + data.course_name +"</div>"+
                        "<div style='padding-bottom:5px'>: " + data.class_shift_name +"</div>"+
                        "<div style='padding-bottom:5px'>: " + data.term_name +"</div>"+
                        "</div></div>";
                    return infoString;
                }
            },{
                xtype:'actioncolumn',
                header:'Action',
                align:'center',
                items:[
                    {
                        iconCls:'icon-ok',
                        tooltip:'Active Student ',
                        handler:function(grid , rowIndex){
                            var ctrl = ExtDesktop.app.getController("AdmissionWU");

                            ctrl.activeStudent(grid , rowIndex);
                        },
                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                            var isDisabled=record.get('status') == "N";

                            return !isDisabled;
                        }
                    },{
                        iconCls:'icon-delete',
                        tooltip:'Cancel Admission Record',
                        handler:function(grid , rowIndex){
                            var ctrl = ExtDesktop.app.getController("AdmissionWU");

                            ctrl.cancelStudent(grid , rowIndex);
                        },
                        isDisabled: function(view, rowIndex, colIndex, item, record) {
                            var isDisabled=record.get("status") == "N";
                            console.log(record.get("status"));

                            return !isDisabled;
                        }
                    }

                ]
            }
*/

            ],
            store: 'admissionWU.Admission',

            bbar: Ext.create('Ext.PagingToolbar', {
                store: 'admissionWU.Admission',
                displayInfo: true,
                displayMsg: 'View {0} - {1} of {2}',
                emptyMsg: "View 0"
            })
        });
        me.callParent(arguments);
    },
    getSuspendAccount: function() {
        var win = Ext.create('Ext.window.Window', {
            title: 'Suspend Account',
            modal: true,
            layout: 'fit',
            closable: false,
            items: [{
                xtype: 'form',
                bodyPadding: 20,
                defaults: {
                    width: 350
                },
                items: [{
                    xtype: 'combo',
                    fieldLabel: 'Suspend Type',
                    emptyText: '-- Select Type --',
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'From',
                    value: new Date()
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'To'
                }, {
                    xtype: 'textarea',
                    fieldLabel: 'Description'
                }
                ]
            }],
            buttons: [{
                text: 'Save',
                iconCls: 'icon-save',
                action: 'Save'
            }, {
                text: 'Cancel',
                iconCls: 'icon-cancel',
                action: 'Cancel',
                handler: function() {
                    win.close();
                }
            }]
        });
        win.show();
    }

});
