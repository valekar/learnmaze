class SpecsController < ApplicationController

  def index

    redirect_to :controller => "users", :action => "index"

  end

  def edit
    @title = "Edit Spec"
    @user = current_user
    @user.spec ||= Spec.new
    @spec = @user.spec


    if param_posted?(:spec)
      if @user.spec.update_attributes(params[:spec])
        flash[:notice] = "changes applied"
        redirect_to root_url
      else

        flash[:notice] = "Please Update "


      end


    end


  end

end
