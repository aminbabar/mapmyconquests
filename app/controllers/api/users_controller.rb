class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)

      # CHECK: THIS PATH
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end


  def show
    @user = User.find_by(id: params[:id])
  
    if @user
      # CHECK: THIS PATH
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private


  # CHECK: .permit()

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
