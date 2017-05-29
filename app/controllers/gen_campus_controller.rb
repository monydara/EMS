class GenCampusController < ApplicationController::UtilController
  def index
    data = 	GenCampus
    render $util.returnPaginate(  data, params[:page],params[:limit])
  end
end
