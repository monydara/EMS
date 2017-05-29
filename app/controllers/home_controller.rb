class HomeController < ApplicationController
  skip_before_filter :check_session, :only => [:login,:logout]

  def login
		@username = params[:userId]
  		if !@username.nil? && !params[:password].nil?

  			auditrail =AuditialController.new;

        user = SysUser.find_by(:user_id=> params[:userId])

        puts user




		if user && user.password == params[:password]

          campus = GenCampus.find_by(:id=>user.home_campus_id)

					session[:user_id] = user.id
					session[:user_name] = user.user_name
					session[:campus_id] = user.home_campus_id
          session[:campus_name] = campus.campus_name

					auditrail.create(user.id, 'Login', 'System','Login System', '')

          redirect_to root_path

				else
					@message = "Encorrect Username Or Password"

	  				render  '/home/login'
		    end
  		end


  end

  def get_username_campus
    render json:{ campus:session[:campus_name] , username:session[:user_name] , success:true}
  end



  def logout
  		reset_session
  		render '/home/login'
  end

  def index
  	puts "========= render html in putblic page"

  end
end
