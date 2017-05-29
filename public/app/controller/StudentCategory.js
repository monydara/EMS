Ext.define('ExtDesktop.controller.StudentCategory', {
    extend: 'Ext.app.Controller',
    stores: ['StudentCategory'],
    views: [
            	'module.studentCategory.Index',
                'module.studentCategory.WinCategory'
    ],
    refs: [
	        {
	            ref : 'GridCategory' ,
	            selector : 'GridCategory'
	        }
	       ,{
	            ref : 'FrmCategory' ,
	            selector : 'FrmCategory'
	        }
    ],

    init: function(application) {
        this.control({
            "GridCategory button[action=Create]": {
                click:this.showForm
            },
            "GridCategory button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridCategory button[action=Delete]": {
                click:Util.deleteRecord
            },

            "FrmCategory button[action=Save]": {
                click:this.save
            },
            "FrmCategory button[action=Cancel]": {
                click:Util.closeWindow
            }
        });
    },

    showForm:function(){
        var win = Ext.create('ExtDesktop.view.module.studentCategory.WinCategory');
        win.show();
    },
    save: function(btn){
        var store= this.getStudentCategoryStore();
        Util.save(btn,store,'StudentCategory');
    },

    showFormEdit:function(btn){
        Util.selectGrid(btn,'ExtDesktop.view.module.studentCategory.WinCategory','Please select item to edit!');
    }
});

