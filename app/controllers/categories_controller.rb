class CategoriesController < ApplicationController
	before_filter :require_user, only: [:new, :create]

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])

		if @category.save
      flash[:notice] = "Thanks for creating a category!"
  		redirect_to root_path
  	else #validation failure
  		render :new
  	end
	end

end