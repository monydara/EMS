class EmployeeShiftController < ApplicationController

  @@common = CommonFunction.new 

  def is_exist(data)
	  	is_exist = false
	  	id = data["id"]
	  	result = 0
	  	result = HrEmployeeShift.where("lower(shift_name)=? AND is_deleted=? AND campus_id=?",data["shift_name"].downcase,false,true)# lower.shift_name? = lower(shift_name)? 
	  	
	  	if !id.nil? then
	  		result = result.where.not(id:id)
	  		if result.count>0
	  			is_exist = true	
	  		end
	  	end
	  	if result.count>0
	  		is_exist = true		
	  	end
	  	return is_exist
  end

  def index	
    data= HrEmployeeShift.where(:is_deleted => false,:campus_id => session[:campus_id])
    render @@common.returnJoinPaginate( data, data, params[:page],params[:limit])
  end

  def create
  	formdata = params[:data] 
  	exist = is_exist(formdata)
  	if exist then
  		render json: {data:formdata, success: false, message: "Shift_name is existe"}
  	else
  		data = HrEmployeeShift.new(permit_data)
  		data.is_deleted = false 
  		data.campus_id = session['campus_id'] # when user login always store campus and user_id in session 	 
  		data.save
  		render json:{data:formdata, success:true,message: "Succeefull Add"}
  	end

  # 	formdata = params[:data] # catch input values from form
  # 	shift_name = formdata["shift_name"] # catch only column shift_name from form

  # 	# puts "************ this shift_name : #{shift_name}"
  # 	data = HrEmployeeShift.where("lower(shift_name)=? AND is_deleted=? AND campus_id=?",shift_name.downcase,false,true)# lower.shift_name? = lower(shift_name)? 
 	
 	# if data.count>0 then # data.count>0 : data is already exist
 	# 	render json: {data:formdata, success: false, message: "Shift_name is existe"}
 	# else 
 	# 	data = HrEmployeeShift.new(permit_data)
  # 		data.is_deleted = false 
  # 		data.campus_id = session['campus_id'] # when user login always store campus and user_id in session 	 
  # 		data.save
  # 		render json:{data:formdata, success:true,message: "Succeefull Add"}
 	# end


  end
  
  def update
  	formdata = params[:data]
  	existe = is_exist(formdata)
  	puts("********* #{existe}")
  	if existe then
  		render json: {data:formdata, success: false, message: "Shift_name is existe"}
  	else
  		data = HrEmployeeShift.find(params[:id]) 
		data.is_deleted = false
		data.update_attributes(permit_data)
		render json: {data:formdata , success:true, message: "Succeefull Update..."}
  	end
  # 	formdata = params[:data]
  # 	shift_name = formdata["shift_name"]#

  # 	# puts "************ this shift_name : #{shift_name}"
  # 	data = HrEmployeeShift.where("lower(shift_name)=? AND is_deleted=? AND campus_id=?",shift_name.downcase,false,true)# lower.shift_name? = lower(shift_name)? 

  # 	if data.count>0 then
  # 		render json: {data:formdata, success: false, message: "Shift_name is existe"}
  # 	else
		# data = HrEmployeeShift.find(params[:id]) # 
		# data.is_deleted = false
		# data.update_attributes(permit_data)
		# render json: {data:data , success:true, message: "Succeefull Update..."}
  # 	end
  end

  def destroy # this function is not delete data, It just update attribute of column 'is_delete' to true
  		data = HrEmployeeShift.find(params[:id])
  		data.update_attributes is_deleted:true 
  		render json:{ data:data , success:true}
  	
  		
  		# if data then
  		# 	# data.campus_id = session['campus_id'] 
  		# 	data.is_deleted = true
  		# 	data.save
  		# 	render json:{data:data , success: true,message:"Success to delete"}
  		# else 
  		# 	render json:{data:data , success: false, message:"Failed to delete"}
  		# end	
  end

  private   # function below it is defined as private (other class can't access)
	def permit_data  # for filter data pass from client , can put any name
		params.require(:data).permit(
			:id,
			:shift_name,  
			:shift_type,
			:start_time,
			:end_time,
			:description,
			:campus_id
		)
	end

 def combo_emp_shift
    data=HrEmployeeShift.where(:is_deleted => false,:campus_id => session[:campus_id])
    render json:{ data:data , success:true}
 end

end
