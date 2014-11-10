class UsersController < ApplicationController
	skip_before_filter :authorize, :except => [:index]

	def index
		@users = User.all
	end

	def show
		@user = set_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id.to_s
			flash[:success] = "Thank you for signing up!"
			redirect_to root_url
		else
			render "new"
		end
	end

	def edit
		@user = set_user
	end

	def update
		@user = set_user
		if @user.update_attributes(user_params)
			redirect_to user_path(@user), notice: "#{@user.email} has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@user = set_user
		@user.destroy
		redirect_to users_path
	end

	private
	def set_user
		User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end