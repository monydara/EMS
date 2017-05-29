class SdnLead::Filter

	def get_condition params , condition
		if !params[:string].nil?
	      condition = condition +" and
	        (sdn_leads.first_name like '%#{params[:string]}%'
	          or sdn_leads.last_name like '%#{params[:string]}%'
	          or sdn_leads.khr_first_name like '%#{params[:string]}%'
	          or sdn_leads.khr_last_name like '%#{params[:string]}%'
	          or sdn_leads.phone_no like '%#{params[:string]}%'
	          or sdn_leads.address like '%#{params[:string]}%'
	          )
	      "
	    end

	    if !params[:degree_id].nil?
	       condition = condition+ " and sdn_leads.degree_id = #{params[:degree_id]} "
	    end

	    if !params[:course_id].nil?
	        condition = condition + " and sdn_leads.course_id = #{params[:course_id]} "
	    end

	    if !params[:class_shift_id].nil?
	        condition = condition+ " and sdn_leads.class_shift_id = #{params[:class_shift_id]} "
	    end

	    if !params[:start_date].nil?
	        condition = condition + " and sdn_leads.registered_date between '#{params[:start_date]}' and '#{params[:end_date]}'"
	    end

	    # filter student in form WU and TC
	    if !params[:type].nil?
	         condition = condition + " and acd_degrees.degree_type = '#{params[:type]}'"
	    end
	    condition
	end
	
end