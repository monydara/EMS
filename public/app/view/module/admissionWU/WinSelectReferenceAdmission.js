Ext.define('ExtDesktop.view.module.admissionWU.WinSelectReferenceAdmission', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinSelectReferenceAdmission',
    title: 'Admission List',
    layout: 'fit',
    width: 960,
    height: 450,
    initComponent: function() {
        var me = this;
        var winAdmission = this.winAdmission;
        Ext.applyIf(me, {
            items: [Ext.create("ExtDesktop.view.search.GridAdmissionList", {})]
        });
        me.callParent(arguments);
    }
});
