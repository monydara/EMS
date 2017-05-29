class AccTaxRateController < ApplicationController
  @@common=CommonFunction.new

    def index    
        begin
            tabTaxRate = 'acc_tax_rates.'
            tabTaxType = 'acc_tax_types.'
            text = ''
            condition = ''    # used to specify condition whether client want all record or some    
              # check text if user passed to search
            if !params[:text].nil?   # if client pass parameter ,named text to search or not
                text = '%'+params[:text]+'%'  # get parameter from client for search. we make it with % for easy to use with like keyword 
                condition = "#{tabTaxRate}code like '#{text}' " + 
                            " or #{tabTaxRate}description like '#{text}' " + 
                            " or #{tabTaxType}name like '#{text}' " + 
                            " or #{tabTaxRate}tax_rate like '#{text}' "  
            end
         
            data = AccTaxRate.joins(:acc_tax_type)
            result = data.select("acc_tax_rates.*,acc_tax_types.name,
                  (case when acc_tax_rates.is_active=1 then 'Active' else 'Deactive' end) 
                  as status")
                  .where(:is_deleted=>0).order(id: :desc)
         
            result = result.where(condition)

            count = result.length

            data = result.paginate(:page => params[:page], :per_page => params[:limit] )   
            total = result.length   
            render  :json => { :data =>  data , :success => 'true' , :total => total }  
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end
         
    end
    def combo
        @data =AccTaxRate.where is_active:true, is_deleted:false 

        render json:{ data:@data , success:true }

    end


  def create
        # Test status checking
      data = params[:data]  # get root of parameter sending from client so that we can get  parameter value  in the root
      status = data["status"] # get access to parameter status in root
      if (status == "Active") then
          status_active = 1  # set to True
      else
          status_active = 0  # set to False
      end
      
        # validation
      begin  # like try-catch block in java
          AccTaxRate.transaction do     # anyModelName.transaction           
              # isExist = AccTaxRate.find_by(code: codeTax ,is_deleted: false) || AccTaxRate.find_by(tax_type_id: taxTypeId ,tax_rate: rateTax , is_deleted: false)
              isExist = check_code_exist(data)
              if (isExist) then  # check if the code is already existed
               
                  render json:{data:data , success:false , message: "Oop! Tax code: #{data["code"]}  is already exists. . Or same tax type with same tax rate value "}         
              else
                  @data = AccTaxRate.new(permit_data)
                  @data.update_attributes(:is_active => status_active)
                  @data.save
                  render json:{data:@data , success:true}
                 
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
        # Test status checking
        data = params[:data]  # get root of parameter sending from client so that we can get  parameter value  in the root
        status = data["status"] # get access to parameter status in root
        if (status == "Active") then
            status_active = 1  # set to True
        else   # Deactive
            status_active = 0  # set to False
        end

        begin  # like try-catch block in java
          AccTaxRate.transaction do     # anyModelName.transaction
             # data = params[:data]
              codeTax = data["code"]
              #isExist = AccTaxRate.find_by(code: codeTax ,is_deleted: false) || AccTaxRate.find(:id => !data["id"]) 
              isExist = check_code_exist(data)
              if ( isExist ) then  # check if the code is already existed
               
                  render json:{data:data , success:false , message: "Oop! Tax code: #{codeTax}  is already exists . Or same tax type with same tax rate value "}        
              else
                  data = AccTaxRate.find(params[:id])  # for id is passed with url so no need to get its root before acceess to id
                  data.update_attributes(permit_data)
                  data.update_attributes(:is_active => status_active)
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
    begin
        data = AccTaxRate.find(params[:id])
        if data then  # if have that record
             data.is_deleted = 1 # change flage to 1 mean true 
             data.save
             render json:{ data:data,success:true }
        else
             render json:{ data:data,success:false, message:"Failed to delete." }

        end
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message }
    end
      
    
     
  end



  private   # function below it is defined as private (other class can't access)
  def permit_data  # for filter data pass from client , can put any name
    params.require(:data).permit(  # this :data is root passed from client (writer function in store)
     # "id",
      "code",
      "description",
      "tax_type_id",
     # "name",
      "tax_rate",
      "is_active",
      "is_deleted"
     # "status"
    )
  end

  def check_code_exist(data)
     is_exist = false
     
      id = data["id"]
   
      result = AccTaxRate.where("lower(code) = ? AND is_deleted = ? ", data["code"].downcase ,false) # binding method
          # #### To check existing Tax rate type with tax rate value if they have the same  #######
      selectSameTaxType_Rate = AccTaxRate.where("tax_type_id=? AND tax_rate=? AND is_deleted=?", data["tax_type_id"] , data["tax_rate"],false)  # binding method
      if !id.nil? #edit function , if edit client pass id 
          result = result.where.not(id:id)
          if result.count > 0 
             is_exist= true 
          end
          selectSameTaxType_Rate = selectSameTaxType_Rate.where.not(id:id)
          if selectSameTaxType_Rate.count > 0
            is_exist = true
          end
      end 
      
      if result.count > 0 
             is_exist= true 
      end
      if selectSameTaxType_Rate.count > 0
           is_exist= true
      end
     

      return is_exist 
  end

end
