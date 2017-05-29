class HrEmployeesController < ApplicationController
		@@common = CommonFunction.new
	 
	def index
		tabName = 'hr_employees.'
		condition = ''
		if !params[:text].nil?   # if client pass parameter ,named text to search or not
		  text = '%'+params[:text]+'%'  # get parameter from client for search. we make it with % for easy to use with like keyword 
		  condition = "#{tabName}code like '#{text}' " + " or #{tabName}name like '#{text}' " + 
		 			  " or #{tabName}khr_name like '#{text}' " +  " or #{tabName}phone_no like '#{text}' " +
		 			  " or #{tabName}email like '#{text}' "  
		  puts(" ############## #{text} \n #{condition}")
		end


	  	data = HrEmployee.joins(:hr_position , :hr_department).where(condition)	  
	  	result = data.select("hr_employees.* , hr_positions.position position , hr_departments.department department")
	  	render @@common.returnJoinPaginate(  data, result, params[:page],params[:limit])
	end

	def create
		 status = check_exist(params[:data])
		 if(status["is_exist"])
		 		render json:{ data:params[:data], success:false , message:status["message"]}	
		 else
		 	begin
		 		data = HrEmployee.new(permit_data)
		 		data.campus_id = session[:campus_id]
		 		data.save 
		 		render json:{ data:data , success:true}
		 	rescue Exception => e
		 		render json:{ success:false , message:e.message}
		 	end
		 end
		  	
	end
	def update
		data = params[:data]  # get root of parameter sending from client so that we can get  parameter value  in the root
		begin  # like try-catch block in java
		    HrEmployee.transaction do     # anyModelName.transaction
		       # data = params[:data]
		        code = data["code"]
		        status = check_exist(data)
		        if ( status["is_exist"] ) then  # check if the code is already existed
		            puts("********** already exists code: #{code}")
		            render json:{data:data , success:false , message: status["message"]}        
		        else
		            data = HrEmployee.find(params[:id])  # for id is passed with url so no need to get its root before acceess to id
		            data.update_attributes(permit_data)
		            render json: {data:data , success:true}
		        end
		    end         
		rescue Exception => e
		    render json: {
		      message: e.message ,
		      success:false
		    }
		end
	end

	def comboLecturer
			data = HrEmployee.where( status:['PN','PB','RS'], emp_type:'L')
			render json:{ data:data , success:true}
	end

			######## Check code if already exist
	def check_exist(data)
     	obj = Hash.new
     	obj["is_exist"] = false
     
		  id = data["id"]
		  puts("********* #{data}")    
		      # #### To check existing code also case sensitive  #####
		  # result = HrHoliday.where(code:data["code"] , is_deleted: false) 
		  result = HrEmployee.where("lower(code) = ? ", data["code"].downcase ) # binding method
		    
		  if !id.nil? #edit function , if edit client pass id 
		      result = result.where.not(id:id)
		      puts("*************edit #{result.count}")
		      if result.count > 0 
		         obj["is_exist"] = true 
		         obj["message"] = "OOp code #{data['code']} is already exist"
		      end
		     
		  end 
      
	      if result.count > 0 
	             obj["is_exist"] = true 
	             obj["message"] = "OOp code #{data['code']} is already exist"
	      end
	 
	      return obj 
  end


	private 
	def permit_data
	  	params.require(:data).permit(
					:id,
					:code,
					:title_id,
					:name,
					:khr_name,
					:gender,
					:hire_date,
					:birth_date,
					:place_of_birth,
					:emp_type,
					:working_time,
					:emp_level_id,
					:position_id,
					:department_id,
					:shift_id,
					:height,
					:size,
					:basic_salary,
					:id_card_no,
					:passport_no,
					:national_id,
					:ethnicity_id,
					:religion_id,
					:langauge_id,
					:marital_status,
					:spouse_name,
					:no_of_child,
					:studied_child,
					:house_no,
					:street_no,
					:group_no,
					:village,
					:country,
					:city,
					:district,
					:commune,
					:phone_no,
					:email,
					:description,
					:status,
					:photo_path
			)		
	end

end
