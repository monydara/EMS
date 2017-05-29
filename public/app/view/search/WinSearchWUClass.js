Ext.define('ExtDesktop.view.search.WinSearchWUClass', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchWUClass',
	title		: 'Search WU Class',
	resizable	: false,
    modal       : true,
	autoShow	: false,
	initComponent: function() {
        var me = this;
        Ext.applyIf(me,{
        	items:[this.formSearch()],
            buttons: [
            {
                text: '<b>Reset</b>',
                action: 'Reset',
                
            },
            {
                text: '<b>OK</b>',
                action: 'OK',
                iconCls: 'icon-save',
                formBind: true,
                type: "submit"
            }, {
                text: '<b>Cancel</b>',
                action: 'Cancel',
                iconCls: 'icon-delete'
            }]
        });
        me.callParent(arguments);
	},
	formSearch:function(){
		var form={
	            xtype:'form',
                bodyPadding:20,
                /*layout:{
                    type:'table',
                    columns:2
                },*/
                defaults: {
                    /*labelWidth: 115,*/
                    width:450,
                    allowBlank:true,
                    style: 'margin-left:5px'
                },
                items:[
                    {
                        xtype:'combo',
                        fieldLabel:'Academic Year',
                        store:'combo.AcademicYear',
                        name:'academic_year_id',
                        valueField:'id',
                        displayField:'name'
                    },{
                        xtype:'combo',
                        fieldLabel:'Classroom',
                        store:'combo.Room',
                        name:'room_id',
                        valueField:'id',
                        displayField:'name'
                    },{
                        xtype: 'combo',
                        fieldLabel: 'Shift',
                        store: 'combo.ClassShift',
                        name: 'session_id',
                        valueField: 'id',
                        displayField: 'name'
                    },{
                        xtype: 'textarea',
                        name: 'text',
                        fieldLabel: 'Keyword',
                        emptyText: 'Enter search keyword here...'
                    }
                ]
		}
		return form;
	}
});