class CourseRelateController < ApplicationController

	def getCourseBatch
		data = []
		if params[:course_id]
			data = AcdBatchCourse.joins(:acd_batch).select(" acd_batch_courses.id , acd_batches.code , acd_batches.name ").where(course_id:params[:course_id])
		end
		render json:{ data:data, success:true }
	end

	
	def getCourseSubject
		data = []
		if params[:course_id]
			data = AcdCourseSubject.joins(:acd_subject).select("acd_course_subjects.id , acd_subjects.code,acd_subjects.name  ").where(acd_course_id:params[:course_id])
		end
		render json:{ data:data , success:true }
	end
	def getCourseMajor
		data = []
		if params[:course_id]
			data = AcdCourseMajor.joins(:acd_major).select("acd_course_majors.id , acd_majors.code, acd_majors.name , acd_course_majors.is_default , acd_course_majors.major_id ").where(course_id:params[:course_id])
		end
		render json:{ data:data , success:true}
	end
# ===== dara update new function 
	def remove_division
		begin
			data = CourseRelateHelper.remove_division params
			
			render json:{ data:data , success:true}

		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end
	def add_faculty_division
		begin
			if CourseRelateHelper.check_acd_division(params) == false
				data = CourseRelateHelper.add_faculty_division params
				render json:{ data:data , success:true}
			else
				render json:{ success:false , message:'division  is alredy exist '}
			end

		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end
	def get_faculty_division
		begin
			@data = CourseRelateHelper.get_faculty_division params
			render json:{ data:@data , success:true }
		rescue Exception => e
			puts e.message
			render json:{ success:false , message:" have problem on sever, please contact to admin"}

		end


	end
	def getCourseDegree
		begin
			@data = CourseRelateHelper.get_course_degree_data params
			render json:{ data:@data , success:true }
		rescue Exception => e
			puts e.message
			render json:{ success:false , message:" have problem on sever, please contact to admin"}

		end


	end
	def get_faculty_standard
		begin
			data = CourseRelateHelper.get_faculty_standard params
			render json:{ data:data , success:true}
		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end
	def remove_standard
		begin
			data = CourseRelateHelper.remove_standard params
			
			render json:{ data:data , success:true}

		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end
	def add_standard
		begin
			if CourseRelateHelper.check_acd_standard(params) == false
				data = CourseRelateHelper.add_faculty_standard params
				render json:{ data:data , success:true}
			else
				render json:{ success:false , message:'Standard  is alredy exist '}
			end

		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end
	#  ======= add function
	def add_faculty
		begin
			# check faculty is exist in system
			if CourseRelateHelper.check_faculty_exist(params) == false

					data = CourseRelateHelper.add_faculty params
					render json:{ data:data , success:true}
				else
					render json:{ message:"This faculty is already exit in degree", success:false }
			end
		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin" }
		end
	end

	def remove_faculty
		begin
			data = CourseRelateHelper.remove_faculty params
			render json:{ data:data , success:true}

		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end

end
