class PostsController < ApplicationController
  # Execute this filter to set the to keep our code DRY
  before_filter :find_post, only: [:show, :edit, :update, :vote]
  before_filter :require_user, only: [:new, :create, :edit, :update, :vote]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	# Create a post using model backed forms
  	@post = Post.new(post_params)
    @post.user = current_user
    
   	if @post.save
      flash[:notice] = "Thanks for creating a post!"
  		redirect_to posts_path
  	else #validation failure
  		render :new
  	end
  end

  def edit
    
  end
  
  def update
  
  end

  def vote
    binding.pry
    Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html do
        flash[:notice] = "Thanks for voting!"
        redirect_to :back
      end

      format.js
    end
   end

  private

  def post_params
    params.permit(post: [:title, :description, :url])[:post]
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
  end

end
