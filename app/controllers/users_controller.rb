class UsersController < ApplicationController
  def index
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
    @reports = Report.where(reportee_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @report = Report.new
    @reports = Report.where(reportee_id: @user.id)
  end

  # def edit
  #   @user = User.find(params[:id])
  #   if current_user != @user
  #     redirect_to edit_user_path(current_user.id)
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(@user.id)
  # end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
