class SessionsController < ApplicationController

  def create
    @user = User.create_with_omniauth(auth_hash)
    session[:user_id] = @user.id
	redirect_to root_url, :notice => "Signed in!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end