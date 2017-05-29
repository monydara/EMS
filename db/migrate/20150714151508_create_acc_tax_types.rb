class CreateAccTaxTypes < ActiveRecord::Migration
  def up
    create_table :acc_tax_types do |t|
      t.string :code, limit:6
      t.string :name, limit:50
      t.text    :description
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
    drop_table :acc_tax_types
  end
end
