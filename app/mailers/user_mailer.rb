class UserMailer < ApplicationMailer
  def report_email(report)
    @user = User.find(report.reportee_id)
    @report = report
    mail to: @user.email, subject: 'あなたは通報されました'
  end
  
  def reflection_email(report, message)
    @user = User.find(report.user_id)
    @report = report
    @reportee = User.find(report.reportee_id)
    @message = message
    mail to: @user.email, subject: "#{@reportee.name}様が反省しました"
  end

  def report_a_report(report)
    @user = User.find(report.user_id)
    @reportee = User.find(report.reportee_id)
    @report = report
    mail to: ENV["GMAIL_NAME"], subject: "不適切な通報"
  end
end