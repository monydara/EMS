Ext.define('ExtDesktop.view.module.reasonType.WinReasonType', {
    extend: 'Ext.window.Window',
    alias: 'widget.WinReasonType',
    title:'Reason Type',
    layout: 'fit',
    autoShow: true,
    initComponent: function() {
        this.items=[
            {
                xtype:'form',
                bodyPadding: 20 ,
                defaultType:'textfield',
                defaults:{
                    width:400 , 
                    allowBlank:false
                },
                items:[
                    {
                        xtype: 'textfield',
                        name: 'code',
                        fieldLabel: 'Code',
                        allowBlank:false,
                        maxLength:6
                        // readOnly:true
                    },{
                        xtype:'textfield',
                        name:'type_name',
                        fieldLabel:'Name',
                        allowBlank:false
                    },{
                        xtype : 'fieldcontainer',
                        fieldLabel : 'Reason Type',
                        defaultType: 'radiofield',
                        allowBlank:false,
                        defaults: {
                            flex:1
                        },
                        layout: 'hbox',
                        items: [
                            {
                                boxLabel  : '&nbsp; &nbsp;&nbsp;Drop',
                                name      : 'reason_for',
                                inputValue: 'D',
                                id        : 'radio1',
                                checked : true
                            }, {
                                boxLabel  : '&nbsp; &nbsp;&nbsp;Suspend',
                                name      : 'reason_for',
                                inputValue: 'S',
                                id        : 'radio2'    
                            }
                        ]
                    },{
                        xtype:'textarea',
                        name: 'description',
                        // width:380,
                        // colspan:2,
                        fieldLabel: 'Description',
                        allowBlank:true

                    }
                ]
                
            }
        ],
        this.buttons=[
            {
                xtype:'button', 
                text:'Save', 
                iconCls:'icon-save',
                action:'Save'
            },{
                xtype:'button',
                text:'Cancel',
                iconCls:'icon-cancel',
                scope:this,
                handler:function(){
                    this.close();
                }
            }
        ],
        this.callParent(arguments);
    }  
        
});