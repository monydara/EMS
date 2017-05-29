class AddDataAccountNoToNextVersion < ActiveRecord::Migration
  def up
    NextVersion.create n_type:'ACCOUNT NO', description:'' , next_code:1, degit:6 , prefix:"" , campus_id:1

  end
end
