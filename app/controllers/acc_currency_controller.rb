class AccCurrencyController < ApplicationController
  def index
    render json:{data:AccCurrency.all , success:true}
  end
end
