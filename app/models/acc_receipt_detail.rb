class AccReceiptDetail < ActiveRecord::Base
  belongs_to :acc_receipt , foreign_key:"receipt_id"
  audited :associated_with => :acc_receipt
end
