class Acc::GenerateInvoice

	def get_data_invoice account_id	
		
		invoice_item = get_invoice_item account_id
		return invoice_item
	end
	def new_invoice_batch data , group_account_id, campus_id , user_id ,is_save , due_date
		@invoice_list = Array.new

		# get all account
		@list_account = AccAccountMaster.where group_account_id:group_account_id,status:"A" 
		@list_account.each do |d|
			
			new_invoice = AccInvoice.new(
				account_id: d.id , 
				due_date:data.due_date , 
				from_date:data.from_date,
				to_date: data.to_date, 			 
				billing_process_id:data.billing_process_id
			 )
			@invoice = new_invoice_obj new_invoice,campus_id,user_id, is_save,due_date
			@invoice_list << @invoice 
		end 
		@invoice_list 
	end

	
	def new_invoice_obj invoice , campus_id , user_id ,is_save, due_date
		@commonClass = CommonFunction.new
		@admission = get_admission invoice.account_id 
		invoice_item = get_invoice_item invoice.account_id

		# check tc or wu 
		if !invoice.term_id.nil?
			
			# @class =  AcdClassTc.find @admission.class_id
			invoice.course_level_id = 	@admission.c_level_id
			invoice.term_id = @admission.term_id
		
		else 
			# @class = AcdClassWu.find @admission.class_id
			# invoice.standard_id = @class.standard_id
			# invoice.division_id = @class.division_id
			invoice.cycle_type_id = invoice.acc_account_master.cycle_type_id			
		
			
		end
		invoice.total_amount = invoice_item["total_amount"]
		invoice.issue_date = Date.today
		invoice.due_date = invoice.issue_date + (due_date.to_i).days
		invoice.vat_number = invoice.acc_account_master.vat_no
		invoice.campus_id = campus_id 
		if is_save == true 
			
			invoice.invoice_no = @commonClass.getNextCode("INVOICE NO",campus_id)
		else
			invoice.invoice_no =0
			
		end
 		invoice.degree_id = @admission.degree_id
 		invoice.course_id = @admission.course_id
 		invoice.batch_id = @admission.batch_id
 		invoice.is_paid = false 
 		# invoice detail 
 		item_list = Array.new
 		invoice_item["item_list"].each do |d|
 			obj = Hash.new 
 			obj["description"] = d["item_name"]
 			if d["item_type"] == "Tuition Fee"
				obj["item_type"] = "F"	
	 			obj["description"] = "Tuition Fee (Start From #{invoice.from_date.strftime('%d-%b-%Y')} to #{invoice.to_date.strftime('%d-%b-%Y')})"

			elsif d["item_type"] == "Discount"
				obj["item_type"] = "D"	

			elsif d["item_type"] == "Tax"
				obj["item_type"] = "T"	
			else
				obj["item_type"] = "C"	

 			end
 			obj["item_id"] =d["item_id"]
 			obj["amount"] =d["amount"]
 			obj["is_deleted"] =false
 			item_list << obj 		
 		end
 			invoice.acc_invoice_details_attributes = item_list		

		invoice 
	end
	# ================== sub function
	def get_admission account_id
		@data = AccAccountMaster.find account_id 
		@data.sdn_admission		
	end

	def get_invoice_item account_id 
		result = Hash.new{} 

		@item_list =Array.new
		@account = AccAccountMaster.find account_id
		tuition_fee_amount = get_tuition_fee account_id
		
		@discounts = get_item_detial_by_type "D",account_id
		@amounts = get_item_detial_by_type "A",account_id
		@taxs = get_item_detial_by_type "T",account_id
		discount_amount = 0 
		adhoc_charge_amount = 0 
		tax_amount = 0 
		tax  = 0 
		# =========== fee charge
		@item_list << get_item_obj("Tuition Fee", "Tuition Fee", tuition_fee_amount ,@account.fee_plan_detail_id )
		# ========= discount 
		@discounts.each do |d|
			amount = get_amount d, tuition_fee_amount
			discount_amount+=amount
			
			@item_list << get_item_obj(d.item_name ,"Discount", amount , d.id ) 
		end 
		# ======== adhoc charge
		@amounts.each do |d|
			adhoc_charge_amount+= d.item_value
			@item_list << get_item_obj(d.item_name , "Adhoc Charge" , d.item_value, d.id )
		end 
		# ========== tax rate
		@taxs.each do |d|
			total_amount = tuition_fee_amount + adhoc_charge_amount - discount_amount 
			amount = get_amount d ,total_amount 
			tax_amount+= amount
			@item_list << get_item_obj( d.item_name , "Tax" , amount, d.id ) 
		end 
		result["item_list"] = @item_list 
		result["discount_amount"] = discount_amount 
		result["adhoc_charge_amount"] = adhoc_charge_amount
		result["tax_amount"] =tax_amount
		result["tuition_fee_amount"] = tuition_fee_amount
		
		result["total_amount"]= tuition_fee_amount -discount_amount +adhoc_charge_amount +tax_amount
		return result
	end
	def get_item_obj item_name , item_type , amount ,item_id
		obj = Hash.new{}
		obj["item_name"] =item_name 
		obj["amount"] = amount 
		obj["item_type"] = item_type
		obj["item_id"] = item_id 
		obj
	end 
	def get_item_detial_by_type type ,account_id 
		@data =AccAccountDetail.find_by_sql "
				select * from vw_account_detail where account_id = #{account_id} and is_deleted=false and item_type ='#{type}'
			"
	end
	def get_invoice_type account_id
		@data = AccAccountMaster.find account_id 
		term_id = @data.sdn_admission.term_id
		if !term_id.nil? && term_id > 0 
			return "TC"
		else 
			return "WU" 
		end 
	end

	def get_amount data ,total_amount
		if data.item_unit == "P" 
			amount =(total_amount * data.item_value) /100
			return amount	
		else 
			return data.item_value 
		end
		
	end
	def get_tuition_fee account_id
		@data=AccAccountMaster.find account_id
		@data.fee_per_cycle
	end
end