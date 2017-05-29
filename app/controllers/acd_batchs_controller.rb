class AcdBatchsController < ApplicationController
  @@common = CommonFunction.new
	def index
        begin
            @data = AcdBatch.joins(:gen_campus).where(is_deleted: false )
            @result= @data.select("acd_batches.* , gen_campus.campus_name campus")
    		
    		render  @@common.returnJoinPaginate(  @data,  @result, params[:page],params[:limit])
            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end
	end

	def combo
        begin
    		data = AcdBatch.where(is_deleted:false,gen_campus_id:session[:campus_id])
    		render json:{ data:data , success:true}
            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end
	end

	def create
        begin
            AcdBatch.transaction do 
                if !AcdBatch.exists?(code: params[:data][:code],is_deleted:false)
                    @data = AcdBatch.new(permit_data)
                    @data.gen_campus_id=session[:campus_id]
                    @data.is_deleted =false
                    if @data.save
                        auditrail =AuditialController.new;
                        auditrail.create(session[:user_id] , 'Create', 'AcdBatch',"create new batch name=   #{@data.name}","#{params}");
                        render $util.returnSave(@data)
                    else
                        render json: { success: false, errors:  @data.errors, message:'Failure to create batch.' }
                    end
                else
                    render json: { success: false, message: 'batch code already exists.'}
                end
            end 
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end

	end


	def update
        begin
            AcdBatch.transaction do 
                @batch=AcdBatch.find_by code: params[:data][:code], is_deleted:false
                if !@batch.nil?        
                    if @batch.id!=params[:id].to_i
                      render json: { success: false, message: 'Batch code is exists with other record.' }
                      return;
                    end
                end
                @data = AcdBatch.find((params[:id]))
                @data.update_attributes(permit_data)
                if  @data.valid?
                    auditrail =AuditialController.new;
                    auditrail.create( session[:user_id] , 'Update', 'AcdBatch',"Update batch type =   #{@data.name}"," #{params}");
                    render :json => { :data =>  @data , :success => 'true' , :total => 1}
                else
                    render json: { success: false, errors:  @data.errors }
                end

            end
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end


	end

	def destroy
        begin
            AcdBatch.transaction do 
                @data = AcdBatch.find((params[:id]))
                @data.update_attributes(:is_deleted => true)
                if  @data.valid?
                  auditrail =AuditialController.new;
                  auditrail.create( session[:user_id] , 'Delete', 'AcdBatch','delete batch name =   #{@data.name} ',"#{params}");
                  render :json => { :data =>  @data , :success => 'true' , :total => 1}
                else
                  render json: { success: false, errors:  @data.errors }
                end

            end 
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end

        
	end

	private
	def permit_data
		params.require(:data).permit(
					:id,
					:code, 
					:name, 
					:gen_campus_id,
					:khr_name
					
					)		
	end
end
