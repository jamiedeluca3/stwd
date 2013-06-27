class CommentsController < ApplicationController
	before_filter :require_user

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])
		@comment.user = current_user
		
		if @comment.save
			redirect_to post_path(@post), notice: "Your comment was added successfully."
		else
			render '/posts/show'
		end
	end

	def vote
		#binding.pry
		#@comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    flash[:notice] = "Thanks for voting!"
    redirect_to :back
  end

end