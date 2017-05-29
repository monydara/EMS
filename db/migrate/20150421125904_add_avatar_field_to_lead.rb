class AddAvatarFieldToLead < ActiveRecord::Migration
  def self.up
    add_attachment :sdn_leads, :avatar
  end

  def self.down
    remove_attachment :sdn_leads, :avatar
  end
end
