Ext.define('ExtDesktop.view.module.student.WinAdvanceSearch', {
    extend: 'Ext.window.Window',
    alias: 'widget.winAdvanceSearch',
    title: 'Advance Search',
    bodyPadding: 10,
    modal: true,
    items: [{
        xtype: 'form',
        defaults: {
            width: 350,
            style: 'margin-left:5px'
        },
        layout: {
            type: 'table',
            columns: 2
        },
        items: [{
                xtype: 'fieldset',
                title: 'Admission Date',
                layout: 'hbox',
                width: 720,
                colspan: 2,
                padding: 10,
                items: [{
                    xtype: 'datefield',
                    name: 'df_from_date',
                    fieldLabel: 'From',
                    format: 'd-M-Y',
                    width: 330,
                    margin: 'margin-left:0',
                    submitFormat: 'Y-m-d'
                }, {
                    xtype: 'datefield',
                    name: 'df_to_date',
                    fieldLabel: 'To',
                    format: 'd-M-Y',
                    width: 330,
                    submitFormat: 'Y-m-d'
                }]
            }, {
                xtype: 'combo',
                fieldLabel: 'Batch',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'name',
                name: 'batch_id',
                store:'combo.Batch'
            }, {
                xtype: 'combo',
                fieldLabel: 'Academic Year',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'name',
                name: 'academic_year_id',
                store:'combo.AcademicYear'
            }, {
                xtype: 'combo',
                fieldLabel: 'Degree',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'name',
                name: 'degree_id',
                store:'combo.Degree'
            }, {
                xtype: 'combo',
                fieldLabel: 'Course',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'name',
                name: 'course_id',
                store:'combo.Course'
            }, {
                xtype: 'combo',
                fieldLabel: 'Major',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'name',
                name: 'major_id',
                store:'combo.Major' 
            }, {
                xtype: 'combo',
                fieldLabel: 'Shift',
                emptyText: 'Select....',
                valueField: 'id',
                displayField: 'tuition_name',
                name: 'shift_id', 
                store:'combo.TuitionTime'
            }, {
                xtype: 'textfield',
                name: 'tf_keyword',
                colspan: 2,
                width: 700,
                fieldLabel: 'Keyword'
            }
            /*{
                xtype: 'datefield',
                fieldLabel: 'From',
                name: 'startDate',
                emptyText: 'Start Date'
            }, {
                xtype: 'combo',
                emptyText: 'Category',
                name: 'category',
                fieldLabel:'Category',
                store: 'StudentCategory',
                valueField: 'studentCatId',
                displayField: 'category',
            }, {
                xtype: 'datefield',
                name: 'endDate',
                fieldLabel: 'To',
                emptyText: 'To Date'
            }, {
                xtype: 'combo',
                emptyText: 'Nationaly',
                name: 'nationality',
                store: 'Nationality',
                fieldLabel:'Nationality',
                valueField: 'nationalityId',
                displayField: 'name'
            }, {
                xtype: 'combo',
                emptyText: 'Status',
                fieldLabel:'Status',
                name: 'status',
                store: 'lookup.Status',
                valueField: 'id',
                displayField: 'name'
            },*/
        ],
    }],

    buttons: [{
        text: 'Search',
        iconCls: 'icon-search',
        action: 'Search'
    }, {
        text: 'Close',
        iconCls: 'icon-delete',
        action: 'Close'
    }]

});