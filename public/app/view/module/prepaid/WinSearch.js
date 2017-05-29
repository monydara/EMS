Ext.define('ExtDesktop.view.module.prepaid.WinSearch',{
    extend: 'Ext.window.Window',
    alias: 'widget.WinSearch',
    title:'Search in Advance',
    autoScroll:true,
    modal:true,
    initComponent: function(){
    	Ext.apply(this, {
    		items:[
                {
                    xtype:'Form',
                    bodyPadding:10,
                    width:710,
                    height:360,
                    defaults:{width:300,labelWidth:100},
                    layout:{ type: 'table', columns: 2},
                    items:[
                        {
                            xtype: 'fieldset',
                            title: 'Transaction Date',
                            height:130,
                            width:340,
                            padding: 10,
                            defaults:{width:300,labelWidth:100},
                            items: [
                                {
                                    xtype: 'datefield',
                                    name: 'dfFromDate',
                                    fieldLabel: 'From Date',
                                    emptyText: 'MM-DD-YYYY',
                                    format: 'd-M-Y'
                                }, {
                                    xtype: 'datefield',
                                    name: 'dfToDate',
                                    fieldLabel: 'To Date',
                                    emptyText: 'MM-DD-YYYY',
                                    format: 'd-M-Y'
                                }
                            ]
                        },
                        {
                            xtype: 'fieldset',
                            title: 'Transaction Amount',
                            padding: 10,
                            height:130,
                            width:330,
                            style:'margin-left:10px',
                            defaults:{width:300,labelWidth:100},
                            items:[
                                {
                                    xtype: 'combo',
                                    fieldLabel: 'Currency',
                                    store: 'acc.Currency',
                                    queryMode: 'remote',
                                    valueField: 'id',
                                    displayField: 'ccy_code',
                                    name: 'ccy_id'
                                }, {
                                    xtype: 'numberfield',
                                    name: 'nfFromAmount',
                                    value: 0,
                                    fieldLabel: 'From Amount'
                                },{
                                    xtype:'numberfield',
                                    name:'nfToAmount',
                                    value:0,
                                    fieldLabel:'To Amount'
                                }
                            ]
                        },
                        {

                            xtype: 'fieldset',
                            title: 'Transaction Status',
                            layout:'hbox',
                            colspan:2,
                            width:670,
                            defaults:{xtype:'radiofield',name:'status',style:'margin:10 40px 10 20px'},
                            items:[
                                {
                                    boxLabel: 'All',
                                    checked: true,
                                    inputValue: 'A'
                                },{
                                    boxLabel: 'Booked',
                                    checked: false,
                                    inputValue: 'B'
                                }, {
                                    boxLabel: 'Committed',
                                    checked: false,
                                    inputValue: 'C'
                                },{
                                    boxLabel:'Refunded',
                                    checked:false,
                                    inputValue:'F'
                                },{
                                    boxLabel:'RollBack',
                                    checked:false,
                                    inputValue:'R'
                                }
                            ]

                        },
                        {
                            xtype: 'combo',
                            fieldLabel: 'Degree',
                            store: 'combo.Degree',
                            queryMode: 'local',
                            valueField: 'id',
                            displayField: 'name',
                            name: 'degree_id'
                        },
                        {
                            xtype: 'combo',
                            name: 'course_id',
                            style: 'margin-left:10px',
                            store: 'combo.Course',
                            queryMode: 'local',
                            allowBlank: false,
                            displayField: 'name',
                            valueField: 'id',
                            fieldLabel: 'Course'
                        },
                        {

                            name:'txtSearch',
                            xtype:'textfield',
                            colspan:2,
                            fieldLabel:'Keyword',
                            width:650
                    }]
                }
            ]
    	});
    	this.callParent(arguments);
    },
    buttons:[
        {
            text: 'Search',
            iconCls: 'icon-ok',
            action: 'Search'
        },{
            text:'Reset',
            iconCls:'icon-refresh',
            action:'Reset'

        },{
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel'
        }
        ]
    
});