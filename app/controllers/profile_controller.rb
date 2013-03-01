class ProfileController < ApplicationController
  def show
    # for others

    @logged_in_user = current_user
    @logged_in_user.spec ||=Spec.new
    @logged_in_spec = @logged_in_user.spec


    @new_micropost = @logged_in_user.microposts.build




    @other_user = User.find(params[:id])
    @other_user.spec ||= Spec.new
    @other_spec = @other_user.spec


  end

  def view

    @data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]

     @feed = FeedEntry.all

    @logged_in_user = current_user
    @logged_in_user.spec ||=Spec.new
    @logged_in_spec = @logged_in_user.spec

    @new_micropost = @logged_in_user.microposts.build


    @feed_items = current_user.feed

    @memberships = Membership.where(user_id:current_user.id)

    @microposts = @logged_in_user.microposts.all






  end



end
