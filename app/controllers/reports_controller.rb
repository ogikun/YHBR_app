class ReportsController < ApplicationController

  def create
    report = Report.new(report_params)
    report.user_id = current_user.id
    report.save
    UserMailer.report_email(report).deliver
    redirect_back(fallback_location: root_path)
  end

  def destroy
    report = Report.find(params[:id])
    if params[:message].present?
      message = params[:message]
    else
      massage = "なし"
    end
    report.destroy
    if current_user.id != report.user_id
      UserMailer.reflection_email(report, message).deliver
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def report_params
    params.require(:report).permit(:title, :body, :reportee_id)
  end
end
