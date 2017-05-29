class AddColumnStudentHandlerToSdnStudent < ActiveRecord::Migration
    def up
      add_column :sdn_students, :handler, :string, limit:2, after: :note
    end
    def down
      remove_column :sdn_students, :handler
    end
end
