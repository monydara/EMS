Ext.define('ExtDesktop.view.module.student.FrmBasicInfo', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.FmBasic',
    name:'basicInfo',
    layout:'hbox',
    margin:'10px 0 10px 10px',
    autoScroll: true,
    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
                items:[
                        this.form(this.lock),
                        this.image()
                ]
        });
        me.callParent(arguments);
    },

    form:function(lock){
        var form={
                        xtype:'form',
                        itemId:'FmBasic',
                        defaultType: 'textfield',
                        fieldDefaults: {
                            //labelAlign: 'top',
                            msgTarget: 'side',
                            width: 320,
                            labelWidth: 100,
                            disabled:lock,
                            style: 'margin-left:5px'
                        },
                        layout: {
                            type: 'table',
                            columns: 2,
                            tdAttrs:{
                                align:'top'
                            }
                        },
                        items:[
                                {
                                    fieldLabel: 'គោត្តនាម',
                                    allowBlank: false,
                                    //   afterLabelTextTpl: required,
                                    name: 'khr_first_name'
                                },{
                                    xtype: 'textfield',
                                    fieldLabel: 'នាម',
                                    allowBlank: false,
                                    // afterLabelTextTpl: required,
                                    name: 'khr_last_name'
                                },
                                 {
                                     xtype: 'textfield',
                                     fieldLabel: 'Last Name',
                                     allowBlank: false,
                                     // afterLabelTextTpl: required,
                                      name: 'last_name'
                                },
                                 {
                                    xtype: 'textfield',
                                    fieldLabel: 'First Name',
                                    //   afterLabelTextTpl: required,
                                    allowBlank: false,
                                    name: 'first_name'

                                },
                                 {
                                    xtype: 'combo',
                                    allowBlank: false,
                                    fieldLabel: 'Gender',
                                    emptyText: 'Select....',
                                    valueField: 'id',
                                    displayField: 'name',
                                    editable: false,
                                    //  afterLabelTextTpl: required,
                                    name: 'gender',
                                    listeners: Util.firstSelect(),
                                    store: Ext.create('Ext.data.Store', {
                                    fields: ['id', 'name'],
                                    data: [{

                                        id: 'M',
                                        name: 'Male'
                                    }, {
                                        id: 'F',
                                        name: "Female"
                                    }]
                                })
                        },{
                                    xtype: 'datefield',
                                    fieldLabel: 'Date of Birth',
                                    name: 'date_of_birth',
                                    //  afterLabelTextTpl: required,
                                    format:'d-M-Y',
                                    allowBlank: false,
                                    submitFormat:'Y-m-d',
                                    emptyText:'MM-DD-YYYY'
                                }, {
                                    xtype: 'textfield',
                                        fieldLabel: 'National No.',
                                        name: 'national_no',
                                        allowBlank: true
                                }, {
                                    xtype: 'textfield',
                                        fieldLabel: 'Passport No.',
                                        name: 'passport_no',
                                        allowBlank: true

                                }, {
                                        xtype: 'textarea',
                                        fieldLabel: 'Place of Birth',
                                        name: 'place_of_birth',
                                        width: 645,
                                        colspan: 2
                                }]
                 }
        return form;
    },
    image:function(){
       var image={
                xtype: 'form',
                name: 'image',
                layout: 'hbox',
                items: [
                    Ext.create('Ext.Img', {
                        width: 180,
                        height:180,
                        
                        style: 'margin-left:20px',
                        src: 'resources/images/photo/no-picture.gif'
                    }),{
                        xtype:'container',
                        items:[
                            {
                                xtype: 'filefield',
                                buttonText: 'Browse',
                                name: 'image',
                                buttonOnly: true,
                                action: 'browse'
                            }
                        ]
                    }, {
                        xtype: 'hiddenfield',
                        name: 'image_url'
                    }]
        }
        return image;
    }
});