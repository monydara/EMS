class CfgLookUp < ActiveRecord::Base
	has_many :sys_user, :foreign_key=>'status_id'
end
