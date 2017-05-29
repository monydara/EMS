Ext.define('ExtDesktop.view.module.admissionWU.WinStudent', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinStudentAdmissionWU',
    title: 'Registartion List',
    layout: 'fit',
    height: "80%",
    width: '80%',
    initComponent: function() {
        var me = this;
        var winAdmission = this.winAdmission;
        Ext.applyIf(me, {
            items: [
                        Ext.create("ExtDesktop.view.module.lead.Index", {
                            tbar: [{
                                        xtype: 'textfield',
                                        width: 350,
                                        name: 'search',
                                        emptyText: '-- Type For Search ---',
                            }, {
                                        html: 'Please double click on list grid for take it to admission'
                            }],
                            title: '',
                            closable: false
                        })
            ]
        });
        me.callParent(arguments);

       /* var store = me.down("grid").getStore() ;
        store.proxy.extraParams= {type:"TC"} ;
        store.load();*/
    }
});
