Ext.define('ExtDesktop.view.module.tuitionFeeTC.WinFeePlan', {
    extend: 'Ext.window.Window',
    alias: 'widget.winFeePlanTC',
    title:'Fee Plan Form',
    modal:true,
    items:[
        {
            xtype:'form',
            defaults:{width:400},
            modal:true,
            bodyPadding:20,
            items:[
                                {
                                    xtype:'textfield',
                                    name:'plan_code',
                                    allowBlank: false,
                                    fieldLabel:'Code'
                                },{
                                    xtype:'hiddenfield',
                                    name:'acc_plan_master_id',
                                    allowBlank: false,
                                    fieldLabel:'Plan master'
                                },{
                                    xtype:'textfield',
                                    name:'plan_name',
                                    allowBlank: false,
                                    fieldLabel:'Plan Name'
                                },{
                                    xtype:'combo',
                                    name:'degree_id',
                                    store:'combo.DegreeTC',
                                    valueField:'id',
                                    displayField: 'name',
                                    // listeners:Util.firstSelect(),
                                    allowBlank: false,
                                    fieldLabel:'Degree'
                                },{
                                    xtype:'combo',
                                    name:'course_id',
                                    store:'combo.CourseTC',
                                    valueField:'id',
                                    displayField: 'name',
                                    queryMode:'local',
                                    //listeners:Util.firstSelect(),
                                    allowBlank: false,
                                    fieldLabel:'Course'
                                },{
                                    xtype:'checkbox',
                                    fieldLabel:'Full Time',
                                    name:'is_full_time',

                                },{
                                    xtype:'numberfield',
                                    name:'term_one_fee',
                                    allowBlank: false,
                                    decimalPrecision:4,
                                    value:0,
                                    fieldLabel:'Term One Fee'
                                },{
                                    xtype:'numberfield',
                                    name:'term_two_fee',
                                    allowBlank: false,
                                    decimalPrecision:4,
                                    value:0,
                                    fieldLabel:'Term Two Fee'
                                },{
                                    xtype:'numberfield',
                                    name:'term_three_fee',
                                    allowBlank: false,
                                    decimalPrecision:4,
                                    value:0,
                                    fieldLabel:'Term Three Fee'
                                },{
                                    xtype:'numberfield',
                                    name:'term_four_fee',
                                    allowBlank: false,
                                    decimalPrecision:4,
                                    value:0,
                                    fieldLabel:'Term Four Fee'
                                },{
                                    xtype: 'radiogroup',
                                    vertical: true,
                                    columns: 1,
                                    margin:'0px 0px 0px 20px',
                                    bind: {
                                        radioValue: 'is_active'
                                    },
                                    //width: 300,
                                    items:[

                                        {xtype: 'component', html: 'Status', cls:'x-form-check-group-label'},
                                        {boxLabel: 'Active',padding:'0px 0px 0px 20px', name: 'is_active', inputValue: true,checked:true},
                                        {boxLabel: 'Deactive',padding:'0px 0px 0px 20px', name: 'is_active', inputValue: false}
                                    ],
                                    setValue: function (value) {
                                        if (!Ext.isObject(value)) {
                                            var obj = new Object();
                                            obj[this.name] = value;
                                            value = obj;
                                        }
                                        Ext.form.RadioGroup.prototype.setValue.call(this, value);
                                    }
                                }]
        }


    ],
    buttons:[
        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            iconCls:'icon-cancel',
            action:'Cancel'
        }

    ]

});
