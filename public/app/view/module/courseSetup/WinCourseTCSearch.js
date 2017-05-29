Ext.define('ExtDesktop.view.module.courseSetup.WinCourseTCSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.WindowCourse',
    stateId: 'stateGrid',
    width       : 550,
    height: 500,
    bodyPadding:10, 
    layout: 'fit',
    /*layout: fit,*/
    resizable: false,
    autoShow: false,
    modal:true,
    
    title: 'Search TC course' ,

    
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
            
                // call other
               Ext.create('ExtDesktop.view.module.courseSetup.CoursesListTC',{
                    closable:false

               })

            ]
        });
        me.callParent(arguments);
    }

});