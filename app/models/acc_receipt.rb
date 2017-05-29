class AccReceipt < ActiveRecord::Base
  belongs_to :acc_charge_item_type
  has_many :acc_receipt_detail , foreign_key:'receipt_id'
  accepts_nested_attributes_for :acc_receipt_detail, :allow_destroy => true
  audited
  has_associated_audits
end
