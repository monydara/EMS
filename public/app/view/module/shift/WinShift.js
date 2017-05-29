Ext.define('ExtDesktop.view.module.shift.WinShift',{
    extend: 'Ext.window.Window',
    alias: 'widget.FrmShift',    
    title:'Employee Shift',
    //modal:true, 

    layout: 'fit',
    autoShow: true,

    initComponent: function() {

    this.items=[
        {
            xtype:'form',
            defaults:{width:350,height:30},
            fieldDefaults: {
                labelWidth: 125
            },
            bodyPadding:20,    
            items:[
	                {
	                	xtype:'textfield',
	                    name:'shift_name',
	                    emptyText:'Enter shift name',
	                    fieldLabel:'Shift Name<font color="red">*</font>',
	                    allowBlank:false
	                },
                {
                    xtype: 'combo',
                    fieldLabel: 'Shift Type <font style="color:red">*</font>',
                    emptyText: 'Select....',
                    valueField: 'id',
                    allowBlank: false,
                    displayField: 'name',
                    name: 'shift_type',
                    listeners: Util.firstSelect(),
                    store: Ext.create('Ext.data.Store', {
                        fields: ['id', 'name'],
                        data: [
                            {id: 'FT', name: 'Full Time'},
                            {id: 'PT', name: 'Part Time'}
                        ]
                    })
                },
                {
                    xtype: 'timefield',
                    fieldLabel: 'Start Time <font style="color:red">*</font>',
                    name: 'start_time',
                    allowBlank: false
                },{
                    xtype: 'timefield',
                    fieldLabel: 'End Time<font style="color:red">*</font>',
                    name: 'end_time',
                    allowBlank: false
                },{
                    xtype:'textareafield',
                    fieldLabel: 'Description',
                    name : 'description',
                    allowBlank:false
                }
            ]
    }],
    
    this.buttons=[
        {

            xtype : 'button',
            buttonOnly : true,  
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
            /*handler: function(){
                    alert('click save');
            }*/
        },{
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel',
            scope: this,
            handler: this.close
        }
        
    ],

    this.callParent(arguments);
}

});r