class UsersController < ApplicationController
	before_action :user_logged_in, only: [:new]
	def new
	end

	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			redirect_to '/shoes'
		else
			flash[:registration_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def success 
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
