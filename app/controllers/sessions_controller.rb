class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      flash[:success] = "You have logged in!"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "incorrect password!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
