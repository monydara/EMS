Ext.define('ExtDesktop.view.module.class.WinClass', {
	extend: 'Ext.window.Window',
	alias: 'widget.FrmClass',
	title: 'W.U. Class',
    modal:'true',
    height:500 ,
    items:[
        {
            xtype:'form',
            bodyPadding:20,
            defaults: { labelWidth: 115,width:400, margin:'0 0 10px 10px', allowBlank:false},
            layout:{ type:'table',columns:2,tdAttrs:{valign:'top'}},
		items: [{
                xtype: 'textfield',
                fieldLabel: 'Class Code',
                maxLength:15,
                name: 'class_code',
                maxLength : 15

		}, {
            xtype: 'container',
            layout: 'hbox',
            items: [{
                    fieldLabel: 'Program Type',
                    labelWidth: 120,
                    checked: true,
                    xtype: 'radiofield',
                    name: 'program_type',
                    boxLabel: 'Local',
                    inputValue: 'N'
                }, {
                    boxLabel: 'International',
                    xtype: 'radiofield',
                    name: 'program_type',
                    inputValue: 'I',
                    style: 'margin-left:10px'
                }
            ]

        }, {
                xtype: 'textfield',
                fieldLabel: 'Class Name',
                name: 'class_name'
		}, {

                xtype: 'container',
                layout: 'hbox',
                items: [{
                    fieldLabel: 'Study Type',
                    labelWidth: 120,
                    checked: true,
                    xtype: 'radiofield',
                    name: 'is_gpa',
                    boxLabel: 'GPA',
                    inputValue: 'false'
                }, {
                    boxLabel: 'Credit',
                    xtype: 'radiofield',
                    name: 'is_gpa',
                    inputValue: 'true',
                    style: 'margin-left:10px'
                }
                ]
        }, {
            xtype: 'combo',
            fieldLabel: 'Standard',
            store: 'combo.Standard',
            queryMode: 'local',
            name: 'standard_id',
            displayField: 'name',
            valueField: 'id',
            editable: false
		}, {
			xtype: 'numberfield',
			fieldLabel: 'Credit',
			name: 'credit',
			minValue: 0,
			value: 0,
			disabled: true

		}, {
			xtype: 'combo',
			fieldLabel: 'Division',
			valueField: 'id',
			store: 'combo.Division',
			queryMode: 'local',
			displayField: 'name',
			name: 'division_id',
			editable: false
		}, {
			xtype: 'combo',
			fieldLabel: 'Academic Year',
			name: 'academic_year_id',
			store: 'combo.AcademicYear',
			valueField: 'id',
			editable: false,
			displayField: 'name',
			emptyText: 'Select Academic Year...'
		}, {
			xtype: 'combo',
			fieldLabel: 'Room',
			valueField: 'id',
			displayField: 'name',
			editable: false,
			store: 'combo.Room',
			emptyText: 'Select Room..',
			name: 'room_id'
		}, {
			xtype: 'combo',
			name: 'class_shift_id',
			store: 'combo.ClassShift',
			// listeners:Util.selectFirst(),
			valueField: 'id',
			queryMode: 'local',
			displayField: 'name',
			editable: false,
			fieldLabel: 'Class Shift'
		}, {
			xtype: 'datefield',
			name: 'start_date',
			submitFormat: 'Y-m-d',
			format: 'd-M-Y',
			value: new Date(),
			fieldLabel: 'Start Date',
			emptyText: 'Start Date'
		}, {
			xtype: 'datefield',
			name: 'end_date',
			value: new Date(),
			format: 'd-M-Y',
			submitFormat: 'Y-m-d',
			fieldLabel: 'End Date',
			emptyText: 'End Date'

		}, {
            xtype:'fieldset',
            title:'Class Status',
            layout:'hbox',
            defaults:{
                style:'margin:20px 0px 20px 25px'
            },
            items:[
                {xtype:'radiofield',inputValue:'S',boxLabel:'Started',checked:true, name:'status'},
                {xtype:'radiofield',inputValue:'F',boxLabel:'Finished', name:'status'},
                {xtype:'radiofield',inputValue:'P',boxLabel:'Pending', name:'status'},
                {xtype:'radiofield',inputValue:'C',boxLabel:'Cancel', name:'status'}
            ]

        }, {
            xtype:'textarea',
            fieldLabel:'Description',
            //rowspan:2,
            height:100,
            allowBlank:true,
            name:'description'
        }
        ]
	}],
	buttons: [{
		text: '<b>Save</b>',
		action: 'save',
		iconCls: 'icon-save',
		formBind: true,
		type: "submit"
	}, {
		text: '<b>Cancel</b>',
		action: 'cancel',
		iconCls: 'icon-delete'
	}]

});
