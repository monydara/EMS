class CreateAcdSubjectTypes < ActiveRecord::Migration
  def change
    create_table :acd_subject_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
