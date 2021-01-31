class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def following
    @user = User.find(params[:id])
    @reports = Report.where(reportee_id: @user.id)
  end

  def follower
    @user = User.find(params[:id])
    @reports = Report.where(reportee_id: @user.id)
  end

end
