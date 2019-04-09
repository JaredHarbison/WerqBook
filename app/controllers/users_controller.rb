class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user 
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    #### need to take queen and admin out
    params.require(:user).permit(:id, :username, :email,
                                 :password, :password_confirmation,
                                 :first_name, :last_name,
                                 :queen, :admin)
  end

end
