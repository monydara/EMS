class AccFinanceTran < ActiveRecord::Base
  belongs_to :sys_users, foreign_key:'user_id'
end
