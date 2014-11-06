class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		u = User.where(email:params[:email]).first
		if u && u.authenticate(params[:password])
			# sets the cookie to the browser
			session[:user_id] = u.id.to_s
			redirect_to root_url, notice: "Logged in!"
		else
			flash[:alert] = "Email or password invalid"
			render "new"
			# redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to root_path, notice: "Logged out!"
	end
end