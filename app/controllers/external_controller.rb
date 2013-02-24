class ExternalController < ApplicationController

    def index
      @user = User.new
      @user.spec ||= Spec.new

       @data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]

      @spec = @user.spec


    end


    def create

      @data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]

      @simple = session["facebook_data"]

      @user = User.new(params[:user])

      if  @user.save
        @user.spec ||= Spec.new
        @spec = @user.spec

        if @data["gender"] == "male"
          @gender = "Male"
        else
          @gender = "Female"

        end



          @user.spec.update_attributes(:first_name => @data["first_name"],last_name:@data["last_name"],gender:@gender,remote_image_url:@simple.info.image.sub("square","large"))


        sign_in_and_redirect @user, :event => :authentication
      else
        redirect_to root_url


      end


    end


end
