class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def destroy
    @user = set_user
    authorize! :destroy, @user, :message => "You can't delete yourselves"
    @user.destroy
    redirect_to users_path, notice: "User #{@user.email} was successfully destroyed."
  end

  private

  def set_user
    User.find(params[:id])
  end
end
