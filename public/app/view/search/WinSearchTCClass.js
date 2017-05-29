Ext.define('ExtDesktop.view.search.WinSearchTCClass', {
	extend		: 'Ext.window.Window',
	alias		: 'widget.WinSearchTCClass',
	title		: 'Search TC Class',
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
                //active:'Reset',
                iconCls:'icon-refund',
                action: 'reset'
                
            },
            {
                text: '<b>OK</b>',
                action: 'OK',
                iconCls: 'icon-save',
                formBind: true,
                type: "submit"
            }, {
                text: '<b>Cancel</b>',
                action: 'cancel',
                iconCls: 'icon-delete'
            }]
        });
        me.callParent(arguments);
	},
	formSearch:function(){
		var form={
	            xtype:'form',
                bodyPadding:10,
                layout:{
                    type:'table',
                    columns:2
                },
                defaults: {
                    /*labelWidth: 115,*/
                    width:380,
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
                        xtype:'combo',
                        fieldLabel:'Tuition Time',
                        store:'combo.TuitionTime',
                        name:'tuition_time_id',
                        valueField:'id',
                        displayField:'tuition_name'
                    },{
                        xtype:'combo',
                        fieldLabel:'Term',
                        store:'combo.Term',
                        name:'term_id',
                        valueField:'id',
                        displayField:'term_name'
                    },{
                        xtype: 'combo',
                        fieldLabel: 'Shift',
                        store: 'combo.ClassShift',
                        name: 'session_id',
                        valueField: 'id',
                        displayField: 'name'
                    },{
                        xtype: 'textfield',
                        name: 'text',
                        fieldLabel: 'Keyword',
                        emptyText: 'Enter search keyword here...'
                    }
                    // },{
                    //     xtype: 'container',
                    //     layout: 'hbox'
                    //     items: [{
                    //         xtype: 'radiofield',
                    //         inputValue: 'S',
                    //         fieldLabel:'Status',
                    //         boxLabel: 'Started',
                    //         checked: true,
                    //         name: 'status'
                    //     }, {
                    //         xtype: 'radiofield',
                    //         inputValue: 'F',
                    //         boxLabel: 'Finished',
                    //         name: 'status'
                    //     }, {
                    //         xtype: 'radiofield',
                    //         inputValue: 'P',
                    //         boxLabel: 'Pending',
                    //         name: 'status'
                    //     }, {
                    //         xtype: 'radiofield',
                    //         inputValue: 'C',
                    //         boxLabel: 'Cancel',
                    //         name: 'status'
                    //     } ]

                    // }
                ]
		}
		return form;
	}
});