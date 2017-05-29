class CommonFunction


	# use for generate code with prefix
	def getNextCode(type , campus_id)
		data =NextVersion.find_by n_type:type# (NextVersion.where(n_type:type).limit(1))[0]
		code =0
		if !data.nil?
			code = generateCode(data.prefix, data.next_code , data.degit)
			nextCode = data.next_code+1
			data.update_attributes( next_code:nextCode)
		end

		return code
	end

	def getNextCodeOnly(type , campus_id)
		data =NextVersion.find_by n_type:type# (NextVersion.where(n_type:type).limit(1))[0]
		code =0
		if !data.nil?
			code = generateCode(data.prefix, data.next_code , data.degit)
			
		end

		return code
	end
	# return json data to extjs
	def extjs_ok(data)
		return :json => {:data => data , :success => 'true'}

	end

	def returnPaginate (modelClass,page,limit)

		@data = modelClass.paginate(:page => page, :per_page => limit)
		@total = modelClass.count
       	return  :json => { :data =>  @data , :success => 'true' , :total => @total }

	end

	def returnJoinPaginate (modelClass, joinData,page,limit)
		puts '--------- start join'
		@data = joinData.paginate(:page => page, :per_page => limit)
		puts '----------- start count '
		@total =modelClass.count
       	return  :json => { :data =>  @data , :success => 'true' , :total => @total }

	end

	def returnSave(data)
		if  data.valid?
        	return :json => { :data =>  data , :success => 'true' , :total => 1}
      	else
			return :json =>{ success: false, errors:  data.errors }
     	end

	end

	private
  	def generateCode(prefix,nextCode, degit )

		if prefix.nil?
			prefix = ''
		end
		# l_code=prefix.length

		l_num=nextCode.to_s.length


		zero=''
		while l_num < degit  do
		   zero+='0'
		   degit-=1
		end

		return prefix+zero+(nextCode.to_s)
	end


end
