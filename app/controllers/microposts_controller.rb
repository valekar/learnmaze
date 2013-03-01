class MicropostsController < ApplicationController
  before_filter :protect, only: [:create, :destroy]

  def index
  end

  def create

    @micropost = current_user.microposts.build(params[:micropost])

    respond_to do |format|

      if @micropost.save
        flash[:success] = "Micropost created!"
        if @javascript_active
          format.js  {render 'profile/micropost_create'}
        else
          #@current_id = current_user.id
          format.html  {redirect_to root_url }
        end

      else
        render 'home/index'
      end

    end

  end

  def destroy

    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    @current_id = current_user.id

    respond_to do |format|
      if @javascript_active
        format.js {render "profile/micropost_delete"}
        format.html {redirect_to root_url}

      else
        format.html { redirect_to root_url }
      end


    end

  end
end
