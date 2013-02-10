class ProfileController < ApplicationController
  def show
    @logged_in_user = current_user
    @logged_in_user.spec ||=Spec.new
    @logged_in_spec = @logged_in_user.spec


    #@new_micropost = @logged_in_user.microposts.build




    @other_user = User.find(params[:id])
    @other_user.spec ||= Spec.new
    @other_spec = @other_user.spec


  end

  def view
    @logged_in_user = current_user
    @logged_in_user.spec ||=Spec.new
    @logged_in_spec = @logged_in_user.spec
  end



end
