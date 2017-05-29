Ext.define('ExtDesktop.view.module.studentCategory.WinCategory', {
	extend: 'Ext.window.Window',
	id:'WinCategory',
	alias:'widget.FrmCategory',
	title:'Student Category',
	modal:'true',
	autoShow: false,
	initComponent: function() {
        var me = this;	     
        Ext.applyIf(me,{
            items:[
					{
                        xtype:'form',
                        defaults:{width:350},
                        bodyPadding:20,
                        items:[
                                {
                                    xtype:'textfield',
                                    name:'code',
                                    fieldLabel:'Code',
                                    allowBlank:false,
                                    emptyText:'Category code',
                                    maxLength:6
                                },
                                {
                                    xtype: 'textfield',
                                    name: 'name',
                                    fieldLabel: 'Name',
                                    allowBlank: false,
                                    emptyText: 'Category name',
                                    maxLength: 50
                                },{
                                    xtype:'textarea',
                                    name:'description',
                                    fieldLabel:'Description',
                                    maxLength:255
                                }
						]
					}],
            buttons:[
                     {text:'Save',action:'Save',iconCls:'icon-save'},
                     {text:'Cancel',action:'Cancel',iconCls:'icon-cancel'}

                 ]
        });
        me.callParent(arguments);
    }
});

