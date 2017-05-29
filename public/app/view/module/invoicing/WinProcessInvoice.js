var required='<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
Ext.define('ExtDesktop.view.module.invoicing.WinProcessInvoice', {
	extend: 'Ext.window.Window',
	alias: 'widget.WinProcessInvoice',
	title: 'Processing Invoice',
	modal:true,
	height:570,
	width:800,
    bodyPadding:10,
    initComponent: function () {
        var me = this;
        Ext.applyIf(me, {
            items:[ this.formBatch(),this.grid()]
        });
        me.callParent(arguments);
    },

    formBatch:function(){
      var form={
          xtype:'form',

          defaults:{width:360, style:'margin-left:10px'},
          /*fieldDefaults: {
           labelWidth: 125
           },*/
          layout:{
              type:'table',
              columns:2
          },
          items:[
              {
                  xtype:'hiddenfield',
                  name:'billing_process_id'
              },{
                xtype:'hiddenfield',
                name:'group_account_id'
              },{
                  xtype:'textfield',
                  name:'batch_proc_code',
                  fieldLabel:'Batch Code',
                  allowBlank:true,
                  readOnly:true
              },{
                  xtype:'datefield',
                  name:'issue_date',
                  fieldLabel:'Issue Date',
                  allowBlank:false,
                  afterLabelTextTpl: required,
                  value:new Date(),
                  format:'d-M-Y',
                  submitFormat:'Y-m-d',
                  altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
              },{
                  xtype:'datefield',
                  name:'from_date',
                  fieldLabel:'From Date',
                  allowBlank:false,
                  afterLabelTextTpl: required,
                  value:new Date(),
                  format:'d-M-Y',
                  submitFormat:'Y-m-d',
                  altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
              }, {
                  xtype: 'datefield',
                  name: 'to_date',
                  fieldLabel: 'To Date',
                  allowBlank:false,
                  afterLabelTextTpl: required,
                  value:new Date(),
                  format: 'd-M-Y',
                  submitFormat: 'Y-m-d',
                  altFormats: 'dmy|dmY|Ymd|d.m.y|d.m.Y|d/m/y|d/m/Y',
              },{
                  xtype: 'numberfield',
                  name:'due_day',
                  fieldLabel:'Due Day',
                  allowBlank:false,
                  afterLabelTextTpl: required,
                  value:3,
                  minValue:1
              },{
                  xtype: 'textfield',
                  name:'total_invoice',
                  allowBlank:true,
                  fieldLabel:'Total Invoices',
                  readOnly:true
              }
          ]
      };

          return form;
    },

    grid:function(){
      var grid={
          xtype	: 'grid',
          title	: 'Invoice List',
          store	: 'acc.Invoice',
          name	: 'GridInvoiceList',
          border:true,
          height:380,
          stateId: 'stateGrid',
          collapsible: false,
          columnLines :true ,
          autoScroll:true,
          tbar:[
                    '->',
              {
                  text:'Process',
                  action:'Process',
                  iconCls:'icon-simulator'
              },{
                  text:'Print',
                  action:'Print',
                  iconCls:'icon-printer'
              }
          ],
          columns:[
                    {xtype:'rownumberer', text:'No.',align:'center',width:50},
                    {text:'Invoice No',dataIndex:'invoice_no',width:110,align:'center'},
                    {text:'Issue Date',dataIndex:'issue_date',format:'d-M-Y',width:120,align:'center'},
                    {text:'From Date',dataIndex:'from_date',format:'d-M-Y',width:120,align:'center'},
                    {text:'To Date',dataIndex:'to_date',format:'d-M-Y',width:120,align:'center'},
                    {text:'Due date',dataIndex:'due_date',format:'d-M-Y',width:120,align:'center'},
                    {text:'Total Amount',dataIndex:'total_amount',width:120,align:'right'}
                  ],
          viewConfig: {
              getRowClass: function(record, id) {
                  return record.get("_destroy") == true ? "hidden" : "row-error";
              },
              enableTextSelection: true
          }
      };
        return grid;
    },
	buttons:[
	            {text:'<b>Save</b>',action:'Save',iconCls:'icon-save'},
	            {text:'<b>Close</b>',action:'close',iconCls:'icon-cancel', handler:function(){ this.up("window").close()}}
	],
        	
});

