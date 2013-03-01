class SelectCommunityController < ApplicationController
  def index

    @departments = current_user.departments.all

  end
end
