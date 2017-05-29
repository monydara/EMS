class AccInvoiceDetail < ActiveRecord::Base
  belongs_to :acc_invoice,foreign_key: 'invoice_id'
  belongs_to :acc_discount_item_detail, ->{where item_type: 'DC'}
  belongs_to :acc_charge_item, ->{where item_type: 'AC'}
  belongs_to :acc_tax_rate, ->{where item_type: 'TX'}
  belongs_to :acc_tax_rate, ->{where item_type: 'FC' , edu_type:'TC'}
end
