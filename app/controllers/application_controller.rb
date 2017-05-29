class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token


  before_filter :check_session
  def check_session
    if session[:user_id]
        if session[:expiry_time] && session[:expiry_time].to_datetime  < 30.minutes.ago
            reset_session
            flash[:warning] = 'You was logout.'
            redirect_to '/home/login'
        else
            session[:expiry_time] = Time.now
        end
    else
      #... authenticate
      session[:expiry_time] = Time.now
      flash[:warning] = 'You was logout.'
      redirect_to  '/home/login'
    end
  end

end
