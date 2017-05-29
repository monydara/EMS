Ext.define('ExtDesktop.view.module.facultySetup.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.FmFacultySetup',
    collapsible: false,
    title:'Faculty Setup',
    closable:true,
    //layout:'hbox',
    modal:true,
    autoScroll:true,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items: [

                me.formDegree(),me.panelCourseAndStandard()

            ],
         /*   buttons: [
                    {text: '<b>Save</b>', action: 'Save', iconCls: 'icon-save',disabled:true},
                    {text: '<b>Unlock</b>', action: 'Unlock', iconCls: 'icon-save'}
                ]*/
        });
        me.callParent(arguments);
    },

    formDegree:function(){
        var f={
                    xtype:'form',
                    width:'100%',
                    height:'100%',
                    defaultType:'textfield',
                    fieldDefaults:{
                        width:320,
                        labelAlign:'right'
                    },
                    bodyPadding:10,
                    items:[
                        {
                            xtype:'fieldcontainer',
                            layout:'hbox',
                            items:[
                                {
                                    name:'degree_id',
                                    xtype:'combo',
                                    fieldLabel:'Degree',
                                    store: 'combo.DegreeWU',
                                    queryMode: 'local',
                                    displayField: 'name',
                                    valueField: 'id',
                                    editable: false,
                                    width: 320
                                },{
                                    xtype:'button',
                                    text:'P',
                                    margin:'0 0 0 5',
                                    action:'Populate'
                                }
                            ]
                        }
                    ]
        };

        return f;
    },

    panelCourseAndStandard:function(){
        var panel={
                        xtype:'panel',
                        layout:{
                                    type:'table',
                                    columns:4,
                                    tdAttrs: {
                                        valign: 'top'
                                    }
                        },
                        height:'100%',
                        bodyPadding:10,
                        name:'Content',
                        items:[
                                this.gridCourses(),this.gridStandard(),this.gridDivision()
                        ]
        };

        return panel;
    },

    gridCourses:function(){
        var g={
                    xtype:'grid',
                    itemId:'facultyList',
                    width:450,
                    height:400,
                    title:'Faculty List',
                    store:'acd.DegreeCourse',
                    border:true,
                    autoScroll:true,
                    margin:'0 10 0 0',
                    tools:[
                       
                        {
                            xtype:'button',
                            action:'AddFaculty',
                            iconCls:'icon-add'

                        },{
                            xtype:'button',
                            action:'RemoveFaculty',
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
                            dataIndex: 'code',
                            text: 'Code',
                            width: 120
                        },{
                            dataIndex: 'name',
                            text: 'Faculty',
                            flex: 1
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    }
                };
        return g;
    },

    gridStandard:function(){
        var g={
                    xtype:'grid',
                    name:'standardList',
                    title:'Standard List',
                    width:310,
                    height:400,
                    border:true,
                    margin:'0 10 0 0',
                    autoScroll:true,
                    store:'acd.FacultyStandard',
                    tools:[
                        
                        {
                            xtype:'button',
                            action:'AddStandard',
                            iconCls:'icon-add'

                        },{
                            xtype:'button',
                            action:'DeleteStandard',
                            iconCls:'icon-delete'
                        }
                    ],
                    columns:[
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{
                            dataIndex: 'name',
                            text: 'Standard',
                            flex: 1
                        }
                    ],
                    viewConfig: {
                        enableTextSelection: true
                    }
                };

        return g;
    },


    gridDivision:function(){
        var g={
            xtype:'grid',
            name:'divisionList',
            title:'Division List',
            width:310,
            height:400,
            store:'acd.StandardDivision',
            border:true,
            margin:'0 10 0 0',
            autoScroll:true,
            tools:[
                {
                    xtype:'button',
                    action:'AssignSubjects',
                    text:'Assign Subjects'
                },
                
                {
                    xtype:'button',
                    action:'AddDivision',
                    iconCls:'icon-add'

                },{
                    xtype:'button',
                    action:'DeleteDivision',
                    iconCls:'icon-delete'
                }
            ],
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No.',
                    align:'center',
                    width:50
                },{
                    dataIndex: 'degree_id',
                    hidden:true
                },{
                    dataIndex: 'division_name',
                    text: 'Division',
                    flex: 1
                }
            ],
            viewConfig: {
                enableTextSelection: true
            }
        };

        return g;
    },


    gridSubjects:function(){
        var g={
                xtype:'grid',
                name:'subjectList',
                title:'Subject List',
                width:310,
                height:380,
                border:true,
                margin:'0 10 0 0',
                autoScroll:true,
                tbar:[
                    '->',
                    {
                        xtype:'button',
                        action:'AddSubject',
                        iconCls:'icon-add'

                    },{
                        xtype:'button',
                        action:'DeleteDivision',
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
                    },{
                        dataIndex: 'name',
                        text: 'Subject',
                        flex: 1
                    }
                ],
                viewConfig: {
                    enableTextSelection: true
                }
            };

            return g;
        }

});
