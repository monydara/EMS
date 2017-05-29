Ext.define('ExtDesktop.view.module.cashDrawerManager.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.GridCashDrawerManager',  
    collapsible: false,
    title:'Cash Drawer Manager',
    closable:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
          xtype:'container',
          bodyPadding:20,
          layout:'hbox',
          items:[                
                 this.getGroupAccountManager(),
                 this.getGridMember()                 
                 ]
        });
        me.callParent(arguments);
    },
    getGridMember: function(){
    	var grid={
    			xtype:'grid',
    			border:true,
        		title:'Cashier Member',
        		style:'margin-left:20px',
        		store:'acc.CashDrawer',
        		width:'40%',
        		height:500,
        		columns:[
        		         {header:'User Name', width:120,dataIndex:'user_id'},
        		         {header:'Staff Name',flex:1,dataIndex:'user_name'},
                         {
                            header:'Status', dataIndex:'is_active',
                            renderer:function(grid, raw){
                                var data = raw.record.data ;
                                if (data.is_active == 1) {
                                    return '<span style="color:green"> <b> Active </b> </span>';
                                } else{
                                    return '<span style="color:red"> <b> Deactive </b> </span>';

                                };

                            }
                         },
        		         {	
        		        	 header:'Action',
        		        	 xtype:'actioncolumn',
        		        	 align:'center',
        		        	 items:[
								{
									icon: 'resources/images/icons/Ok.png',  // Use a URL in the icon config
								    tooltip: 'Active',
								    handler: function(grid, rowIndex, colIndex) {
								       
                                        var ctrl = ExtDesktop.app.getController("CashDrawerManager");
                                        ctrl.activeMember(grid, rowIndex , ctrl);								    
								    } ,
                                    isDisabled: function(view, rowIndex, colIndex, item, record) {                            
                                        var isDisabled=record.get('is_active')==1;
                                        return isDisabled;
                                    }
								},{
                                    icon: 'resources/images/icons/cancel.png',  // Use a URL in the icon config
                                    tooltip: 'Deactive',
                                    handler: function(grid, rowIndex, colIndex) {
                                       
                                        var ctrl = ExtDesktop.app.getController("CashDrawerManager");
                                        ctrl.deactiveMember(grid, rowIndex , ctrl);                                   
                                    } ,
                                     isDisabled: function(view, rowIndex, colIndex, item, record) {                            
                                        var isDisabled=record.get('is_active')==1;
                                        return !isDisabled;
                                    }
                                        
                                },{
                                    icon: 'resources/images/icons/remove.png',  // Use a URL in the icon config
                                    tooltip: 'Remove',
                                    handler: function(grid, rowIndex, colIndex) {
                                       
                                        var ctrl = ExtDesktop.app.getController("CashDrawerManager");
                                        ctrl.removeMember(grid, rowIndex , ctrl);                                   
                                    } ,
                                    
                                }
        		        	        
        		        	  ]
        		        	 
        		         }
        		         
        		         ],
        		         
        		    
    	};
    	
    	
    	return grid;
    },
    getGroupAccountManager: function(){
    	
    	var grid={
    		xtype:'grid',
    		title:'Group Cashier',
    		width:'60%',
    		height:500,
    		border:true,
    		store:'acc.CashDrawerGroup',
            name: 'cashdrawergroup', 
    		tools:[ {
		    	  xtype:'button',
 		    	  action:'create',
                  iconCls:'icon-add',
 		    	  text:'Add'
 		      }],
    		columns:[
    		         {header:'No.',xtype:'rownumberer',width:35, align:'center'},
    		         {header:'Group Name',width:120,dataIndex:'group_name'},
    		         {header:'Description',flex:1,dataIndex:'description'},
    		         {
    		            header:'Status', dataIndex:'is_active',
                        renderer:function(grid, raw){
                            var data = raw.record.data ;
                            if (data.is_active == 1) {
                                return '<span style="color:green"> <b> Active </b> </span>';
                            } else{
                                return '<span style="color:red"> <b> Deactive </b> </span>';

                            };

                        }
    		         },{
    		        	 xtype:'actioncolumn',
    		             header:'Add Member',
    		             align:'center',
    		             items: [{
    		                 icon: 'resources/images/icons/customermanage.png',  // Use a URL in the icon config
    		                 tooltip: 'Add Member',
    		                 handler: function(grid, rowIndex, colIndex) {
    		                     var rec = grid.getStore().getAt(rowIndex);
                                    var ctl = ExtDesktop.app.getController('CashDrawerManager');
                                     ctl.showFormAddMember(grid , rec, ctl);
    		                   
    		                     
    		                 }
    		             }]
    		         },{
    		        	 xtype:'actioncolumn',
    		             header:'Action',
    		             align:'center',
    		             items: [
                            {
                                 icon: 'resources/images/icons/edit.png',  // Use a URL in the icon config
                                 tooltip: 'Edit',
                                 handler: function(grid, rowIndex, colIndex) {
                                     var rec = grid.getStore().getAt(rowIndex);
                                     var ctl = ExtDesktop.app.getController('CashDrawerManager');
                                     ctl.edit(grid , rec, ctl);
                                 }
                           },{
        		                 icon: 'resources/images/icons/remove.png',  // Use a URL in the icon config
        		                 tooltip: 'Delete',
        		                 handler: function(grid, rowIndex, colIndex) {
        		                     var rec = grid.getStore().getAt(rowIndex);
        		                    var ctl = ExtDesktop.app.getController('CashDrawerManager');
                                     ctl.delete(grid , rec, ctl);

        		                 }
    		               },
                         ]
    		         }
    		         ],
    	
    	 bbar: Ext.create('Ext.PagingToolbar', {
	          store: 'acc.CashDrawerGroup',
	            displayInfo: true,
	            displayMsg: 'View {0} - {1} of {2}',
	            emptyMsg: "View 0"
	        })
    			
    	};
    	
    	
    	return grid ;
    	
    }

});