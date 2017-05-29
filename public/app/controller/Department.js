/**
 * Created by Dara on 09/26/14.
 */

Ext.define('ExtDesktop.controller.Department', {
    extend: 'Ext.app.Controller',
    models: [
        'Department'
    ],
    stores: [
        'Department'
    ],
    views: [
        'module.department.Index',
        'module.department.Win'
    ],

    init: function(application) {
        this.control({
            "GridDepartment button[action=Create]": {
                click:this.showForm
            },
            "GridDepartment button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridDepartment button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinDepartment button[action=Save]": {
                click:this.save
            },
            "WinDepartment button[action=Cancel]": {
                click:Util.closeWindow
            },
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.department.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getDepartmentStore();
        Util.save(btn,store,'Department');
    },
    showFormEdit:function(btn){
      Util.selectGrid(btn,'ExtDesktop.view.module.department.Win','Please Select Item To Edit');  
    }

});