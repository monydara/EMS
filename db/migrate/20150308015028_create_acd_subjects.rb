class CreateAcdSubjects < ActiveRecord::Migration
  def change
    create_table :acd_subjects do |t|
      t.string :code
      t.string :name
      t.integer :acd_subject_type_id
      t.string :description
      t.decimal :credit
      t.boolean :is_no_exam
      t.boolean :is_deleted
      t.integer :created_by

      t.timestamps
    end
  end
end
