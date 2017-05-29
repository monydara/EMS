module CourseRelateHelper

    def self.remove_division params 
        data = []
        id = params[:id]
        if !id.nil?
            data = AcdFacultyDivision.find(id)
            data.destroy
        end
        data    
    end
    def self.add_faculty_division params
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        division_id = params[:division_id]
        data = [] 
        if  !degree_id.nil? && !course_id.nil? && !standard_id.nil? && !division_id.nil? 
            data = AcdFacultyDivision.create( degree_id:degree_id, course_id:course_id , standard_id:standard_id , division_id:division_id)
        end
        data
    end 
    def self.check_acd_division params 
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        division_id = params[:division_id]
         result = AcdFacultyDivision.exists?( degree_id:degree_id, course_id:course_id , standard_id:standard_id , division_id:division_id)
        result 
    end
    def self.get_faculty_division params 
         degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        data = [] 
        if !degree_id.nil? && !course_id.nil? && !standard_id.nil?
            data = AcdFacultyDivision.joins(:acd_class_division, 
                :acd_standard , 
                :acd_course_faculty , 
                :acd_degree
                ).select(
                "acd_faculty_divisions.* , 
                acd_class_divisions.name division_name , 
                acd_standards.name standard_name ,
                acd_course_faculties.name course_name ,
                acd_degrees.name degree_name 
                ").where(
                    degree_id:degree_id, 
                    course_id:course_id, 
                    standard_id:standard_id
                )
        end
        data 

    end
    def self.remove_standard params 
        data = []
        id = params[:id]
        if !id.nil?
            data = AcdFacultyStandard.find(id)
            data.destroy
        end
        data        
    end
    def self.get_course_degree_data params

        data = []
        degree_id = params[:degree_id]
        if !degree_id.nil?
            data = AcdDegreeCourse.joins(:acd_degree,:acd_course_faculty).select("
                acd_degree_courses.id ,
                acd_degree_courses.course_id,
                acd_course_faculties.name ,
                acd_course_faculties.code
                ").where(degree_id:degree_id)
        end

        return data

    end
    def self.add_faculty_standard params 
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        data = []
        if !degree_id.nil? && !course_id.nil? && !standard_id.nil?
            data = AcdFacultyStandard.create( degree_id:degree_id, course_id:course_id , standard_id:standard_id)
        end
        data 
        
    end

    def self.check_acd_standard params 
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        result = AcdFacultyStandard.exists?( degree_id:degree_id, course_id:course_id , standard_id:standard_id)

        result 
    end

    def self.add_faculty params
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        data = []
        if !degree_id.nil? && !course_id.nil?
            data =AcdDegreeCourse.create(degree_id:degree_id, course_id:course_id)
        end

        data
    end

    def self.check_faculty_exist params
        degree_id = params[:degree_id]
        course_id = params[:course_id]

        result =  AcdDegreeCourse.exists?(degree_id:degree_id, course_id:course_id)

        result
    end

    def self.remove_faculty params
        data = []
        id = params[:id]
        if !id.nil?
            data = AcdDegreeCourse.find(id)
            data.destroy
        end
        data

    end

    def self.get_faculty_standard params
        data =  []
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        if !degree_id.nil? && !course_id.nil?
            data = AcdFacultyStandard.joins(:acd_standard).where( degree_id:degree_id ,
                course_id:course_id).select(" acd_faculty_standards.* , acd_standards.name ")
        end
        data
    end
end
