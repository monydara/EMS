Ext.define('ExtDesktop.view.module.courseSetup.CoursesListWU', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridCourse',
    stateId: 'stateGrid',
    collapsible: false,
    store: 'CourseWUStore',
    // title:'Course WU List',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[
                  
                  {
	                xtype:'textfield',
	                name:'keywordWU',
	                emptyText:'Enter search keyword here...',
                    height: 35,
	                width: 200
                  }, '->' ,
                  {
                    xtype:'button',
                    action:'addCourseWU',
                    text:'Ok',
                    width:40,
                    height:35,
                  }
            ],
            columns: [
                      	{
                          xtype:'rownumberer',
                          text:'No.',
                          align:'center',
                          width:50
                      	},{
                            sortable: true,
                            dataIndex: 'code',
                            text: 'Code',
                             width: 100
                        },{
                            dataIndex: 'name',
                            text: 'Course',
                            flex: 1  
                        }/*,{
                            text:'ឈ្មោះវគ្គសិក្សា',
                            dataIndex:'khr_name',
                            flex:1
                        },{
                            sortable: true,
                            dataIndex: 'abbr',
                            text: 'Abbreviation',
                            width: 120
                        }*/
            ],
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          	store: 'CourseWUStore',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});