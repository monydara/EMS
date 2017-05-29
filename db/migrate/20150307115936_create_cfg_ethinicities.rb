class CreateCfgEthinicities < ActiveRecord::Migration
  def up
    create_table :cfg_ethinicities do |t|
      t.string :name
      t.string :khr
      t.boolean :is_deleted

      t.timestamps
    end
  end

  def down
  	drop_table :cfg_ethinicities
  end
end
