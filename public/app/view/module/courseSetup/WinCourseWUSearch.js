Ext.define('ExtDesktop.view.module.courseSetup.WinCourseWUSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.WindowCourse',
    stateId: 'stateGrid',
    width       : 550,
    height: 500,
    bodyPadding:10, 
    layout: 'fit',
    resizable: false,
    autoShow: false,
    modal:true,
    title: 'Search WU course'  ,
    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
            
                // call other view
               Ext.create('ExtDesktop.view.module.courseSetup.CoursesListWU',{         
                    closable:false  // overiding config
               })

            ]
        });
        me.callParent(arguments);
    }

});