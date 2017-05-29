class CreateAcdTerms < ActiveRecord::Migration
  def up
    create_table :acd_terms do |t|
      t.string :code, limit:6
      t.string :term_name, limit:50
      t.boolean :is_deleted, default:false

      t.timestamps
    end
  end

  def down
  	drop_table :acd_terms
  end
end
