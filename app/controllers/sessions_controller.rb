class SessionsController < Devise::SessionsController
  def new
    redirect_to(:controller => "/login", :action => "index")
  end

end
