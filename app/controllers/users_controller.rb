class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @report = Report.new
    @reports = Report.where(reportee_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
