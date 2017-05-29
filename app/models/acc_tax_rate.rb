class AccTaxRate < ActiveRecord::Base
  belongs_to :acc_tax_type, foreign_key: 'tax_type_id'
end
