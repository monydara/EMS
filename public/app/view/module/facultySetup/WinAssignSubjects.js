/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.facultySetup.WinAssignSubjects', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinAssignSubjects',
    title: 'Assign Subjects',
    layout: 'fit',
    width: 900,
    height: 450,
    //autoScroll:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
                items:[
                    {
                        xtype:'panel',
                        items:[
                            this.form(),
                            {
                                xtype:'panel',
                                layout:'fit',
                                items:[this.grid()]
                            }

                        ]
                    }

                ]
        });
        me.callParent(arguments);
    },

    form:function(){
        var form={
                    xtype:'form',
                    bodyPadding:10,
                    itemId:'form',
                    defaultType:'textfield',
                    //autoScroll:true,
                    fieldDefaults:{
                        width:350,
                        labelAlign:'right',
                        readOnly:true
                    },
                    layout:{
                        type:'table',
                        columns:2,
                        tdAttrs:{
                            align:'right',
                            valign:'top'
                        }
                    },

                    items:[
                        {
                            name:'id',
                            hidden:true
                        },{
                            name:'degree_name',                            
                            fieldLabel:'Degree',
                            
                        },{
                            name:'course_name',
                            fieldLabel:'Faculty',
                            
                        },{
                            name:'standard_name',
                            fieldLabel:'Standard',

                        },{
                            name:'division_name',
                            fieldLabel:'Division',
                        }
                    ]
            };

        return form;
    },

    grid:function(){
        var g={
                    xtype:'grid',
                    columnLines:true,
                    autoScroll:true,
                    height:330,
                    title:'Subject List',
                    store:'acd.SubjectDetail',
                    tools:[                        
                        {
                            xtype:'button',
                            action:'AddSubjectDetail',
                            iconCls:'icon-add'
                        },{
                            xtype:'button',
                            action:'DeleteSubjectDetail',
                            iconCls:'icon-delete'
                        }
                    ],
                    columns:[
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        }, {
                            dataIndex: 'id',
                            hidden: true
                        },{
                            dataIndex: 'degree_id',                            
                            hidden:true
                        },{
                            dataIndex: 'course_id',
                            hidden:true
                        },{
                            dataIndex: 'standard_id',
                            hidden:true
                        },{
                            dataIndex: 'subject_id',
                            hidden:true
                        }, {
                            dataIndex: 'name',
                            text: 'Subject',
                            flex:1
                        }, {
                            dataIndex: 'sessions_per_week',
                            text: 'Sessions/Week',
                            width: 120,
                            align:'right'
                        },{
                            dataIndex: 'total_sessions',
                            text: 'Total Sessions',
                            width: 120,
                            align:'right'
                        },{
                            dataIndex:'total_credits',
                            text:'Total Credits',
                            width: 120,
                            align:'right'
                        },{
                            dataIndex: 'durations_per_session',
                            text: 'Durations/<br>Session(Hrs)',
                            width: 120,
                            align:'right'
                        },{
                            dataIndex: 'total_durations',
                            text:'Durations(Hrs)',
                            width: 120,
                            align:'right'
                        },{
                            xtype:'actioncolumn',
                            text:'Action',
                            width:80,
                            align:'center',
                            items:[
                                {

                                    iconCls:'icon-edit',
                                    tooltip:'Edit Subject Detail.',
                                    handler:function(grid, rowIndex, columnIndex){
                                        var ctrl = ExtDesktop.app.getController("FacultySetup");
                                        ctrl.showFormEditSubjectDeail(grid , rowIndex );
                                    }
                                }
                            ]
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    },
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store:'acd.SubjectDetail',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
        };

        return g;
    }

});