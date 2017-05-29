class AccReceiptsController < ApplicationController
  @@common =CommonFunction.new

  def index
    begin
          data = 	AccReceipt.where("acc_receipts.is_del=? AND acc_receipts.receipt_by_id=? AND acc_receipts.campus_id=?",0,session[:user_id],session[:campus_id])
          render  :json => { :data =>  data , :success => 'true' , :total => data }

    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end

  end

  def official_receipt_wu
    begin
      id = params[:id]
      report  = AccReceiptsHelper.get_receipt_file id
      send_data report.generate, filename: "receipt.pdf",
                type: 'application/pdf',
                disposition: 'attachment'
    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end

  end

  def show
    begin
      @data =	AccReceipt.find(params[:id])
      render  :json => { :data =>  @data , :success => 'true' , :total => @data }

    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end
  end

  def create
    begin
      AccReceipt.transaction do

        @data = AccReceipt.new(permit_data)
        @data.is_del =false
        @data.is_paid =false
        @data.receipt_by_id =session[:user_id]
        @data.campus_id =session[:campus_id]
        @data.receipt_date = DateTime.now()

        if @data.save
          render @@common.returnSave(@data)
        else
          render json: { success: false, errors:  @data.errors }
        end
      end
    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }

    end


  end

  def get_detail
    begin

      data = []
      if !params[:receipt_id].nil?
        data = AccReceiptDetail.where(receipt_id:params[:receipt_id])
      end

      render json:{ data:data , success:true}
    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end
  end

  def update
    begin
      AccReceipt.transaction do
        @data = AccReceipt.find((params[:id]))
        @data.update_attributes(permit_data)

        if  @data.valid?
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Update', 'AccReceipt',"udpate AccReceipt =   #{@data.payer_name}"," #{params}");
          render :json => { :data =>  @data , :success => 'true' , :total => 1}
        else
          render json: { success: false, errors:  @data.errors }
        end
      end

    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end
  end

  def pay

    begin

      @data = AccReceipt.find((params[:id]))

      params[:receipt_no] = @@common.getNextCode("RECEIPT", session[:campus_id])#theCode.to_s.rjust(6,'0')
      AccReceipt.transaction do
        @data.update_attributes(permit_data_pay)
        # insert financal transaction
        @financeTran = AccFinanceTran.new(permit_data_financeTran)
        @financeTran.remark = params[:tranRemark]
        if @financeTran.save
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Create', 'AccFinanceTran',"create new AccFinanceTran =   #{@financeTran.receipt_no}","#{params}");
        end
        # insert receiptsettlement
        @receiptSettlement = AccReceiptsSettlement.new(permit_data_receipt_settlement)
        @receiptSettlement.acc_receipt_id = params[:id]
        @receiptSettlement.acc_finance_tran_id = @financeTran.id
        @receiptSettlement.settl_amount = @financeTran.amount_usd
        @receiptSettlement.settl_date = Date.today.to_s
        if @receiptSettlement.save
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Create', 'AccReceiptsSettlement',"create new AccReceiptsSettlement With receiptid =   #{@receiptSettlement.acc_receipt_id}","#{params}");
        end

        if  @data.valid?
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Update', 'AccReceipt',"udpate AccReceipt =   #{@data.payer_name}"," #{params}");
          render :json => { :data =>  @data , :success => 'true' , :total => 1}
        else
          render json: { success: false, errors:  @data.errors }
        end
      end
    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:"System can not make payment" , error:e}
    end
  end

  def destroy
    begin
      @data = AccReceipt.find((params[:id]))
      @data.update_attributes(:is_del => true)

      if  @data.valid?
        auditrail =AuditialController.new;
        auditrail.create( session[:user_id] , 'Delete', 'AccReceipt','delete AccReceipt =   #{@data.payer_name} ',"#{params}");
        render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
        render json: { success: false, errors:  @data.errors }
      end
    rescue Exception => e
      puts e.backtrace
      render json:{ success:false , message:e.message }
    end


  end

  private
  def permit_data
    params.require(:data).permit(
        :id,
        :receipt_date,
        :receipt_no,
        :receipt_type,
        :ref_type,
        :payer_name,
        :ref_id,
        :usd_amount,
        :khr_amount,
        :charges_amount,
        :discount_amount,
        :remark,
        :is_paid,
        :paid_date,
        acc_receipt_detail_attributes: [
            :id,
            :receipt_id,
            :item_type,
            :item_id,
            :amount,
            :description,
            :created_at,
            :updated_at,
            :item_name,
            :item_unit,
            :_destroy
        ]
    )
  end
  def permit_data_pay
    params.permit(
        :id,
        :receipt_date,
        :receipt_no,
        :acc_charge_item_id,
        :payer_name,
        # :reference_no,
        :usd_amount,
        :khr_amount,
        :remark,
        :is_paid,
        :paid_date,
        :is_del,
        :receipt_by_id,
        :campus_id
    # acc_discount_item_details_attributes: [:id,:acc_discount_item_id,:discount_amount,:discount_p,:is_allow_edit,:note,:is_del]
    )
  end
  def permit_data_financeTran
    params.permit(
        :receipt_no,
        :acc_tran_type_id,
        :acc_reason_type_id,
        :acc_cash_drawer_tran_id,
        :acc_payment_method_id,
        :ref_no,
        :tran_date,
        :amount_usd,
        :amount_khr,
        :commited_date,
        :rollback_date,
        :campus_id
    )
  end
  def permit_data_receipt_settlement
    params.permit(
        :acc_receipt_id,
        :acc_finance_tran_id,
        :settl_amount,
        :settl_date
    )
  end
end

