Ext.define('ExtDesktop.view.module.courseSetup.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.courseSetup',
    collapsible: false,
    title:'Course Setup',
    closable:true,
    layout:'hbox',
    modal:true,
    autoScroll:true,
    initComponent: function() {
        ExtDesktop.app.getController('CourseSetup').tmpDegreeId = null;    // to reset the global variable in controller CourseSetup when initialize view
        ExtDesktop.app.getController('CourseSetup').tmpCourseId = null;
        ExtDesktop.app.getController('CourseSetup').tmpDegreeCourseId = null;
        ExtDesktop.app.getController('CourseSetup').tmpCourseSubjectId = null;
        ExtDesktop.app.getController('CourseSetup').removeCourseStore();
        ExtDesktop.app.getController('CourseSetup').removeSubjectStore();

        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:'panel',
                     bodyPadding:10,
                  //  bodyStyle: 'margin: 10px; padding: 5px 3px;',
                    width:200,
                    height:'100%',
                    name:'buttonGroup',
                    defaults:{ width:200 , height:'18%'},
                    defaultType:'button',
                    items:this.getButtonGroup()
                },
                {
                    xtype:'panel',
                    name:'formContent',
                    bodyPadding:10 ,
                   // bodyStyle: 'margin: 10px; padding: 5px 3px;',
                    height:'100%',
                    width:520,
                    layout: 'fit',
                    items:[
                        {
                            xtype:'grid',
                            title:'Courses',
                            name:'course',
                            store:'DegreeCourseStore',
                            frame:true,
                            autoScroll:true,
                            height:230,
                            tools:[
                                {
                                    xtype:'button',
                                    iconCls:'icon-add',
                                    tooltip:'Add Course to Degree',
                                    action:'AddCourse'
                                }
                            ],
                            columns:[
                                {
                                    header:'NO',
                                    xtype:'rownumberer',
                                    width:50 ,
                                    align:'center'
                                },{
                                    header:'CODE',
                                    width:100,
                                    dataIndex:'code'
                                },{
                                    header:'NAME',
                                    flex:1   ,
                                    dataIndex:'name'
                              /*  },{
                                    header:'ABBR',
                                    width:100   ,
                                    dataIndex:'abbr'*/
                                }
                                ,{
                                    xtype:'actioncolumn',
                                    header:'Action',
                                    align:'center',
                                    width:80,
                                    items:[
                                        {
                                            iconCls:'icon-delete',
                                            tooltip:'Delete Record', 
                                            handler:function(grid, rowIndex, columnIndex){
                                                var controller = ExtDesktop.app.getController('CourseSetup');
                                                controller.removeCourse(grid, rowIndex);
                                            }
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype:'panel',
                    name:'formContent',
                    //bodyPadding:10 ,
                    bodyStyle: 'padding: 0px 0px 10px 0px;',   // top,right,bottom,left
                    height:'100%',
                    width:520,
                    layout: 'fit',
                    items:[
                        {
                            xtype:'grid',
                            title:'Subjects',
                            name:'subject',
                            frame:true,
                            store:'CourseSubjectStore',
                            style:'margin-top:10px',
                            height:230 ,
                            autoScroll:true,
                            tools:[
                                   {
                                        xtype:'button',
                                        iconCls:'icon-add',
                                        tooltip:'Add Subjects to Courses',
                                        action:'AddSubject'
                                    }
                            ],
                            columns:[
                                {
                                    header:'NO',
                                    xtype:'rownumberer',
                                    width:50 ,
                                    align:'center'
                                },{
                                    header:'CODE',
                                    width:100,
                                    dataIndex:'code'

                                },{
                                    header:'NAME',
                                    flex:1   ,
                                    dataIndex:'name'
                                },{
                                    xtype:'actioncolumn',
                                    header:'Action',
                                    align:'center',
                                    width:80,
                                    items:[
                                        {
                                            iconCls:'icon-delete',
                                            tooltip:'Delete Record', 
                                            handler:function(grid, rowIndex, columnIndex){
                                                var controller = ExtDesktop.app.getController('CourseSetup');
                                                controller.removeSubject(grid, rowIndex);
                                            }
                                        }
                                    ]
                                }
                            ] 
                        }

                    ]
                              
                }
            ]
        });
        me.callParent(arguments);
    },
    getButtonGroup:function(){
        var items=[
            {               
                text:'Short Course',
                scale: 'large',
                iconAlign: 'top',
                // iconCls:'icon-associate',
                action:'ShortCourse',
                toggleGroup: 'menu'
                
            },{               
                text:'English Course',
                action:'EnglishCourse',
                scale: 'large',

           /*     toggleGroup: 'menu'
            },
            {               
                text:'Associate',
                scale: 'large',
                iconAlign: 'top',
                // iconCls:'icon-associate',
                action:'Associate',
                toggleGroup: 'menu'
            },{               
                text:'Bachelor',
                action:'Bachelor',
                scale: 'large',
                toggleGroup: 'menu'
            },{                
                text:'Master',
                action:'Master',
                scale: 'large',
                toggleGroup: 'menu'
            },{
                text:'Doctor',
                action:'Doctor',
                scale: 'large',
                toggleGroup: 'menu'*/
            }
        ]

        return items;

    }

});