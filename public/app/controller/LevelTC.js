Ext.define('ExtDesktop.controller.LevelTC', {
    extend: 'Ext.app.Controller',
    stores: ['TCLevel','CourseTC','LevelType'],
    views:  ['module.levelTC.Index','module.levelTC.WinLevel'],
    init: function(application) {
        this.control({
        	"PanelLevelTC grid[name='GridCourseLevel']":{
        		itemclick: this.loadTCLevelStore
            },
            'PanelLevelTC button[action=Create]':{
                click: this.showForm
            },
            'PanelLevelTC button[action=Edit]':{
                click: this.showFormEdit
            },
            'PanelLevelTC textfield[action=search]':{
                change: this.filterCourse
            },
            'FrmWinLevel button[action=Save]':{
                click: this.save
            },
            'FrmWinLevel button[action=Cancel]':{
            	click: this.cancel
            }
            
        });
    },    

    filterCourse:function(field){
        var value = field.getValue();
        if (value) {
            var store = field.up('grid').getStore();
            Util.loadStore(store, {search : value });
        };
    },
    cancel:function(btn){
        btn.up('window').close();
    },
    save:function(btn){
        var store = this.getTCLevelStore();
        var model = "TCLevel";
        Util.save(btn,store,model);
    },
    courseId: null ,

    loadTCLevelStore:function(grid, record, item, index, e, eOpts){ 
        var levelStore=this.getTCLevelStore();
        this.courseId = record.data.id;
        levelStore.load({
            params:{course_id:record.data.id}
        })
    },

    showForm: function(btn){    	
      var me = this;
      if (me.courseId > 0 ) {
              var win = Ext.create('ExtDesktop.view.module.levelTC.WinLevel');
              win.down('hiddenfield[name=course_id]').setValue(me.courseId);
              win.show();
              win.down('textfield[name=code]').focus(200,false);
              win.center();
      } else{
        Ext.Msg.alert("Warning","Please Select Course Before Add New Level");
      };
    },

    showFormEdit:function(btn){
         Util.selectGrid(btn,"ExtDesktop.view.module.levelTC.WinLevel","Please select Grid Before Edit");
    }
    
    
});