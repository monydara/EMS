/**
 * Created by IT on 2/26/2016.
 */
var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.payment.WinSelectStudent', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinSelectStudent',
    title: 'Select student to pay',
    modal: true,
    height: 550,
    width: 900,
    layout: "fit",
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items: [
                {
                    xtype:'grid',
                    name:'GridSelectStudent',
                    store:"acc.AccountMasterBrow",
                    // minHeight: 530,
                    tbar:[
                            {
                                xtype: 'textfield',
                                fieldLabel: 'Filter',
                                name: 'filter',
                                emptyText: '-- Type For Search --',
                                labelWidth: 50,
                                width: 350,
                                labelAlign: 'right'
                            }
                    ],
                    columns:[
                        {
                            header: 'No',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        } ,{
                            header:'Student No',
                            dataIndex:'student_no',
                            width:120,
                            align: 'center'
                        } ,{
                            header:'Name',
                            dataIndex:'student_name',
                            flex:1,
                            align: 'center'
                        }, {
                            header: 'Date of Birth',
                            dataIndex: 'date_of_birth',
                            align: 'center',
                            width: 120,
                            format: 'd-M-Y'
                        },{
                            header: 'Admission No',
                            dataIndex: 'admission_no',
                            width:120,
                            align: 'center',
                        }, {
                            header: 'Degree',
                            dataIndex: 'degree_name',
                            flex: 1

                        },{
                            header:'Course',
                            dataIndex:'course_name',
                            flex:1

                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'acc.AccountMasterBrow',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
                }
            ]
        });
        me.callParent(arguments);
    },
    buttons: [
        {
            text: 'OK',
            iconCls: 'icon-ok',
            action: 'OK'
        }, {
            text: 'Cancel',
            iconCls: 'icon-cancel',
            action: 'Cancel'
        }
    ]

});