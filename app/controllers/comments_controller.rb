class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments= @commentable.comments

  end

  def new
    @comment = @commentable.comments.new

  end

  def create
    @comment = @commentable.comments.new(params[:comment])

    if @comment.save
      #redirect_to [@commentable,:comments]
      redirect_to root_url
    else
      #flash[:notice] => "Cannot be created"
      render :new
    end
  end


  private
    def load_commentable
      resource,id = request.path.split("/")[1,2]
      @commentable =resource.singularize.classify.constantize.find(id)
    end

    #def load_commentable
     # klass = [Article,Photo,Event].detect{ |c| params["#{c.name.underscore}_id"]}
      #@commentable = Klass.find(params["#{klass.name.underscore}_id"])
    #end

end