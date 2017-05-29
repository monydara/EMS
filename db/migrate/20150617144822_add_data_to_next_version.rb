class AddDataToNextVersion < ActiveRecord::Migration
  def change
  	NextVersion.create n_type:'RECEIPT', description:'' , next_code:1, degit:6 , prefix:"" , campus_id:1
  end
end
