class AccTaxType < ActiveRecord::Base
  has_many :acc_tax_rates, foreign_key: 'tax_type_id'
end
