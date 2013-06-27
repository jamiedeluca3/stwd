class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_username(params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: "Welcome, you've logged in!"
		else
			flash[:error] = "Invalid username or password. Please enter the correct credentials or use the register link if you are a new user."
			redirect_to login_path
			#render :new
		end
	end

	def destroy
		# User Log Out
		session[:user_id] = nil
		redirect_to root_path, notice: "You've logged out."
	end

end