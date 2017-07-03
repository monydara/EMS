Ext.define('ExtDesktop.view.module.student.GridDocument', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.gridDocument',
    title: 'Document',
    store: 'sdn.Document',
    columns: [{
      header: 'No',
      xtype: 'rownumberer',
      width: 50,
      align: 'center'
    }, {
      header: 'Doc. Name',
      dataIndex: 'doc_name',
      flex: 1
    }, {
      header: 'Doc. Type',
      dataIndex: 'doc_type',
      flex: 1

    }, {
      header: 'Action',
      align: 'center',
      xtype: 'actioncolumn',
      items: [{
        xtype: 'button',
        iconCls: 'icon-depositlist',
        tooltip: 'Download File',
        handler: function(grid, rowIndex) {
          var store = grid.getStore();
          var rec = store.getAt(rowIndex);
          window.open(rec.get('file_path'));
        }
      }, {
        xtype: 'button',
        iconCls: 'icon-delete',
        handler: function(grid, rowIndex) {
          var controller = ExtDesktop.app.getController('Admission');
          controller.removeDocument(grid, rowIndex);


        }
      }]
    }]

});
