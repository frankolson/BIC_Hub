class UsersController < ApplicationController
  before_action :set_user

  def show
    @post = Post.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_pic,
                                 :timeline_pic, :bio, :email)
  end
end
