Ext.define('ExtDesktop.controller.AcademicYear', {
    extend: 'Ext.app.Controller',
    stores: [
        'AcademicYear'
    ],
    views: [
               'module.academicYear.Index',
               'module.academicYear.WinAcademicYear'
    ],
    init: function(app) {    
        this.control({
                   'GridAcademicYear button[action=Create]':{
                    click: this.showFormAcademicYear
            },
           'FmAcademicYear button[action=cancel]':{
                    click: this.close
           },
           'FmAcademicYear button[action=save]':{
                    click: this.save
           },
           'GridAcademicYear button[action=Edit]': {
                    click:this.showFormEdit
           },
            "GridAcademicYear button[action=Delete]": {
                click:Util.deleteRecord
            }
        });
    },
    save:function(btn){
    	var stor = this.getAcademicYearStore();
    	Util.save(btn,stor,"AcademicYear");
    },
    showFormAcademicYear: function(btn){
    	var win = Ext.create('ExtDesktop.view.module.academicYear.WinAcademicYear');  
        win.show();
    },
    close: function(button){
         var win    = button.up('window');
         win.close();
    },
    showFormEdit:function(btn){
	      Util.selectGrid(btn,'ExtDesktop.view.module.academicYear.WinAcademicYear','Please select item to edit!');
	}
});