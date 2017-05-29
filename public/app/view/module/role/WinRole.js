Ext.define('ExtDesktop.view.module.role.WinRole', {
	extend: 'Ext.window.Window',
	id:'WinRole',
	alias:'widget.FrmRole',
	title:'Role',
	modal:'true',
	resizable:false,
	height:550,
	layout:'fit',
	width:860,
	autoShow: false,
	initComponent: function() {
        var me = this;	     
        Ext.applyIf(me,{
            items:[
					{
						xtype:'panel',
						border:false,
						items:[
						       		this.formRole(),
						       		this.tabRole()
						       ]
					}],
            buttons:[
                     {text:'Save',action:'Save',iconCls:'icon-save'},
                     {text:'Save & New',action:'SaveNew',iconCls:'icon-save'},
                     {text:'Cancel',action:'Cancel',iconCls:'icon-cancel'}               
            ]
        });
        me.callParent(arguments);
    },
	
	formRole:function(){
		var form={
					 xtype:'form',
	                 bodyPadding:20,
	                 fieldDefaults: {
	                    // labelAlign: 'right',
	                     labelWidth: 125
	                 },
	                 defaults:{width: 380},
	                 items:  [
	                          	{
	                          		xtype:'hidden',
	                          		name:'id'
	                          	},
	                          	{
	                          		xtype:'textfield',
	                          		fieldLabel:'Code',
	                          		allowBlank:false,
	                          		name:'code'
	                          	},
	                          	{
	                          		xtype:'textfield',
	                          		fieldLabel:'Role',
	                          		allowBlank:false,
                                    maxLength:50,
	                          		name:'name'
	                          		
	                          	},
	                          	{
	                          		xtype:'textareafield',
	                          		fieldLabel:'Description',
	                          		name:'description',
                                    maxLength:250
	                          	}]
		}
		return form;
	},
	tabRole: function(){
		var tab={
                    xtype:'tabpanel',
                    height:200,
                    items:[
                            this.tabRoleUsers(),
                            this.tabRoleModules()
                    ]
		}
		return tab;
	},

    tabRoleUsers:function(){
        var grid=
         {

            xtype: 'grid',
            autoScroll:true,
            store: 'RoleUsers',
            border:false,
            name:'GridRoleUsers',
            title:'Users',
            columnLines :  true ,
            height: 170,
            tbar:[
                '->',
                {
                    xtype:'button',
                    iconCls:'icon-add',
                    tooltip:'Add user to role',
                    action:'addUser'
                },{
                    xtype:'button',
                    iconCls:'icon-delete',
                    tooltip:'Remove user from role',
                    action:'removeUser'
                }
            ],
            viewConfig: {
                getRowClass: function(record, id) {
                    return record.get("_destroy") == true ? "hidden" : "row-error";
                }
            },
            columns:[
                {text:'ID',hidden:true,dataIndex:'id'},
                {xtype :'rownumberer',text  :'No.',align :'center',width :50},
                {dataIndex :'role_id',hidden:true},
                {dataIndex :'user_id',hidden:true},
                {text: 'User ID',dataIndex :'user_id_str'},
                {text:'Name',dataIndex:'name',flex:1}
            ]

        };
        return grid;
    },

    tabRoleModules:function(){
        var grid={

                    xtype: 'grid',
                    autoScroll:true,
                    store: 'RoleModules',
                    border:false,
                    name:'GridRoleModules',
                    columnLines :  true ,
                    height: 170,
                    title:'Modules',
                    tbar:[
                        '->',
                        {
                            xtype:'combo',
                            name:'comboModule',
                            store:'Shortcut',
                            valueField:'id',
                            allowBlank:false,
                            displayField:'name',
                            fieldLabel:'Select Module'
                        },{
                            xtype:'button',
                            iconCls:'icon-add',
                            tooltip:'Assigned module to role',
                            action:'addModule'
                        },{
                            xtype:'button',
                            iconCls:'icon-delete',
                            tooltip:'Remove module from role',
                            action:'removeModule'
                        }
                    ],
                    viewConfig: {
                        getRowClass: function(record, id) {
                            return record.get("_destroy") == true ? "hidden" : "row-error";
                        }
                    },
                    columns:[
                                {text:'ID',hidden:true,dataIndex:'id'},
                                {xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                {dataIndex :'role_id',hidden:true},
                                {dataIndex :'shortcut_id',hidden:true},
                                {text:'Name',dataIndex:'name',flex:1}
                    ]

        };
        return grid;
    }
        	
});

