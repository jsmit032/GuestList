class SessionsController < ApplicationController
	skip_before_filter :authorize
	
	def new
		@user = User.new
	end

	def create
		user = User.where(email:params[:email]).first
		if user && user.authenticate(params[:password])
			# sets the cookie to the browser
			session[:user_id] = user.id.to_s
			flash[:success] = "Logged in!"
			redirect_to root_url
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render "new"
			# redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		flash[:alert] = "Logged Out!"
		redirect_to login_path
	end
end