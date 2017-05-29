Ext.define('ExtDesktop.view.module.employee.Index', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.GridEmployee',
    store: 'hr.Employee',
    title:'Employee List',
    closable:true, 
    autoScroll:true,
    columnLines:true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            tbar:[    
                  
	                  {
		                xtype:'textfield',
		                name:'SearchBasic',
		                emptyText:'Enter search keyword here...',
		                width: 450
	                  },'->',{
	                             
	                    text:'Create',
	                    action:'Create',
	                    iconCls:'icon-add'
	                  },{                 
	                    text:'Edit',
	                    action:'Edit',
	                    iconCls:'icon-edit'
                     
	                 },{                  
	                    text:'Delete',
	                    action:'Delete',
	                    iconCls:'icon-delete'
	                }],
       
            columns: [
                        {
                            xtype:'rownumberer',
                            text:'No.',
                            align:'center',
                            width:50
                        },{                           
                            dataIndex: 'id',
                            text: 'id',
                            hidden:true
                        },{
                        	dataIndex:'code',
                        	text: 'Code',
                        	width: 60
                        },{
                            dataIndex: 'title',
                            text: 'Title',
                            width: 60,
                        },{                            
                        	dataIndex: 'name',
                            text: 'Name',
                            width: 120
                        },{
                        	dataIndex: 'khr_name',
                            text: 'Khmer Name',
                            width: 120
                        },{
                        	dataIndex: 'birth_date',
                        	text: 'DOB',
                        	width: 120
                        },{
                        	width: 120,
                            dataIndex: 'position',
                            text: 'Position',
                          
                        },{
                        	width: 120,
                            dataIndex: 'department',
                            text: 'Department',
                            
                        },{
                        	dataIndex: 'phone_no',
                            text: 'Phone No',
                            width: 100
                        },{
                        	dataIndex: 'email',
                            text: 'Email',
                            width: 150
                        },{
                        	dataIndex: 'status',
                            text: 'Status',
                            width: 120,
                            renderer:function(value){
                               
                                if(value == "PB"){
                                    return "Probation" ;
                                }else  if(value == "PN"){
                                    return "Permanance" ;
                                }else  if(value == "RS"){
                                    return "Resignated" ;
                                }else  if(value == "SP"){
                                    return "Suspended" ;
                                }else  if(value == "DP"){
                                    return "Drop" ;
                                }
                            }
	                       
                        },{
                        	dataIndex: 'description',
                            text: 'Description',
                            flex:1
                        }
            ],           
            viewConfig: {
                enableTextSelection: true
            },
            bbar: Ext.create('Ext.PagingToolbar', {
			          store: 'hr.Employee',
			            displayInfo: true,
			            displayMsg: 'View {0} - {1} of {2}',
			            emptyMsg: "View 0"
			        })
        });
        me.callParent(arguments);
    }

});