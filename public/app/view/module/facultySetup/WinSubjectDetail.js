/**
 * Created by HENG SOPHAT on 10/22/2015.
 */
Ext.define('ExtDesktop.view.module.facultySetup.WinSubjectDetail', {
    extend: 'Ext.window.Window',
    modal: true,
    alias: 'widget.WinSubjectDetail',
    title: 'Subject Detail',
    layout: 'fit',
    width: 780,
    height:400,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
                items:[this.form()],
                buttons:[
                    '->',
                    {
                        text:'Save',
                        action:'SaveSubjectDetail',
                        iconCls:'icon-save'
                    },{
                        text:'Cancel',
                        action:'Cancel',
                        iconCls:'icon-delete'
                    }
                ]
        });
        me.callParent(arguments);
    },

    form:function(){
        var form={
                    xtype:'form',
                    bodyPadding:10,
                    defaultType:'textfield',

                    //autoScroll:true,
                    fieldDefaults:{
                        width:370,
                        labelWidth:140,
                        labelAlign:'right',
                        readOnly:true
                    },
                    layout:{
                            type:'table',
                            columns:2
                    },
                    items:[
                        {

                            xtype:'fieldcontainer',
                            layout:'hbox',
                            items:[
                                {
                                    name: 'subject_id',
                                    xtype:'textfield',
                                    hidden: true
                                },{
                                    xtype:'textfield',
                                    name: 'name',
                                    fieldLabel:'Subject',
                                    width:310
                                },{
                                    xtype:'button',
                                    text:'...',
                                    margin:'0 0 0 5',
                                    action:'SelectSubject'
                                }
                            ]
                        },{
                            name:'total_credits',
                            fieldLabel:'Total Credits',
                            xtype:'numberfield',
                            value:0,
                            readOnly:false,
                            hideTrigger:true
                        },{
                            name:'sessions_per_week',
                            fieldLabel:'Sessions/Week',
                            xtype:'numberfield',
                            value:0,
                            readOnly:false,
                            hideTrigger:true
                        },{
                            name:'total_sessions',
                            fieldLabel:'Total Sessions',
                            xtype:'numberfield',
                            value:0,
                            readOnly:false,
                            hideTrigger:true
                        },{
                            name:'durations_per_session',
                            fieldLabel:'Duration/Session(Hrs)',
                            xtype:'numberfield',
                            value:0,
                            readOnly:false,
                            hideTrigger:true
                        },{
                            name:'total_durations',
                            fieldLabel:'Total Durations(Hrs)',
                            xtype:'numberfield',
                            value:0,
                            readOnly:false,
                            hideTrigger:true
                        },{
                            xtype:'textarea',
                            fieldLabel:'Description',
                            readOnly:false,
                            colspan:2,
                            width:740,
                            name:'description'
                        },{
                            xtype:'hiddenfield', 
                            name:'division_id'
                        },{
                            xtype:'hiddenfield', 
                            name:'standard_id'
                        },{
                            xtype:'hiddenfield', 
                            name:'course_id'
                        },{
                            xtype:'hiddenfield', 
                            name:'degree_id'
                        }
                    ]
            };

        return form;
    }


});