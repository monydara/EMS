class HrHolidayController < ApplicationController


  @@common=CommonFunction.new

  def index
        
      condition = 'hr_holidays.id!=-1 '    # used to specify condition whether client want all record or some . we use id!=-1 cus we want to concate with AND keyword for other condition so not no error 
        
        ###### Join table and select only records that not yet deleted  
      data = HrHoliday.joins(:cfg_academic_year)
      result = data.select("hr_holidays.*,(cfg_academic_years.name) as acd_year").where(:is_deleted=>0).order(id: :desc)
      
      acdId = params[:academic_year_id]
      startDate = params[:start_date]
      endDate = params[:end_date]

        ###### check text if user passed to search , Basic search keyword
      tabHoliday = 'hr_holidays.'
      if !params[:text].nil? && !params[:text].empty?  # if client pass parameter ,named text to search or not
          text = '%'+params[:text]+'%'  # get parameter from client for search. we make it with % for easy to use with like keyword 
          condition += " AND (#{tabHoliday}code like '#{text}' " + " or #{tabHoliday}description like '#{text}' " + " or #{tabHoliday}name like '#{text}' " + " or #{tabHoliday}khr_name like '#{text}') "  
          puts(" ############## #{text}")
      end
       
        ###### Advance search checking
      if !acdId.nil? && !acdId.empty?
          condition += " AND academic_year_id=#{acdId}"
      end
      if !startDate.nil? && !endDate.nil?  &&  !startDate.empty? && !endDate.empty?             
          condition += "  AND (   (#{tabHoliday}start_date BETWEEN '#{startDate}' AND '#{endDate}')  
                               OR (#{tabHoliday}end_date  BETWEEN '#{startDate}' AND '#{endDate}') 
                              )
                       "
      end

      result = result.where(condition)  
      data = result.paginate(:page => params[:page], :per_page => params[:limit] )   
      total = result.length
      render  :json => { :data =>  result , :success => 'true' , :total => total}
end



  def create
        
      data = params[:data]  # get root of parameter sending from client so that we can get  parameter value  in the root
      puts("*****************create #{data['code']}")
        # validation
      begin  # like try-catch block in java
          HrHoliday.transaction do     # anyModelName.transaction           
              # isExist = AccTaxRate.find_by(code: codeTax ,is_deleted: false) || AccTaxRate.find_by(tax_type_id: taxTypeId ,tax_rate: rateTax , is_deleted: false)
              status = check_exist(data)
              if (status["is_exist"]) then  # check if the code is already existed
                  puts("********** already exists code: #{data["code"]}")
                  render json:{data:data , success:false , message: status["message"]}         
              else
                  data = HrHoliday.new(permit_data)
                  data.campus_id = session['campus_id'] 
                  data.is_deleted = false 
                  data.save
                  render json:{data:data , success:true}
                  puts("********** not exists code: #{data["code"]}")
              end
          end         
      rescue Exception => e
          render json: {
            message: e.message ,
            success:false
          }
      end
  end


  def update
       
      data = params[:data]  # get root of parameter sending from client so that we can get  parameter value  in the root
      begin  # like try-catch block in java
          HrHoliday.transaction do     # anyModelName.transaction
             # data = params[:data]
              code = data["code"]
              status = check_exist(data)
              if ( status["is_exist"] ) then  # check if the code is already existed
                  puts("********** already exists code: #{code}")
                  render json:{data:data , success:false , message: status["message"]}        
              else
                  data = HrHoliday.find(params[:id])  # for id is passed with url so no need to get its root before acceess to id
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


  def destroy
      #  puts("************Delete id: #{params[:id]}")
     data = HrHoliday.find(params[:id])
      
      if data then  # if have that record
         puts("************Delete id: #{params[:id]}")
         data.is_deleted = 1 # change flage to 1 mean true 
         data.save
         render json:{ data:data,success:true }
      else
         render json:{ data:data,success:false, message:"Failed to delete." }
         puts("************fail to Delete id: #{params[:id]}")
      end
     
  end


  private   # function below it is defined as private (other class can't access)
  def permit_data  # for filter data pass from client , can put any name
    params.require(:data).permit(  # this :data is root passed from client (writer function in store)
      "id",
      "code",
      "name",
      "khr_name",
      "start_date",
      "end_date",
      "academic_year_id",
      "description"
     # "campus_id",
     # "is_deleted"

    )
  end


  def check_exist(data)
     obj = Hash.new
     obj["is_exist"] = false
     
      id = data["id"]
      academic_year_id = data["academic_year_id"]
      puts("********* #{data}")    
          # #### To check existing code also case sensitive  #####
      # result = HrHoliday.where(code:data["code"] , is_deleted: false) 
      result = HrHoliday.where("lower(code) = ? AND is_deleted = ? ", data["code"].downcase ,false) # binding method
        
      if !id.nil? #edit function , if edit client pass id 
          result = result.where.not(id:id)
          if result.count > 0 
             obj["is_exist"] = true 
             obj["message"] = "OOp code #{data['code']} is already exist"
          end
         
      end 
      
      if result.count > 0 
             obj["is_exist"] = true 
             obj["message"] = "OOp code #{data['code']} is already exist"
      end
 
        # check if date in range
      if check_date_range(data["start_date"],data["end_date"],id,academic_year_id) then
          obj["is_exist"] = true 
          obj["message"] = "OOp start and date can not in range of other holiday"
      end

      return obj 
  end


  def check_date_range(startDate,endDate,id,academic_year_id)
      in_range = false
 
       if !id.nil? #edit function , if edit client pass id 
          puts("######### edit")
          data = HrHoliday.find_by_sql("SELECT * FROM hr_holidays 
                                                where is_deleted=false 
                                                AND id!=#{id} AND academic_year_id=#{academic_year_id} 
                                                AND (   ('#{startDate}' BETWEEN start_date AND end_date) 
                                                     OR ('#{endDate}' BETWEEN start_date AND end_date) 
                                                    )
                                      ")
          if data.count > 0
              in_range = true
          end
       else
           puts("######### add")
            data = HrHoliday.find_by_sql("SELECT * FROM hr_holidays 
                                                    where  is_deleted=false 
                                                    AND academic_year_id=#{academic_year_id} 
                                                    AND (   ('#{startDate}' BETWEEN start_date AND end_date) 
                                                          OR ('#{endDate}' BETWEEN start_date AND end_date) ) 
                                        " )
           if data.count > 0
                in_range = true
            end
       end

       return in_range
  end

end

