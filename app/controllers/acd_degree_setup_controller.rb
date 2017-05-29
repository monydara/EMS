class AcdDegreeSetupController < ApplicationController

	def getDegreeCourse
		data = []
		d_id = params[:degree_id]
		if params[:degree_id]
			puts("******** #{d_id}")
			
			data = AcdDegreeCourse.joins(:acd_degree,:acd_course_faculty)
			.select("acd_course_faculties.id as id,
			acd_degree_courses.id AS degree_course_id, 
			acd_degree_courses.degree_id AS degree_id, 
			acd_degree_courses.course_id AS course_id,
			acd_course_faculties.code AS code,
			acd_course_faculties.name AS name,
			acd_course_faculties.status as status,
			acd_course_faculties.abbr AS abbr")
			.where(degree_id:d_id)

			render json:{success:true,data:data}

		else
			render json:{success:false,data:data}
		end		
	end


	def getCourseSubject
		data = []
		c_id = params[:course_id]
		d_c_id = params[:degree_course_id]  # id of correspondent course and degree
		puts("******* #{c_id}")

		if params[:course_id] && params[:degree_course_id]
			# result = AcdCourseSubject.joins(:acd_course_faculty).select("acd_course_subjects.acd_subject_id").where( acd_course_id:c_id ) # select  subject id
			# data = result

			# arr_id = Array.new
			# result.each do |row|
			# 	puts("****** #{row.acd_subject_id}")
			# 	arr_id << row.acd_subject_id  # pushing value to an array
			# end
	
			# data = AcdSubject.select("id,code,name").where(id:arr_id)  # find records that its id in the array 

			data = AcdCourseSubject.joins(:acd_subject,:acd_course_faculty).select("acd_subjects.id as id,
			acd_course_subjects.id AS acd_course_subject_id, 
			acd_course_subjects.acd_course_id AS acd_course_id, 
			acd_course_subjects.acd_subject_id AS acd_subject_id,
			acd_subjects.code AS code,
			acd_subjects.name AS name")
			.where(acd_course_id:c_id , degree_course_id:d_c_id)

			# if !data.blank?	
			# 	render json:{success:true,data:data}
			# else
			# 	render json:{success:false,data:data} 
			# end
			render json:{success:true,data:data}
		else
			render json:{success:false,data:data}

		end
		
	end

	def removeCourse  # remove course from Degree, table AcdDegreeCourse ,*****  also all subject in table AcdCourseSubject where id of course and degree id is matched
		data = []
		if !params[:id].nil?
				### remove course
			data = AcdDegreeCourse.find(params[:id])  # id is the degree_course_id
		    data.delete
			
				# ## remove all subjects in the course 
			 # arr_id = Array.new
			 # dataCourseSubject = AcdCourseSubject.where(acd_course_id: params[:course_id] ,degree_course_id:params[:id])
			 # dataCourseSubject.each do |row|
			 # 	arr_id << row.id  # getting all id that we want to delete to store in an array
			 # end
			 # dataCourseSubject = AcdCourseSubject.find(arr_id)
			 # dataCourseSubject.delete

			 AcdCourseSubject.where(acd_course_id: params[:course_id] ,degree_course_id:params[:id]).delete_all
			 

			render json:{ data:data , success:true , message:"Remove Success"}
		else
			render json:{ message:"Can't Remove Standard without id "}		
		end	
	end

	def removeSubject  # remove subject from Course, Table AcdCourseSubject
		if !params[:id].nil?
			data = AcdCourseSubject.find(params[:id])
			data.delete
			render json:{ data:data , success:true , message:"Remove Success"}
		else
			render json:{ message:"Can't Remove Standard without id "}		
		end	
	end


	####### adding course to degree
	def addDegreeCourse
		course_id = params[:course_id]
		degree_id = params[:degree_id]

		data = AcdDegreeCourse.new(degree_id: degree_id , course_id: course_id)
		data.save
		render json:{data:data , success:true}
	end

	####### adding subject to course
	def addCourseSubject
		course_id = params[:course_id]
		subject_id = params[:subject_id]
		d_c_id = params[:degree_course_id]

		data = AcdCourseSubject.new(acd_course_id: course_id , acd_subject_id: subject_id , degree_course_id: d_c_id)
		data.save
		render json:{data:data , success:true}
	end

	###### get course of TC , WU
	def getCourseTC
		condition = ''
		if !params[:keyword].nil?
			text = '%'+params[:keyword]+'%'
			condition = "code LIKE '#{text}'" + " OR name LIKE '#{text}'" + 
			" OR abbr LIKE '#{text}'" + " OR course_type LIKE '#{text}'" + " OR khr_name LIKE '#{text}'"
		end
		puts("***************** #{condition}")

		data = AcdCourseFaculty.where(is_deleted:false,course_type:'TC')
		data = data.where(condition)

		render json:{ data:data , success:true }
	end

	def getCourseWU
		condition = ''
		if !params[:keyword].nil?
			text = '%'+params[:keyword]+'%'
			condition = "code LIKE '#{text}'" + " OR name LIKE '#{text}'" + 
			" OR abbr LIKE '#{text}'" + " OR course_type LIKE '#{text}'" + " OR khr_name LIKE '#{text}'"
		end
		puts("***************** #{condition}")

		data = AcdCourseFaculty.where(is_deleted:false,course_type:'WU')
		data = data.where(condition)

		render json:{ data:data , success:true }
	end

	
end
=begin


class CourseRelateController < ApplicationController

	def getCourseBatch
		data = []
		if params[:course_id]
			data = AcdBatchCourse.joins(:acd_batch).select(" acd_batch_courses.id , acd_batches.code , acd_batches.name ").where(course_id:params[:course_id])
		end

		render json:{ data:data, success:true }
	end

	def getCourseDegree
		data = []
		if params[:course_id]
			data = AcdDegreeCourse.joins(:acd_degree).select(" acd_degree_courses.id , acd_degrees.name , acd_degrees.abbr").where(course_id:params[:course_id])
		end
		render json:{ data:data , success:true}
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
			data = AcdCourseMajor.joins(:acd_major).select("acd_course_majors.id , acd_majors.code, acd_majors.name , acd_course_majors.is_default").where(course_id:params[:course_id])
		end
		render json:{ data:data , success:true}
	end
end
=end
