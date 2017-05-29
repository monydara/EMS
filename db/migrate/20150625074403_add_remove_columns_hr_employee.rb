class AddRemoveColumnsHrEmployee < ActiveRecord::Migration
  def change
    remove_column :hr_employees, :commune_id
    remove_column :hr_employees, :district_id
    remove_column :hr_employees, :city_id
    remove_column :hr_employees, :country_id
    remove_column :hr_employees, :contact_name
    remove_column :hr_employees, :contact_address
    remove_column :hr_employees, :contact_phone
    remove_column :hr_employees, :contact_email

    add_column :hr_employees, :commune, :string,limit: 50, after: :village
    add_column :hr_employees, :district, :string, limit: 50 , after: :village
    add_column :hr_employees, :city, :string, limit: 50, after: :village
    add_column :hr_employees, :country, :string , limit: 50, after: :village

  end
end
