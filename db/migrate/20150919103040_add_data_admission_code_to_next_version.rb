class AddDataAdmissionCodeToNextVersion < ActiveRecord::Migration
  def up
    NextVersion.create n_type:'ADMISSION NO. TC', description:'',next_code:1,degit:6,prefix:'' , campus_id:1
    NextVersion.create n_type:'ADMISSION NO. WU', description:'',next_code:1,degit:6,prefix:'' , campus_id:1
  end
end
