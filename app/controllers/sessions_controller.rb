class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new' #render doesn't constitute a new request so flash won't  
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
