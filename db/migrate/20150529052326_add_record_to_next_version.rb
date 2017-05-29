class AddRecordToNextVersion < ActiveRecord::Migration
  def up
  	NextVersion.create n_type:'STUDENT CODE TC' , description:"Campus Abbr-Batch Code-Degree-Course Abbr-DDMMYY-R000 ", next_code:1 , degit:3, campus_id:1
  	NextVersion.create n_type:'STUDENT NO TC' , description:"Abbr Course+'-'+000000", next_code:1 , degit:6, campus_id:1
  	NextVersion.create n_type:'STUDENT CODE WU' , description:"Campus Abbr-Batch Code-Degree-Course Abbr-DDMMYY-R000 ", next_code:1 , degit:3, campus_id:1
  	NextVersion.create n_type:'STUDENT NO WU' , description:"Batch Code+'-'+000000", next_code:1 , degit:6, campus_id:1
  end

  def down
  	
  end
end
