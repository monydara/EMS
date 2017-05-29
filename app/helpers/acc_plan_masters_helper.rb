module AccPlanMastersHelper
  def self.check_active_exist(plan_master_id , campus_id )
      @master = AccPlanMaster.find plan_master_id

      @data = AccPlanMaster.where.not(id:plan_master_id)

      if @master.is_tc == true
        @data = @data.where(is_active:true , campus_id:campus_id  , fiscal_year:@master.fiscal_year,is_tc:@master.is_tc )
      else
        @data = @data.where(is_active:true , campus_id:campus_id  , fiscal_year:@master.fiscal_year , acd_batche_id:@master.acd_batche_id )
      end

      if @data.count > 0
        # for restult already exist active
        return true
      else
        return false
      end

  end
end
