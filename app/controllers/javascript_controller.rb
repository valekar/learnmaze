class JavascriptController < ApplicationController
  def confirm
    session[:javascript_updated] = Time.now
  end

end
