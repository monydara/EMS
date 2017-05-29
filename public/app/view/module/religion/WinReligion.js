Ext.define('ExtDesktop.view.module.religion.WinReligion', {
    extend: 'Ext.window.Window',
    alias: 'widget.FmReligion',
    title: 'Religion Form',
    modal:'true',
    layout:'fit',    
    items:[
                {
                    xtype:'form',
                    bodyPadding:20,
                    defaults:{width:400,allowBlank:false},
                    items:  [
                     {
                    	 xtype:'textfield',
                    	 fieldLabel:'Riligion',
                    	 name:'name'
                     },{
                    	 xtype:'textfield',
                    	 fieldLabel:'សាសនា',
                    	 name:'khr'
                     }              
                   ]
                }
        ],
    buttons:[
             {text:'<b>Save</b>',action:'save',iconCls:'icon-save'},
             {text:'<b>Cancel</b>',action:'cancel',iconCls:'icon-delete'}
    ],
});