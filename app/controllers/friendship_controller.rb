class FriendshipController < ApplicationController
  def req
    @user = current_user
    @friend = User.find(params[:id])
    unless @friend.nil?
      if Friendship.request(@user, @friend)
        flash[:notice] = "Friendship with #{@friend.spec.first_name} requested"
      else
        flash[:notice] = "Friendship with #{@friend.spec.first_name} cannot be requested"
      end
    end
    redirect_to controller:"profile",action:"show",id:current_user.id
  end


  def accept
    @user = current_user
    @friend = User.find(params[:id])
    unless @friend.nil?
      if Friendship.accept(@user, @friend)
        flash[:notice] = "Friendship with #{@friend.spec.first_name} accepted"
      else
        flash[:notice] = "Friendship with #{@friend.spec.first_name} cannot be accepted"
      end
    end
    redirect_to controller:"profile",action:"show",id:current_user.id
  end

  def reject
    @user = current_user
    @friend = User.find(params[:id])
    unless @friend.nil?
      if Friendship.reject(@user, @friend)
        flash[:notice] = "Friendship with #{@friend.spec.first_name} rejected"
      else
        flash[:notice] = "Friendship with #{@friend.spec.first_name} cannot be rejected"
      end
    end
    redirect_to controller:"profile",action:"show" ,id:current_user.id
  end



end
