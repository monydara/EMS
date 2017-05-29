Ext.define('ExtDesktop.view.module.courseSetup.WinSubjectSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.WindowSubject',
    stateId: 'stateGrid',
    resizable: false,
    autoShow: false,
    modal:true,
    width: 550,
    height: 500,
    bodyPadding:10,
    layout: 'fit',
    title: 'Search subject',

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
            
                // call grid subject form index
               Ext.create('ExtDesktop.view.module.courseSetup.SubjectList',{
                    title: '' ,  // override title in that form
                    closable:false
               })

            ]
        });
        me.callParent(arguments);
    }

});