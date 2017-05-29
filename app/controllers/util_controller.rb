class UtilController < ApplicationController
	# Global variable for all class easy to call function EX. $util.hello 
	#it will call function hello 
	$util = UtilController.new

	#get new code with prefix 
	# how to call ('CT-',5,User) result "CT-00003"
	def generateCode(prefix,numberOfString,modelClass)
		
		codeNumber=modelClass.maximum("id").to_i+1		
		# l_code=prefix.length
		l_num=codeNumber.to_s.length
		num =numberOfString-l_num.to_i

		i=0
		zero=''
		while i < num  do
		   zero+='0'
		   i+=1
		end

		return prefix+zero+codeNumber.to_s
	end

	def extjs_ok(data)		

		return :json => {:data => data , :success => true}
		
	end

	def returnPaginate (modelClass,page,limit)

		data = modelClass.paginate(:page => page, :per_page => limit)		
		total = modelClass.count
		
       	return  :json => { :data =>  data , :success => 'true' , :total => total }      
		
	end
	def returnJoinPaginate (modelClass,dataQeury,page,limit)

		data = dataQeury.paginate(:page => page, :per_page => limit)		
		total = modelClass.count
		
       	return  :json => { :data =>  data , :success => 'true' , :total => total }      
		
	end

	def returnSave(data)
		if  data.valid?
        	return :json => { :data =>  data , :success => 'true' , :total => 1}
      else
			    return :json =>{ :success=> false, :errors=>  data.errors }
      end
		
	end


end
class Object
	  def is_number?
	    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
	  end

	  def generateCode(prefix,numberOfString)
		
		codeNumber=self.to_i+1		
		# l_code=prefix.length
		l_num=codeNumber.to_s.length
		num =numberOfString-l_num.to_i

		i=0
		zero=''
		while i < num  do
		   zero+='0'
		   i+=1
		end

		return prefix+zero+codeNumber.to_s
	end
=begin
	naming= NamingSery.where('naming_type="Quotation"').first
			name=''
			if !naming.nil?
				name=naming.series 
			end	
		"naming_series".nextCode(Quotation,name,5)
=end
	# how to call column_name_need_to_increas.nextCode(ModelName,PrefixString,lengthOfNumberNotIncludePrefix)
	def nextCode(model,prefix,num)
		# naming= NamingSery.where('naming_type="Sale Invoice"').first
		lastRecord=model.order("id desc").first
		# name=''
		# if !naming.nil?
		# 	name=naming.series 
		# end

		maxNumber=''
			if !lastRecord.nil?
				
				namingSeries=lastRecord[self]
				if !namingSeries.nil?
					i = 0
					length = namingSeries.length

					while i < length  do
						i +=1
					   	 chr=namingSeries[length-i].chr
					   	if (chr).is_number?
					   		maxNumber.insert(0,chr)				   		
					   	else
					   		break
					   	end
					   
					end	
					
				end
				
				
			end
		return  (maxNumber.to_i).generateCode(prefix,num)
	end
end
