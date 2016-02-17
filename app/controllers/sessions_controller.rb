class SessionsController < ApplicationController
  def index

  end

  def new
  end

  def login
  	email = params[:email]
  	user = User.find_by_email(email)
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = ['Invalid combination']
  		redirect_to "/sessions"
  	end
  end

  def register
  end

  def destroy
  	reset_session
  	redirect_to "/sessions"
  end
end
