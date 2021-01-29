class UserMailer < ApplicationMailer
  def report_email(report)
    @user = User.find(report.reportee_id)
    @report = report
    mail to: @user.email, subject: 'あなたは通報されました'
  end
end
