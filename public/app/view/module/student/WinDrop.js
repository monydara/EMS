/**
 * Created by hengsophat on 10/14/2015.
 */

var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';

Ext.define('ExtDesktop.view.module.student.WinDrop', {
    extend: 'Ext.window.Window',
    alias: 'widget.winDropAdmission',
    title: 'Drop Admission',
    modal: true,
    autoScroll: true,
    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                this.formDrop()
            ]
        });
        me.callParent(arguments);
    },
    buttons: [{
        text: 'OK',
        iconCls: 'icon-save',
        action: 'DropAdmission'
    }, {
        text: 'Close',
        iconCls: 'icon-delete',
        action: 'Close', 
        handler:function(){
            this.up("window").close();
        }
    }],

    formDrop: function() {
        var form = {
            xtype: 'form',
            name: 'DropForm',
            bodyPadding: 10,
            defaultType: 'textfield',
            fieldDefaults: {
                //labelAlign: 'top',
                msgTarget: 'side',
                width: 300,
                style: 'margin-left:5px'
            },
            layout: {
                type: 'table',
                columns: 2,
                tdAttrs: {
                    align: 'top'
                }
            },
            items: [{
                xtype: 'hiddenfield',
                name: 'student_id'
            }, {
                xtype: 'hiddenfield',
                name: 'admission_id'
            }, {
                fieldLabel: 'Student ID',
                readOnly: true,
                name: 'student_no'
            }, {
                fieldLabel: 'Admission No',
                readOnly: true,
                name: 'admission_no'
            }, {
                xtype: 'combo',
                fieldLabel: 'Drop Type',
                store:'sdn.DropType',
                valueField: 'id',
                displayField: 'name'
            }, {
                xtype: 'datefield',
                fieldLabel: 'Effective Date',
                value: new Date(),
                format: 'd-M-Y',
                afterLabelTextTpl: required
            }, {
                xtype: 'textarea',
                fieldLabel: 'Reason',
                afterLabelTextTpl: required,
                colspan: 2,
                width: 605,
                height: 120
            }]
        };
        return form;
    }

});