

Ext.Loader.setConfig({
    enabled: true,
    paths: {'Ext.ux.desktop': './desktop'}
});

Ext.application({
    requires: [
        'Ext.Loader',
        'ExtDesktop.view.Desktop',
        'Ext.grid.column.Date',
        'Ext.grid.column.Action',
        'Ext.ux.Form'
    ],
    controllers: [

        //System
        'Desktop',
        'Util',
        'Login',
        'Receipt'


    ],
    name: 'ExtDesktop'

});
