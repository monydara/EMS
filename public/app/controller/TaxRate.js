Ext.define('ExtDesktop.controller.TaxRate', {
    extend: 'Ext.app.Controller',
    stores: [
        'TaxRate','TaxType'
    ],
    views: [
        'module.taxRate.Index',
        'module.taxRate.Win'
    ],
    refs: [
        {
            ref : 'GridTaxRate' ,
	        selector : 'GridTaxRate'
        },
        {
            ref : 'FrmTaxRate' ,
	        selector : 'FrmTaxRate'
        }
    ],
    init: function(app) {
        
        this.control({
           'GridTaxRate button[action=Create]':{
	    	      click: this.showForm
	         },
           'FrmTaxRate button[action=Cancel]':{
                click: this.close
           },
           'GridTaxRate button[action=Edit]': {
               click:this.showFormEdit
           },
           'FrmTaxRate button[action=Save]':{
        	   click:this.save
           },
           "GridTaxRate button[action=Delete]": {
                click:Util.deleteRecord
      
           },
            'FrmTaxRate button[action=SearchTaxType]':{
                click:this.showTaxTypeForm
            },
             "GridTaxRate textfield[name=Search]":{
                  change : this.searchKeyword
                 //change : Util.search
            },
            
           
        });
        
    },
    save:function(btn){
      var win = btn.up('window'),
      form = win.down('form'),
      record = form.getRecord(),
      values = form.getValues();
      console.log(values);

    	  var store= this.getTaxRateStore();
        Util.save(btn,store,'TaxRate');
    },
    showForm: function(btn){
         var win = Ext.create('ExtDesktop.view.module.taxRate.Win');
         win.show();
         win.center();
    },
    showTaxTypeForm: function(btn){
        var win = Ext.create('ExtDesktop.view.module.taxRate.WinTaxType');
        win.show();
        win.center();
    },
    close: function(button){
		 var win    = button.up('window');
		 win.close();
  	},
  	
  	showFormEdit:function(btn){
  	   Util.selectGrid(btn,'ExtDesktop.view.module.taxRate.Win','Please select record to edit!');
        //Clear selection
        var grid = btn.up("gridpanel");   
        grid.selModel.deselectAll();
  	},

    searchKeyword:function(textfield,newVal,oldVal){
        console.log("****"+newVal + "**"+oldVal);
        var text_search = newVal ;
        var store = this.getTaxRateStore();
        var me =  this;
        setTimeout(function() {
          me.show(text_search,store)
        }, 1000);  // measure in millisecond (ms)

       /* if (text_search != ""){   // user input value 
          store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
          
        }else{
          store.load(); 
          
        }*/
    },

    show:function(text_search,store){
         if (text_search != ""){   // user input value 
          store.load({  params: {text : text_search}  }); // params:{key:value}    , at server can get this parameter value using its key name (text is the key name in this case)
          
        }else{
          store.load(); 
          
        }
    }
       


});

