class SdnCityStatesController < ApplicationController

    @@common = CommonFunction.new
    def index
      begin

        data = SdnCityState.where(is_deleted:false)
        render @@common.returnJoinPaginate(data, data, params[:page],params[:limit])

      rescue Exception=> e
        render json: { success: false,message:e.message }
      end
    end

    def combo
      begin
        data = SdnCityState.where(is_deleted:false)
        render json:{ data:data , success:true }
      rescue Exception => e
        render json:{ success:false , message:e.message}
      end
    end
    def create
      begin
        data = params[:data]
        if same_name data
            render json:{ data:data , success:false , message:'Error! Name might be the same!' }
        else
          SdnCityState.transaction do
                    data = SdnCityState.new(permit_data)

                    data.update_attributes(:is_deleted => false)
                    data.save
                    #data.emp_level = data.emp_level.downcase
                    render json: { data:data,success: true,message:'The city has been saved!' }
                end
        end
      rescue Exception => e
        render josn:{ success:false , message:e.message}
      end
    end

    def update
        data= params[:data]
        if  same_name(data)
           render json: { data:data,success: false,message:'Error! Name might be the same!' }
        else
            begin
              data = SdnCityState.find(params[:id])
              data.update_attributes(permit_data)
              #data.emp_level = data.emp_level.downcase
              render json: { success: true,data:data, message:'The city has been updated!' }

            rescue Exception=> e
              render json: {success: false, message:e.message }
            end
        end
    end

    def destroy
      begin
        data = SdnCityState.find(params[:id])
        data.update_attributes(:is_deleted => true)

        render json: {data:data, success: true,message:'The city has been deleted!' }

      rescue Exception=> e
        render json: {success: false,message:e.message }

      end
    end

    private
    def permit_data
	    params.require(:data).permit(
	        :id ,
	        :city_code,
	        :city_name,
	        :city_name_khr,
	        :description,
	        :is_deleted
	    )
	  end

    def same_name(data)
      exist = false
      id = data["id"]
      puts("********* #{data}")
      @code = SdnCityState.where("lower(city_code) = ? AND is_deleted = ?", data["city_code"], false)
      @name = SdnCityState.where("lower(city_name) = ? AND is_deleted = ?", data["city_name"].downcase, false)
        #result = AccTaxRate.where("lower(code) = ? AND is_deleted = ? ", data["code"].downcase ,false) # binding method
      @khname = SdnCityState.where(" city_name_khr = ? AND is_deleted = ? ", data["city_name_khr"], false)
       # puts("********** #{@khname.count}") #{@khname.count} '
      if !id.nil?
          @code = @code.where.not(id:id)
          @name = @name.where.not(id:id)
          @khname = @khname.where.not(id:id)
            if @code.count >0  || @name.count >0  ||  @khname.count > 0  #.count// for have
              exist = true
            end
      end
      if  @code.count >0  || @name.count >0  ||  @khname.count > 0 #.count// for have
              exist = true
      end


        return exist
    end

end
