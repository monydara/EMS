/**
 * Created by hengsophat on 10/14/2015.
 */

var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';

Ext.define('ExtDesktop.view.module.student.WinSuspend', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinSuspendAdmission',
    title: 'Suspend Admission',
    modal: true,
    autoScroll: true,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
                items:[
                    this.formDrop()
                ]
        });
        me.callParent(arguments);
    },
    buttons: [
                {
                    text: 'Ok',
                    iconCls: 'icon-save',
                    action: 'SuspendAdmission'
                },{
                    text:'Close',
                    iconCls:'icon-delete',
                    action:'Close', 
                    handler:function(){
                        alert(123);
                        this.up("window").close();
                    }
                }
    ],

    formDrop:function(){
        var form={
                    xtype:'form',
                    name:'SuspendForm',
                    bodyPadding:10,
                    defaultType: 'textfield',
                    fieldDefaults: {
                        //labelAlign: 'top',
                        msgTarget: 'side',
                        width: 300,
                        style: 'margin-left:5px'
                    },
                    layout: {
                                type: 'table',
                                columns: 2,
                                tdAttrs:{
                                    align:'top'
                                }
                    },
                    items:[
                    {
                        xtype:'hiddenfield', 
                        name:'student_id'
                    },{
                        xtype:'hiddenfield',
                        name:'admission_id'
                    },
                            {
                                fieldLabel:'Student ID',
                                readOnly:true,
                                name:'student_no'
                            },{
                                fieldLabel:'Admission No',
                                readOnly:true,
                                name:'admission_no'
                            },{
                                fieldLabel:'Student Name',
                                readOnly:true,
                                name:'name'
                            },{
                                xtype:'combo',
                                fieldLabel:'Suspend Type',
                                valueField: 'id',
                                displayField: 'name',
                                store:'sdn.SuspendType'

                            },{
                                xtype:'datefield',
                                fieldLabel:'Effective Date',
                                value:new Date(),
                                format:'d-M-Y',
                                submitFormat:'Y-m-d' ,
                                name: 'start_date' ,
                                afterLabelTextTpl: required
                            },{
                                xtype:'datefield',
                                fieldLabel:'End Date',
                                name:'end_date', 
                                submitFormat:'Y-m-d' ,
                                value:new Date(),
                                format:'d-M-Y',
                                afterLabelTextTpl: required
                            },{
                                xtype:'textarea',
                                fieldLabel:'Reason',
                                name:'description',
                                afterLabelTextTpl: required,
                                colspan:2,
                                width:605,
                                height:120
                            }
                    ]
        };
        return form;
    }

});
