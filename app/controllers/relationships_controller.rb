class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])

    @follow = current_user.follow!(@user)

    # these two variables are used for rendering "profile/relationship_create partial because they contain these two variables"
    @logged_in_user = current_user
    @other_user = @user

   if @follow.save

    respond_to do |format|
       if @javascript_active
        format.js {render "profile/relationship_create"}
       else
        format.html {redirect_to controller:'profile',action:'show',id:@user.id}
       end



    end
   else
     "Hello world "
   end


  end

  def destroy
    @user = Relationship.find(params[:id]).followed

    # these two variables are used for rendering "profile/relationship_delete partial because they contain these two variables"
    @logged_in_user = current_user
    @other_user = @user

    if current_user.unfollow!(@user)

      respond_to do |format|
        if @javascript_active
          format.js { render "profile/relationship_delete"}
        else
          redirect_to controller:'profile',action:'show',id:@user.id
        end


      end


    end
  end
end
