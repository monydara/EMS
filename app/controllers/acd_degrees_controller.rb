class AcdDegreesController < ApplicationController::UtilController
	def index		
		render $util.returnPaginate(  AcdDegree, params[:page],params[:limit])
	end
	def combo
		data =[]
		if !params[:type].nil?
			data =  AcdDegree.where(degree_type:params[:type])	
		else
			data =AcdDegree.all
		end
		render json:{ data:data , success:true}
	end


	def degreeWU
		render json: {data: AcdDegree.where(degree_type:"WU") , success:true }
	end

# ================= standard function
	def removeStandard
		if !params[:id].nil?
			data = DegreeStandard.find(params[:id])
			data.delete
			render json:{ data:data , success:true , message:"Remove Success"}
		else
			render json:{ message:"Can't Remove Standard without id "}		
		end	
	end

	def getDegreeStandard
		data = []
		if !params[:degree_id].nil?
			
			data = DegreeStandard.joins(:acd_standard).where(degree_id:params[:degree_id]).select("degree_standards.* , acd_standards.code , acd_standards.name , acd_standards.sequence")
		end
		render json:{ data:data , success:true}
	end
	
	def addDegreeStandard
		if !params[:degree_id].nil? && !params[:standard_id].nil?			
			data = DegreeStandard.new()
			data.degree_id = params[:degree_id]
			data.standard_id = params[:standard_id]
			data.save
			render json:{ data:data , success:true }

		else
			render json:{ message:"Error add degree standard without id" , success:false}	
		end
	end

# ============== division function
	def addStandardDivsion
		if !params[:standard_id].nil? && !params[:division_id].nil?			
			data = AcdStandardDivision.new()
			data.stand_degree_id = params[:stand_degree_id]
			data.standard_id = params[:standard_id]
			data.division_id = params[:division_id]
			data.save
			render json:{ data:data , success:true }
		else
			render json:{ message:"Error add degree standard without id" , success:false}	
		end
		
	end

	def removeDivision
		if !params[:id].nil?
			data = AcdStandardDivision.find(params[:id])
			data.delete
			render json:{ data:data , success:true , message:"Remove Success"}
		else
			render json:{ message:"Can't Remove Standard without id "}		
		end	
	end
end
