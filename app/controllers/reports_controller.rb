class ReportsController < ApplicationController

  def create
    report = Report.new(report_params)
    report.user_id = current_user.id
    report.save
    redirect_to user_path(current_user.id)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def report_params
    params.require(:report).permit(:title, :body, :reportee_id)
  end
end
