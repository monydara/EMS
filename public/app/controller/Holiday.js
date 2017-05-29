
Ext.define('ExtDesktop.controller.Holiday', {
    extend: 'Ext.app.Controller',
    models: [
        'Holiday'
    ],
    stores: [
             'hr.Holiday'
    ],
    views: [
        'module.holiday.Index',
        'module.holiday.Win',
        'module.holiday.WinAdvanceSearch'
    ],

    init: function(application) {
        this.control({
            "GridHoliday button[action=Create]": {
                click:this.showForm
            },
            "GridHoliday button[action=Edit]": {
                click:this.showFormEdit
            },
            "GridHoliday button[action=Delete]": {
                click:Util.deleteRecord
            },
            
            "WinHoliday button[action=Save]": {
                click:this.save
            },
            "WinHoliday button[action=Cancel]": {
                click:Util.closeWindow
            },
            "GridHoliday textfield[name=Search]": {
                change: this.searchBasic
            }
            ,
            "GridHoliday button[action=ShowAdvanceSearchForm]": {
                click: this.showAdvanceSearchForm
            }
            ,
            "WinAdvanceSearch button[action=AdvanceSearch]": {
                click: this.searchAdvance
            }
        });
    },
    
    showForm:function(){
      var win = Ext.create('ExtDesktop.view.module.holiday.Win');  
      win.show();
    },
    save: function(btn){
        var store= this.getHrHolidayStore();
        Util.save(btn,store,'Holiday');
    },
    showFormEdit:function(btn){
      //Util.selectGrid(btn,'ExtDesktop.view.module.holiday.Win','Please Select Item To Edit');
    	this.selectGrid(btn,'ExtDesktop.view.module.holiday.Win','Please Select Item To Edit');
             //Clear selection
        var grid = btn.up("gridpanel");   
        grid.selModel.deselectAll();
    },
    selectGrid:function(btn,fileName,message){		
        var grid =btn.up("gridpanel"); 
        var row =grid.getSelectionModel().getSelection();
        if(row.length){
                var win=Ext.create(fileName);
                var form=win.down('form');
                var record = row[0];                
                form.loadRecord(record);                
                win.show();
                win.center();                
        }else{
                this.msg(message);
        }
    },
    searchBasic:function(textfield,newVal,oldVal){
        console.log(newVal,"***",oldVal);
        var text_search = newVal ;
        var store = this.getHrHolidayStore();
        var me =  this;
        setTimeout(function() {
          me.show(text_search,store)
        }, 1000);  // measure in millisecond (ms)

    },

    show:function(text_search,store){
        if (text_search != ""){   // user input value 
             store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
          
        }else{
            store.load();       
        }
    },
    showAdvanceSearchForm:function(btn){
        var text = btn.getText();
        console.log("** you clicked: "+text);

        var win = Ext.create('ExtDesktop.view.module.holiday.WinAdvanceSearch');  
        win.show();
    }
    , 
    searchAdvance:function(btn){
        var win = btn.up("window");
        var form = win.down("form");

        var values = form.getValues();
        console.log(values)
        var store = this.getHrHolidayStore();
       // store.load({ params:values });  // pass all parameter in values that we get values from form (each field as parameter)
       // win.close();
        

        setTimeout(function(){
            store.load({ params:values });  // pass all parameter in values that we get values from form (each field as parameter)
            
        },500);

    }
});