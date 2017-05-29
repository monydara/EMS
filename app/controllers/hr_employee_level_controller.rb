class HrEmployeeLevelController < ApplicationController
    @@common = CommonFunction.new

  	def combo
  		data = HrEmployeeLevel.where(is_deleted:false)
  		render json:{ data:data , success:true }
    end

    def index
      begin

          data = HrEmployeeLevel.where(is_deleted:false)
          render @@common.returnJoinPaginate( data, data, params[:page],params[:limit])

      rescue Exception=> e
        render json: { success: false,message:e.message }
      end
    end

    def create
        data= params[:data]
          if  same_level(data)
             render json: { data:data,success: false,message:'Error! Name might be the same!' }
          else
            begin
                HrEmployeeLevel.transaction do  
                    data = HrEmployeeLevel.new(permit_data)

                    data.update_attributes(:is_deleted => false) 
                    data.save   
                    #data.emp_level = data.emp_level.downcase        
                    render json: { data:data,success: true,message:'The Employee level has been save!' }
                end
            rescue Exception => e
                render json: {success: false, message:e.message }
             end
          end

    end

    def update
        data= params[:data]
          if  same_level(data)
             render json: { data:data,success: false,message:'Error! Name might be the same!' }
          else
            begin
              data = HrEmployeeLevel.find(params[:id]) 
              data.update_attributes(permit_data)
              #data.emp_level = data.emp_level.downcase 
              render json: { success: true,data:data, message:'The Employee level has been updated!' }

            rescue Exception=> e
              render json: {success: false, message:e.message }
            end
          end
    end

    def destroy
      begin
        data = HrEmployeeLevel.find(params[:id])
        data.update_attributes(:is_deleted => true)

        render json: {data:data, success: true,message:'The Employee level has been deleted!' }

      rescue Exception=> e
        render json: {success: false,message:e.message }

      end
    end

    private
    def permit_data
      params.require(:data).permit(
        :id ,
        :emp_level,
        :khr_emp_level,
        :level_value,
        :description,
        :is_deleted
      )
    end

    def same_level(data)
        exist = false
        id = data["id"]
        puts("********* #{data}")    
        @name = HrEmployeeLevel.where("lower(emp_level) = ? AND is_deleted = ?", data["emp_level"].downcase, false)
        #result = AccTaxRate.where("lower(code) = ? AND is_deleted = ? ", data["code"].downcase ,false) # binding method
        @khname = HrEmployeeLevel.where(" khr_emp_level = ? AND is_deleted = ? ", data["khr_emp_level"], false)
       # puts("********** #{@khname.count}") #{@khname.count} '
       if !id.nil?
          @name = @name.where.not(id:id)
          @khname = @khname.where.not(id:id)
            if @name.count >0  ||  @khname.count > 0 #.count// for have
              exist = true 
            end
      end
      if @name.count >0  ||  @khname.count > 0 #.count// for have
              exist = true 
      end


        return exist 
    end

end