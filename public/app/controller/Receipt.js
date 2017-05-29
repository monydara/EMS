Ext.define('ExtDesktop.controller.Receipt', {
  extend: 'Ext.app.Controller',
  stores: [
    'acc.Receipt',
    'acc.ChargeItemTypeS',
    'acc.PaymentMethodS',
    'acc.ChargeItemS',
    'sdn.Lead',
    'acc.ReceiptDetail',

    'combo.DiscountItem',
    'combo.DiscountItemDetail',
    'combo.ChargeItem',
  ],
  views: [
    'module.receipt.Index',
    'module.receipt.Win',
    'module.receipt.Pay',
    'module.receipt.WinSearch',

    'module.receipt.WinDiscount',
    'module.receipt.WinAdhocCharge',

    'search.GridStudent',
    'search.GridLead',
    'module.receipt.WinStudent',
    'module.receipt.WinLead',

  ],
  init: function(app) {
    var me = this;
    //Util.ajax("/AccPlanMasters/getExchangeRate", {}, me.setExchangeRate, me);

    this.control({
      'GridReceipt button[action=Create]': {
        click: this.showForm
      },
      'GridReceipt button[action=Edit]': {
        click: this.showFormEdit
      },

      'GridReceipt button[action=AdvanceSearch]': {
        click: this.showFormAdvanceSearch
      },
      'winReciept button[action=Cancel]': {
        click: this.closeForm
      },
      'winReciept button[action=Save]': {
        click: this.save
      },
      'winReciept combo[name=ref_type]': {
        select: this.showFormSearch
      },


      'winRecieptPay button[action=Cancel]': {
        click: this.closeForm
      },
      'winRecieptPay button[action=Pay]': {
        click: this.ProcessPayment
      },
      'winReciept numberfield[name=khr_amount]': {
        keyup: this.setRate
      },
      'winReciept combo[name=acc_charge_item_type_id]': {
        change: this.ChargeItemTypeChange
      },
      'winReciept button[action=AddDiscount]': {
        click: this.showFormDiscount
      },
      'winReciept button[action=RemoveItem]': {
        click: this.removeItemDetail
      },
      'winReciept button[action=AdhocCharge]': {
        click: this.showFormAdhocCharge
      },
      'winReciept checkbox[name=is_usd]':{
        change : this.setFieldKhr
      },
      'winReciept checkbox[name=is_khr]':{
        change : this.setFieldDollar
      },

      'winLeadSearch button[action=Cancel]': {
        click: Util.closeWindow
      },
      'winLeadSearch textfield[name=search]': {
        change: this.filterLead
      },
      'winLeadSearch grid': {
        itemdblclick: this.selectLead
      },
      'winLeadSearch button[action=Ok]': {
        click: this.selectLeadOk
      },
      // grid student search
      'winStudentSearch button[action=Cancel]': {
        click: Util.closeWindow
      },
      'winStudentSearch grid': {
        itemdblclick: this.selectStudent
      },
      'winStudentSearch button[action=Ok]': {
        click: this.selectStudentOk
      },

      'winStudentSearch textfield[name=search]': {
        change: this.filterStudent
      },
      // win addhoc charge
      'winAdhocChargeReciept button[action=Cancel]': {
        click: Util.closeWindow
      },
      'winAdhocChargeReciept button[action=Ok]': {
        click: this.addAdhocCharge
      },
      'winAdhocChargeReciept combo[name=item_charge_id]': {
        select: this.setValuePriceToPrice
      },
      // win discount action
      'winDiscountReciept button[action=Cancel]': {
        click: Util.closeWindow
      },
      'winDiscountReciept combo[name=fee_charge_id]': {
        change: this.filterDsicountItemDetail
      },
      'winDiscountReciept combo[name=discount_item_detail_id]': {
        select: this.setReadOnlyOnCustomValue
      },
      'winDiscountReciept button[action=Ok]': {
        click: this.addItemDiscount
      }
    });

  },
  exchageRate: 0,
  gbReceiptGrid: null,
  recieptForm: null,

  showFormPaid:function(store , rec){

      var win = Ext.create('ExtDesktop.view.module.receipt.Pay');
      var form = win.down('form');

      form.loadRecord(rec);
      field= form.down("numberfield[name=clear_amount]")
      field.minValue = Number(rec.get('usd_amount'))
      field.maxValue = Number(rec.get('usd_amount'))
      win.show();
      win.center();
      field.focus(true , 200)


  },
  setFieldDollar:function(field, value){
    var me = this ;
    if (value) {
        var form = field.up('form');
        form.down("checkbox[name=is_usd]").setValue(false);
        var usd_amount = form.down("numberfield[name=usd_amount]").getValue();
        var khr_amount = me.exchageRate * usd_amount ;
        form.down("numberfield[name=khr_amount]").setValue(khr_amount);
    };
  },
  setFieldKhr:function(field , value){
    if (value) {
        var form = field.up('form');
        form.down("checkbox[name=is_khr]").setValue(false);
        form.down("numberfield[name=khr_amount]").setValue(0);
    };

  },
  removeItemDetail:function(btn){
    var record = Util.getRecord(btn , "Please select record for delete");
    var store = this.getAccReceiptDetailStore();
    var me = this ;

    if (record) {

      Ext.MessageBox.confirm('Confirm', 'Are you sure you want remove this item?', function(btn) {
        if (btn == 'yes') {
            if (record.get('id') > 0) {
              record.set("_destroy", true);
              debugger;
            }else{
              store.remove(record);

            };
            me.calculateGridAmount();
        }
      });
    };

  },
  calculateGridAmount:function(){
    var win = this.recieptForm,
    me = this;
    var store = this.getAccReceiptDetailStore();
    var chargeAmount = 0 ;
    var discountAmount = 0 ;
    var discountPercentag = 0;
    var totalDiscountAmount = 0 ;
    store.each(function(record){
      if (record.get("_destroy")  != true ) {

        if (record.get("item_type") == "C") {

           chargeAmount+=Number(record.get("amount"));

        }else{

          if (record.get("item_unit") == "A") {
            discountAmount+=Number(record.get("amount"));
          } else{
            discountPercentag+= Number(record.get("amount"));
          };

        };

      };

    });

    totalDiscountAmount =  (discountPercentag/100*chargeAmount) + discountAmount;

    win.down("numberfield[name=charges_amount]").setValue(chargeAmount);
    win.down("numberfield[name=discount_amount]").setValue(totalDiscountAmount);
    win.down("numberfield[name=paid_amount]").setValue( chargeAmount -  totalDiscountAmount );
    win.down("numberfield[name=usd_amount]").setValue(chargeAmount -  totalDiscountAmount );


    if (win.down("checkbox[name=is_khr]").getValue()) {
        me.setFieldDollar(win.down("numberfield[name=charges_amount]"), true);
    }

  },
  addAdhocCharge: function(btn) {
    var win = btn.up('window');
    var form = win.down('form'),
      values = form.getValues();
    if (form.getForm().isValid()) {
      var record = win.down('combo[name=item_charge_id]').store.getById(values.item_charge_id);

      console.log(record.data);
      var model = Ext.create("ExtDesktop.model.acc.ReceiptDetail", {
        "item_type": "C",
        "item_id": values.item_charge_id,
        "amount": values.charge_amount,
        "description": values.description,
        "item_name": record.get("item_name"),
        "item_unit": "A"
      });
      var store = this.getAccReceiptDetailStore();

      store.add(model);

      this.calculateGridAmount();

      win.close();
    };
  },
  setValuePriceToPrice: function(field, obj) {
    var rec = obj[0];
    var form = field.up('form'),
      chargeField = form.down('numberfield[name=charge_amount]');
      if (rec.get("is_editable")) {
          chargeField.setReadOnly(false)
      }else{
          chargeField.setReadOnly(true)

      };

    chargeField.setValue(rec.get('charge_amount'));
  },
  addItemDiscount: function(btn) {
    var win = btn.up('window');
    var form = win.down('form'),
      values = form.getValues();
    if (form.getForm().isValid()) {
      var record = win.down('combo[name=discount_item_detail_id]').store.getById(values.discount_item_detail_id);
      console.log(record);
      var model = Ext.create("ExtDesktop.model.acc.ReceiptDetail", {
        "item_type": "D",
        "item_id": values.discount_item_detail_id,
        "amount": values.custom_discount,
        "description": values.description,
        "item_name": record.get("discount_item"),
        "item_unit": record.get("discount_unit")
      });
      var store = this.getAccReceiptDetailStore();

      store.add(model);
      this.calculateGridAmount();

      win.close();
    };
  },
  setReadOnlyOnCustomValue: function(field, obj) {
    var rec = obj[0];
    var customField = field.up('form').down('numberfield[name=custom_discount]');
    customField.setReadOnly(!rec.get('is_allow_edit'));
    customField.setValue(rec.get('discount_value'));

    if (rec.get('is_allow_edit')) {
      customField.focus(true, 300);
    };
  },
  filterDsicountItemDetail: function(field, value) {
    var store = this.getComboDiscountItemDetailStore();
    store.load({
      params: {
        id: value
      }
    });

    // reset value to item discount
    field.up('window').down('combo[name=discount_item_detail_id]').setValue('');
  },
  selectLeadOk: function(btn) {

    var win = btn.up("window");
    var textfield = win.down('textfield[name=search]'),
      grid = textfield.up('grid');

    var record = Util.getRecord(textfield, "Please select lead record");

    if (record) {
      this.selectLead(grid, record);
    };

  },
  selectStudentOk: function(btn) {

    var win = btn.up("window");
    var textfield = win.down("textfield[name=search]"),
      grid = textfield.up("grid");

    var record = Util.getRecord(textfield, "Please select student record");

    if (record) {
      this.selectStudent(grid, record);
    };
  },
  selectLead: function(grid, record) {
    var win = grid.up('window');
    var form = this.recieptForm;
    form.down('textfield[name=payer_name]').setValue((record.get("first_name") + " " + record.get("last_name")));
    form.down("hiddenfield[name=ref_id]").setValue(record.get("id"));
    win.close();
  },
  selectStudent: function(grid, record) {

    var win = grid.up('window');
    var form = this.recieptForm;
    form.down('textfield[name=payer_name]').setValue((record.get("first_name") + " " + record.get("last_name")));
    form.down("hiddenfield[name=ref_id]").setValue(record.get("id"));
    win.close();


  },
  filterStudent: function(field, value) {
    var store = field.up('grid').getStore();
    Util.loadStore(store, {
      string: value
    });

  },
  filterLead: function(field, value) {
    var store = this.getSdnLeadStore();
    Util.loadStore(store, {
      string: value
    });

  },
  showFormAdhocCharge: function(btn) {

    var win = Ext.create('ExtDesktop.view.module.receipt.WinAdhocCharge');
    win.show();
    win.center();

  },
  showFormDiscount: function(btn) {
    var win = Ext.create('ExtDesktop.view.module.receipt.WinDiscount');
    win.show();
    win.center();
  },
  showFormSearch: function(field, record) {

    this.recieptForm = field.up('window');

    var value = record[0].get('id');
    var form = field.up('form');
    if (value == "S") {

      var win = Ext.create('ExtDesktop.view.module.receipt.WinStudent');
      win.show();
      win.down('grid').getStore().load();
      form.down('textfield[name=payer_name]').setReadOnly(true);
    } else if (value == "L") {
      var win = Ext.create('ExtDesktop.view.module.receipt.WinLead');
      win.down('grid').getStore().load();
      win.show();
      form.down('textfield[name=payer_name]').setReadOnly(true);
    } else {
      form.down('textfield[name=payer_name]').setReadOnly(false);

    };
  },
  setExchangeRate: function(obj, me) {
    if (obj.success) {
      me.exchageRate = obj.exchageRate;
    };
  },
  setRate: function(field) {
    var me = this;
    var usd_amt = field.up("form").down("numberfield[name=usd_amount]");
    usd_amt.setValue(field.getValue() / me.exchageRate);
  },
  showFormAdvanceSearch: function() {
    var win = Ext.create('ExtDesktop.view.module.receipt.WinSearch');
    win.show();
    win.center();
  },
  closeForm: function(btn) {
    btn.up('window').close();
  },
  showForm: function(btn) {
    this.gbReceiptGrid = btn.up('gridpanel');

    var win = Ext.create('ExtDesktop.view.module.receipt.Win');
    this.getAccReceiptDetailStore().removeAll();
    this.recieptForm = win ;
    win.show();
    win.center();
  },
  showFormEdit: function(btn) {
    var record = Util.getRecord(btn,"Please Select Record For Edit");
    var me = this ;
    if (record) {

      var win = Ext.create('ExtDesktop.view.module.receipt.Win');
      me.recieptForm = win;
      var form = win.down("form");
      form.loadRecord(record);
      if (record.get("khr_amount") > 0 ) {
        win.down("checkbox[name=is_khr]").setValue(true);
      };

      me.getAccReceiptDetailStore().load({
        params:{
          receipt_id : record.get("id")
        }
      });
      win.show();
      win.center();
      //hide save if paid record
      if (record.get("is_paid") == 1) {
        var saveBtn = win.down('button[action=Save]');
        saveBtn.hide();
      }
    };

  },
  save: function(btn) {
    var me = this;
    var store = this.getAccReceiptStore();
    // Util.save(btn,store,'acc.ReceiptM');
    Util.showWaitMsgBox();
    var win = btn.up('window'),
      form = win.down('form'),
      record = form.getRecord(),
      values = form.getValues();
    var model = Ext.create('ExtDesktop.model.acc.ReceiptM');
    values.acc_receipt_detail_attributes = Util.getItemStore(me.getAccReceiptDetailStore());
    if (form.getForm().isValid()) {
      if (!record) {
        model.set(values);
        store.add(model);
      } else {
        record.set(values);
      }
      store.sync({
        success: function(batch, options) {
          if (win) {
            win.close();
          }
          Ext.MessageBox.show({
            title: 'Saved',
            msg: 'Record Save Succeed.',
            icon: Ext.MessageBox.INFO,
            buttons: Ext.Msg.OK
          });
          store.load();
          me.gbReceiptGrid.selModel.deselectAll();
        },
        failure: function(batch, options) {
          store.rejectChanges();
          var msg = batch.proxy.reader.rawData.message;
          Ext.MessageBox.show({
            title: 'Error',
            msg: msg,
            icon: Ext.MessageBox.ERROR,
            buttons: Ext.Msg.OK
          });
        },
        callback: function(batch, options) {

        },
        scope: this
      });
    } else {
      Util.msg("Incorrect Data Entry!");
    }

    Ext.MessageBox.hide();
    // store.load();
  },
  ProcessPayment: function(btn) {
    var pAccReceiptstore = this.getAccReceiptStore();
    var win = btn.up('window'),
      form = win.down('form'),
      record = form.getRecord(),
      values = form.getValues();
      me = this
    if (form.getForm().isValid()) {
      record.set('is_paid', 1);
      record.set('paid_date', Ext.Date.format(new Date(), 'Y-m-d'));
      record.set(values);
      data ={
        id: record.get('id'),
        receipt_no: 0,
        acc_tran_type_id: 1,
        acc_payment_method_id: values['acc_payment_method_id'],
        ref_no: values['ref_no'],
        tran_date: Ext.Date.format(new Date(), 'Y-m-d'),
        amount_usd: record.get('usd_amount'),
        amount_khr: record.get('khr_amount'),
        tranRemark: values['tranRemark'],
        //receipt
        receipt_date: record.get('receipt_date'),
        acc_charge_item_type_id: record.get('acc_charge_item_type_id'),
        payer_name: record.get('payer_name'),
        reference_no: record.get('reference_no'),
        usd_amount: record.get('usd_amount'),
        khr_amount: record.get('khr_amount'),
        remark: record.get('remark'),
        is_paid: 1,
        paid_date: Ext.Date.format(new Date(), 'Y-m-d'),
        is_del: record.get('is_del'),
        receipt_by_id: record.get('receipt_by_id'),
        campus_id: record.get('campus_id')
      }


       Ext.MessageBox.confirm('Confirm', 'Do you want to pay and print this receipt?', function(btn) {
          if ('yes' == btn) {
             Util.ajax("acc_receipts/pay",data , me.afterPayment , {win:win ,pAccReceiptstore:pAccReceiptstore });
          }
      });

    }
  },
  afterPayment:function(obj , param){

       if (param.win) {
          param.win.close();
        }
        param.pAccReceiptstore.load();
         window.open("/AccReceipts/official_receipt_wu.pdf")
        Ext.MessageBox.show({
          title: 'Paid',
          msg: 'Receipt Pay Succeed.',
          icon: Ext.MessageBox.INFO,
          buttons: Ext.Msg.OK
        });

  },
  ChargeItemTypeChange: function(field, value) {
    var store = this.getAccChargeItemSStore();
    store.reload({
      params: {
        item_type_id: value
      }
    });
  }


});
