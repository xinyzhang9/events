class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if !@user.save
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
      
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to "/events"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:location,:state,:password,:password_confirmation)
  end

end
