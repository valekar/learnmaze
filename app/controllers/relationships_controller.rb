class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to controller:'profile',action:'show',id:current_user.id
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to controller:'profile',action:'show',id:current_user.id
  end

end
