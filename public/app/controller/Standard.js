Ext.define('ExtDesktop.controller.Standard', {
    extend: 'Ext.app.Controller',
    stores: [
        'Standard',
        'combo.Division',
        'acd.StandardDivision'
    ],
    views: [
        'module.standard.Index'
    ],
    init: function(app) {
        
        this.control({
           'GridStandard button[action=Create]':{
        	   click: this.showForm
           	},
           'FrmStandard button[action=Cancel]':{
                click: this.close
           },
          'FrmStandard button[action=Save]':{
              click: this.save
         },
           'GridStandard button[action=Edit]': {
               click:this.showFormEdit
           },
           "GridStandard button[action=Delete]": {
                click:Util.deleteRecord
            },
            'FrmStandard button[action=AddDivision]':{
              click: this.addDivision
            },

        });
        
    },
    removeDivision:function(grid, rowIndex){
      Ext.MessageBox.confirm('Remove Division?', 'Are you sure to <b>remove this division from list</b>?', 
            function(btn ){
                
                if (btn == 'yes') {
                    remove()
                };
            });
       

        function remove(){

            var store =grid.getStore(); 
            var rec = store.getAt(rowIndex);
            var id = rec.get('id') ;
            if (id > 0 ) {
                // remove subject in server side
                Util.ajax('AcdStandards/removeDivision',{id:id});

            } 
            store.remove(rec);
        }

    },
    addDivision:function(btn){
        var grid = btn.up('grid'),
        gridStore = grid.getStore(),
        combo = grid.down('combo[name=division]'), 
        comboStore =  combo.store ,
        value = combo.getValue();
        
        if (value) {
           var rec = comboStore.getById(value);
           var model = Ext.create("ExtDesktop.model.acd.StandardDivision",{
              code: rec.get("code"),
              name: rec.get("name"),
              sequence: rec.get("sequence"),
              division_id: rec.get("id")
           });

           gridStore.add(model);
        };

    },
   save: function(btn){
     	// model="Standard"; 

      var win = btn.up('window'),
        form = win.down('form'),
        values = form.getValues(),
        record = form.getRecord(),
        store = this.getStandardStore();

        if(form.getForm().isValid()){

            // values['acd_standard_division_attributes']=Util.getValueFromStoreDetail(this.getAcdStandardDivisionStore());
            if (record) {
                record.set(values);
            } else{
                var model = Ext.create('ExtDesktop.model.Standard');
                model.set(values);
                store.add(model);

            };
            store.sync();
            win.close();
        }else{
            Util.msg("Please entry require field before press Save button");
        }
   	
   },
    showForm: function(btn){
        this.getAcdStandardDivisionStore().removeAll();
         var win = Ext.create('ExtDesktop.view.module.standard.WinStandard');  
         win.show();
    },
    close: function(button){
		 var win= button.up('window');
		 win.close();
	},
	
	showFormEdit:function(btn){ 

      var grid =btn.up("gridpanel"); 
      var row =grid.getSelectionModel().getSelection();
      if(row.length){
          var win=Ext.create('ExtDesktop.view.module.standard.WinStandard');
          var form=win.down('form');
          var record = row[0];          
          form.loadRecord(record);
          
          win.show();
          win.center();     
      }else{
          this.msg('Please select item to edit!');
      }
	},
	

});

