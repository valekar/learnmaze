class CommentsController < ApplicationController

  def index

  end

  def create
    @comment = Comment.build_from(params[:comment][:commentable_id],params[:comment][:commentable_type],current_user.id,params[:comment][:body])

   respond_to do |format|
    if @comment.save
       format.html {redirect_to root_url}
       format.js
    end
   end

  end

end
