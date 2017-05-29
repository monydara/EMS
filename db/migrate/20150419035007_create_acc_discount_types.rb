class CreateAccDiscountTypes < ActiveRecord::Migration
  def up
    create_table :acc_discount_types do |t|
      t.string :code, limit:6
      t.string :name, limit:50
      t.boolean :is_del, default:false

      t.timestamps
    end
    AccDiscountType.create :code=>"NOR",:name=>"Normal"
    AccDiscountType.create :code=>"PRO",:name=>"Promotion"
    AccDiscountType.create :code=>"SCL",:name=>"Scholarship"
    AccDiscountType.create :code=>"GOV",:name=>"Goverment"
    AccDiscountType.create :code=>"PAT",:name=>"Partnership"
    AccDiscountType.create :code=>"SPC",:name=>"Special"
    AccDiscountType.create :code=>"OTH",:name=>"Others"

  end

  def down
  	drop_table :acc_discount_types
  end
end
