Ext.define('ExtDesktop.view.module.privilege.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.RolePrivileges',
    title:'Privileges',
    closable:true,
    layout:'hbox',
    margin:10,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items:[
                {
                    xtype:'grid',
                    width: '50%',
                    height:'100%',
                    border:true,
                    title:'Modules List',
                    autoScroll:true,
                    store: 'RoleModules',
                    border:true,
                    name:'GridRoleModules',
                    columnLines :  true ,
                    tbar:[
                            {
                                xtype:'combo',
                                name:'comboRole',
                                store:'Roles',
                                valueField:'id',
                                allowBlank:false,
                                displayField:'name',
                                fieldLabel:'Select role'
                            }
                    ],
                    viewConfig: {
                        getRowClass: function(record, id) {
                            return record.get("_destroy") == true ? "hidden" : "row-error";
                        }
                    },
                    columns:[
                        {xtype :'rownumberer',text  :'No.',align :'center',width :50},
                        {text:'ID',hidden:true,dataIndex:'id'},
                        {dataIndex :'role_id',hidden:true},
                        {dataIndex :'shortcut_id',hidden:true},
                        {text:'Name',dataIndex:'name',flex:1}
                    ],
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'RoleModules',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"
                    })
                },{
                    xtype:'grid',
                    autoScroll:true,
                    store: 'RoleModuleMenus',
                    width: '50%',
                    height:'100%',
                    border:true,
                    style:'margin-left:10px',
                    title:'Menu Privilege',
                    name:'GridRoleModuleMenus',
                    columnLines :  true,
                    tbar:[
                            {
                                xtype:'button',
                                text: 'Save',
                                iconCls:'icon-add',
                                tooltip:'Save',
                                action:'saveMenu'
                            },'->',{
                                xtype:'combo',
                                name:'comboMenu',
                                store:'Menus',
                                valueField:'id',
                                allowBlank:false,
                                displayField:'name',
                                fieldLabel:'Select menu'
                            },{
                                xtype:'checkbox',
                                boxLabel:'All Menus',
                                name:'chkAllMenu'
                            },{
                                xtype:'button',
                                iconCls:'icon-add',
                                tooltip:'Add menu',
                                action:'addMenu'
                            },{
                                xtype:'button',
                                iconCls:'icon-delete',
                                tooltip:'Remove menu',
                                action:'removeMenu'
                            }
                    ],
                    viewConfig: {
                        getRowClass: function(record, id) {
                            return record.get("_destroy") == true ? "hidden" : "row-error";
                        }
                    },
                    columns:[
                                {xtype :'rownumberer',text  :'No.',align :'center',width :50},
                                {text:'ID',hidden:true,dataIndex:'id'},
                                {dataIndex :'role_id',hidden:true},
                                {dataIndex :'shortcut_id',hidden:true},
                                {dataIndex :'menu_id',hidden:true},
                                {text:'Name',dataIndex:'name',flex:1},
                    ],
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'RoleModuleMenus',
                        displayInfo: true,
                        displayMsg: 'View {0} - {1} of {2}',
                        emptyMsg: "View 0"

                    })
                }
            ]
        });
        me.callParent(arguments);
    }
});