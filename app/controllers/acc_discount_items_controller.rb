class AccDiscountItemsController < ApplicationController::UtilController
	def index
		begin			
			data = 	AccDiscountItem.joins(:acc_discount_type).select("acc_discount_items.*,acc_discount_types.name")
			render  :json => { :data =>  data , :success => 'true' , :total => data }
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
		
	end
	
	def combo
		begin			
			data = AccDiscountItem.joins("
					left join acc_discount_courses on acc_discount_courses.discount_item_id = acc_discount_items.id
				").where(" 
					campus_id = ? and is_del = false and ? between effective_date 
					and expired_date and is_all_courses = true 
				", session[:campus_id] , DateTime.now )

			course_id = params[:course_id]
			if !course_id.nil? && !course_id.empty?
				data = data.where " acc_discount_courses.course_id = #{course_id}  "
			end

			render json:{ data:data , success:true }
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end

	end

	def create
		begin
			AccDiscountItem.transaction do 
				@data = AccDiscountItem.new(permit_data)	  
				@data.is_del =false
			    @data.campus_id=session[:campus_id]


			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccDiscountItem',"create new AccDiscountItem =   #{@data.item_name}","#{params}");
			    	render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end			
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end		
	end


	def update
		begin
			AccDiscountItem.transaction do 
				@data = AccDiscountItem.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccDiscountItem',"udpate AccDiscountItem =   #{@data.item_name}"," #{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end	
			end			
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def destroy
		begin
			AccDiscountItem.transaction do 
				@data = AccDiscountItem.find((params[:id]))
				@data.update_attributes(:is_del => true)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccDiscountItem','delete AccDiscountItem =   #{@data.item_name} ',"#{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end

			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end

			

	end
	# ==================== additional item =============
	def getDiscountItemsDetails

		begin					
			id=params[:id].to_i

			if id>0			
				data=AccDiscountItemDetail.where("acc_discount_item_id = ? AND  is_del = ?", id,0)
				render :json => { :data =>  data , :success => 'true' }
			else
				render :json => { :data =>  [], :success => 'true' , :total => 0}
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end		
	end

	def getDiscountCourseDetail
		begin
			id = params[:discount_item_id]
			data = AccDiscountCourse.joins( :acd_course_faculty).select(" acc_discount_courses.* ,
				 acd_course_faculties.code ,
				  acd_course_faculties.abbr , acd_course_faculties.name , acd_course_faculties.course_type ").where(" acc_discount_courses.discount_item_id = #{id}")

			render json:{ data:data , success:true}
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end

	end

	private
	def permit_data
		params.require(:data).permit(
					:id,
					:item_code,
					:item_name,
					:discount_type_id,					
					:effective_date,
					:expired_date,
					:Autherizer,
					:reference_no,
					:is_all_courses,
					:note,
					:campus_id,
					:is_del,
					acc_discount_item_details_attributes: [
						:id,
						:acc_discount_item_id,
						:discount_unit,
						:discount_value,
						:is_allow_edit,
						:note,
						:is_del
					],
					acc_discount_course_attributes:[
						:id,
						:discount_item_id,
						:course_id,
						:_destroy
					]
					
			)		
	end
end
